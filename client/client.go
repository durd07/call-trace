package main

import (
	"log"
	"context"
	pb "github.com/durd07/call-trace/call_trace"
	"goolge.golang.org/grpc"
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

	
}
