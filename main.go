package main

import (
	"fmt"
	"net"
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

var (
	eng *engine.Engine
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
				Host:       "127.0.0.1",
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

	eng.HTML("GET", "/admin", datamodel.GetContent)
	//eng.HTML("POST", "/admin/info/call_trace", datamodel.GetContent)
	ret, _ := eng.MysqlConnection().Query("select * from call_trace")
	fmt.Println(ret)

	_ = r.Run(":9033")
}

// server is used to implement helloworld.GreeterServer.
type server struct {
	pb.UnimplementedCallTraceServer
}

func (s *server) shoudBeTraced(ctx context.Context, in *pb.String) (*pb.Bool, error) {
	p, _ := peer.FromContext(ctx)
	logger.Infof("GRPC shoudBeTraced received from %s : %v", p.Addr.String(), in.Value)

	ret, err := eng.MysqlConnection().Query("SELECT 1 FROM call_trace_config WHERE public_id=" + in.Value)
	if ret != nil {
		return &pb.Bool{Value: true}, err
	} else {
		return &pb.Bool{Value: false}, err
	}

}

func (s *server) trace(ctx context.Context, in *pb.CallTraceRequest) {
	p, _ := peer.FromContext(ctx)
	logger.Infof("GRPC trace received from %s : %v", p.Addr.String(), in.Puid)

	eng.MysqlConnection().Exec("INSERT INTO call_trace (public_id, message) VALUES ('%s', '%s')", in.Puid, in.Msg)

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
