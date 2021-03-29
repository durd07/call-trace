package main

import (
	"log"
	"time"
	"context"
	pb "github.com/durd07/call-trace/call_trace"
	"google.golang.org/grpc"
)

const (
	address = "127.0.0.1:9034"
)

func main() {
	conn, err := grpc.Dial(address, grpc.WithInsecure(), grpc.WithBlock())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}

	defer conn.Close()
	c := pb.NewCallTraceClient(conn)

	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100000)
	defer cancel()

	ret, err := c.ShoudBeTraced(ctx, &pb.String{Value:"sip:felix.du@nokia-sbell.com"})
	if err != nil {
		log.Println("ShoudBeTraced failed", err)
	}

	log.Printf("received: ", ret.Value)

	ret, err = c.Trace(ctx, &pb.CallTraceRequest{Puid: "sip:felix.du@nokia-sbell.com", Msg: "123456"})

	if err != nil {
		log.Println("Trace failed", err)
	}

	log.Printf("received: ", ret.Value)

}
