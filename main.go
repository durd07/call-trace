package main

import (
	"context"
	"fmt"
	_ "github.com/GoAdminGroup/go-admin/adapter/gin"              // 适配器
	_ "github.com/GoAdminGroup/go-admin/modules/db/drivers/mysql" // sql 驱动
	_ "github.com/GoAdminGroup/themes/adminlte"                   // ui主题
	"net"
	"net/http"
	"strconv"

	"github.com/GoAdminGroup/go-admin/engine"
	"github.com/GoAdminGroup/go-admin/examples/datamodel"
	"github.com/GoAdminGroup/go-admin/modules/config"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/modules/language"
	"github.com/GoAdminGroup/go-admin/modules/logger"
	"github.com/GoAdminGroup/go-admin/template"
	"github.com/GoAdminGroup/go-admin/template/chartjs"
	"github.com/gin-gonic/gin"
	"io/ioutil"

	pb "github.com/durd07/subscriber-tracing/api"
	"google.golang.org/grpc"
	"google.golang.org/grpc/peer"

	"github.com/timest/env"
)

type envconfig struct {
	MySQL struct {
		Host string `default:"127.0.0.1"`
		Port int `default:"3306"`
		User string `default:"root"`
		Pwd  string `default:"root"`
		Name string `default:"subscriber_tracing"`
	}
	HTTPPort int `default:"9033"`
	GRPCPort int `default:"9034"`
}

type TraceRequest struct {
	Supi      string `json:"supi"`
	TraceId   int32  `json:"trace_id"`
	Timestamp string `json:"timestamp"`
	Addr      string `json:"address"`
	Message   string `json: "message"`
}

var (
	cfg envconfig
	eng      *engine.Engine
	trace_id int32 = 1
)

func httpServer() {
	r := gin.Default()

	gin.SetMode(gin.DebugMode)
	//gin.SetMode(gin.ReleaseMode)
	gin.DefaultWriter = ioutil.Discard

	eng = engine.Default()

	template.AddComp(chartjs.NewChart())

	if err := eng.AddConfig(config.Config{
		Databases: config.DatabaseList{
			"default": {
				Host:       cfg.MySQL.Host,
				Port:       strconv.Itoa(cfg.MySQL.Port),
				User:       cfg.MySQL.User,
				Pwd:        cfg.MySQL.Pwd,
				Name:       cfg.MySQL.Name,
				MaxIdleCon: 50,
				MaxOpenCon: 150,
				Driver:     db.DriverMysql,
			},
		},
		UrlPrefix: "admin",
		IndexUrl:  "/",
		Debug:     true,
		Language:  language.EN,
	}).
		AddGenerators(Generators).
		Use(r); err != nil {
		panic(err)
	}

	r.Static("/uploads", "./uploads")

	r.GET("/trace_id", func(c *gin.Context) {
		puid := c.Query("supi")
		query := fmt.Sprintf("SELECT 1 FROM subscriber_tracing_config WHERE supi='%s'", puid)
		ret, err := eng.MysqlConnection().Query(query)
		if err != nil {
			c.Header("Trace-Id", "0")
			c.JSON(http.StatusInternalServerError, map[string]interface{}{"error": err.Error(), "trace_id": 0})
		} else if len(ret) == 0 {
			c.Header("Trace-Id", "0")
			c.JSON(http.StatusNotFound, map[string]interface{}{"trace_id": 0})
		} else {
			trace_id++
			c.Header("Trace-Id", strconv.Itoa(int(trace_id)))
			c.JSON(http.StatusOK, map[string]interface{}{"trace_id": trace_id})
		}
	})

	r.POST("/sub_trace", func(c *gin.Context) {
		var req TraceRequest
		err := c.BindJSON(&req)
		if err != nil {
			c.JSON(http.StatusBadRequest, map[string]string{"error": err.Error()})
		}
		fmt.Printf("%v\n", req)

		query := ""
		timestamp, err := strconv.Atoi(req.Timestamp)
		if err != nil {
			query = fmt.Sprintf("INSERT INTO subscriber_tracing (trace_reference_id, supi, timestamp, address, message) VALUES ('%d', '%s', '%s', '%s', '%s')", req.TraceId, req.Supi, req.Timestamp, req.Addr, req.Message)
		} else {
			query = fmt.Sprintf("INSERT INTO subscriber_tracing (trace_reference_id, supi, timestamp, address, message) VALUES ('%d', '%s', FROM_UNIXTIME(%0.6f), '%s', '%s')", req.TraceId, req.Supi, float64(timestamp) / 1000000000, req.Addr, req.Message)
		}

		fmt.Println(query)

		ret, err := eng.MysqlConnection().Exec(query)

		fmt.Printf("%v\n", ret)

		if err != nil {
			c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		} else {
			c.JSON(http.StatusOK, map[string]string{})
		}
	})

	eng.HTML("GET", "/admin", datamodel.GetContent)

	_ = r.Run(":"+strconv.Itoa(cfg.HTTPPort))
}

// server is used to implement helloworld.GreeterServer.
type server struct {
	pb.UnimplementedSubscriberTracingServer
}

func (s *server) ShouldBeTraced(ctx context.Context, in *pb.TraceIdRequest) (*pb.TraceIdResponse, error) {
	p, _ := peer.FromContext(ctx)
	logger.Infof("GRPC shoudBeTraced received from %s : %v", p.Addr.String(), in.Supi)

	query := fmt.Sprintf("SELECT 1 FROM subscriber_tracing_config WHERE supi='%s'", in.Supi)
	ret, err := eng.MysqlConnection().Query(query)
	if err != nil {
		return &pb.TraceIdResponse{TraceId: 0}, err
	} else if len(ret) == 0 {
		return &pb.TraceIdResponse{TraceId: 0}, err
	} else {
		trace_id++
		return &pb.TraceIdResponse{TraceId: trace_id}, err
	}
}

func (s *server) Trace(ctx context.Context, in *pb.SubscriberTracingRequest) (*pb.Bool, error) {
	p, _ := peer.FromContext(ctx)
	logger.Infof("GRPC trace received from %s : %v", p.Addr.String(), in.Supi)

	query := fmt.Sprintf("INSERT INTO subscriber_tracing (trace_reference_id, supi, timestamp, message) VALUES ('%d', '%s', '%s', '%s')", in.TraceId, in.Supi, in.Timestamp, in.Msg)

	ret, err := eng.MysqlConnection().Exec(query)

	fmt.Printf("%v\n", ret)

	if ret != nil {
		return &pb.Bool{Value: true}, err
	} else {
		return &pb.Bool{Value: false}, err
	}
}

func grpcServer() {
	lis, err := net.Listen("tcp", ":"+strconv.Itoa(cfg.GRPCPort))
	if err != nil {
		logger.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
	myserver := server{}

	pb.RegisterSubscriberTracingServer(s, &myserver)
	if err := s.Serve(lis); err != nil {
		logger.Fatalf("failed to serve: %v", err)
	}
}

func main() {
	env.IgnorePrefix()
	err := env.Fill(&cfg)
	if err != nil {
		panic(err)
	}

	fmt.Println("Database Url:", cfg.MySQL.Host)
	fmt.Println("Database Port:", cfg.MySQL.Port)
	fmt.Println("Database User:", cfg.MySQL.User)
	fmt.Println("HTTPPort:", cfg.HTTPPort)
	fmt.Println("GRPCPort:", cfg.GRPCPort)

	go httpServer()
	go grpcServer()

	// Wait forever
	select {}
}
