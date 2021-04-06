package main

import (
	"fmt"
	"net"
	"net/http"
	"context"
	_ "github.com/GoAdminGroup/go-admin/adapter/gin"              // 适配器
	_ "github.com/GoAdminGroup/go-admin/modules/db/drivers/mysql" // sql 驱动
	_ "github.com/GoAdminGroup/themes/adminlte"                   // ui主题

	"github.com/GoAdminGroup/go-admin/engine"
	"github.com/GoAdminGroup/go-admin/examples/datamodel"
	"github.com/GoAdminGroup/go-admin/modules/config"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/modules/language"
	"github.com/GoAdminGroup/go-admin/template"
	"github.com/GoAdminGroup/go-admin/template/chartjs"
	"github.com/GoAdminGroup/go-admin/modules/logger"
	"github.com/gin-gonic/gin"
	"io/ioutil"

	"google.golang.org/grpc"
	"google.golang.org/grpc/peer"
	pb "github.com/durd07/call-trace/call_trace"
)

type TraceRequest struct {
	Puid string `json:"puid"`
	Trace_id int32 `json:"trace_id"`
	Timestamp string `json:"timestamp"`
	Msg string `json: "msg"`
}

var (
	eng *engine.Engine
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
				Host:       "db",
				Port:       "3306",
				User:       "root",
				Pwd:        "root",
				Name:       "call_trace",
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

	r.GET("/should-be-traced", func(c *gin.Context) {
		puid := c.Query("puid")
		query := fmt.Sprintf("SELECT 1 FROM call_trace_config WHERE public_id='%s'", puid)
		_, err := eng.MysqlConnection().Query(query)
		if err != nil {
			c.JSON(http.StatusNotFound, map[string]string{"error": err.Error()})
		} else {
			trace_id++
			c.JSON(http.StatusOK, map[string]int32{"trace_id": trace_id})
		}
	})

	r.POST("/trace", func(c *gin.Context) {
		var req TraceRequest
		err := c.BindJSON(&req)
		if err != nil {
			c.JSON(http.StatusBadRequest, map[string]string{"error": err.Error()})
		}
		fmt.Printf("%v\n", req)

		query := fmt.Sprintf("INSERT INTO call_trace (trace_reference_id, public_id, timestamp, message) VALUES ('%d', '%s', '%s', '%s')", req.Trace_id, req.Puid, req.Timestamp, req.Msg)
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
	//eng.HTML("POST", "/admin/info/call_trace", datamodel.GetContent)
	//ret, _ := eng.MysqlConnection().Query("select * from call_trace")
	//fmt.Println(ret)

	_ = r.Run(":9033")
}

// server is used to implement helloworld.GreeterServer.
type server struct {
	pb.UnimplementedCallTraceServer
}

func (s *server) ShouldBeTraced(ctx context.Context, in *pb.ShouldBeTracedRequest) (*pb.ShouldBeTracedResponse, error) {
	p, _ := peer.FromContext(ctx)
	logger.Infof("GRPC shoudBeTraced received from %s : %v", p.Addr.String(), in.Puid)

	query := fmt.Sprintf("SELECT 1 FROM call_trace_config WHERE public_id='%s'", in.Puid)
	ret, err := eng.MysqlConnection().Query(query)
	if ret != nil {
		return &pb.ShouldBeTracedResponse{TraceId: 0}, err
	} else {
		trace_id++
		return &pb.ShouldBeTracedResponse{TraceId: trace_id}, err
	}

}

func (s *server) Trace(ctx context.Context, in *pb.CallTraceRequest) (*pb.Bool, error) {
	p, _ := peer.FromContext(ctx)
	logger.Infof("GRPC trace received from %s : %v", p.Addr.String(), in.Puid)

	query := fmt.Sprintf("INSERT INTO call_trace (trace_reference_id, public_id, timestamp, message) VALUES ('%d', '%s', '%s', '%s')", in.TraceId, in.Puid, in.Timestamp, in.Msg)

	ret, err := eng.MysqlConnection().Exec(query)

	fmt.Printf("%v\n", ret)

	if ret != nil {
		return &pb.Bool{Value: true}, err
	} else {
		return &pb.Bool{Value: false}, err
	}
}

func grpcServer() {
	lis, err := net.Listen("tcp", ":9034")
	if err != nil {
		logger.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
	myserver := server{}

	pb.RegisterCallTraceServer(s, &myserver)
	if err := s.Serve(lis); err != nil {
		logger.Fatalf("failed to serve: %v", err)
	}
}

func main() {
	go httpServer()
	go grpcServer()

	// Wait forever
	select {}
}
