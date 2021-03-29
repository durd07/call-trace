refer to http://discuss.go-admin.com/t/goadmin-golang/17

```sh
# felixdu @ Fedora in ~/test/call-trace on git:main x [0:03:58]
$ go build
# call-trace/call_trace
call_trace/call_trace_grpc.pb.go:15:11: undefined: grpc.SupportPackageIsVersion7
call_trace/call_trace_grpc.pb.go:27:5: undefined: grpc.ClientConnInterface
call_trace/call_trace_grpc.pb.go:30:28: undefined: grpc.ClientConnInterface
call_trace/call_trace_grpc.pb.go:116:32: undefined: grpc.ServiceRegistrar
```

Solution
```sh
go get -u github.com/golang/protobuf/{proto,protoc-gen-go}
go get -u google.golang.org/grpc
protoc --go_out=plugins=grpc:. *.proto
```
