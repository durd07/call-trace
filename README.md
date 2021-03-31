# Call Trace Server
refer to http://discuss.go-admin.com/t/goadmin-golang/17

## API
1. query puid should be traced
request
```
curl http://felixdu.hz.dynamic.nsn-net.net:9033/should-be-traced?puid=sip:felix.du@nokia-sbell.com
```
response on success
```
{"trace_id":2}
```
response on error
```
{"error":"error string"}
```

2. trace
request
```
curl -X POST -H "Accept: application/json" -d "{\"puid\":\"sip:felix.du@nokia-sbell.com\", \"trace_id\": 4, \"timestamp\": \"2021-03-29 16:56:33\", \"msg\": \"12345678\"}" http://felixdu.hz.dynamic.nsn-net.net:9033/trace
```
response on success
```
{}
```
response on error
```
{"error":"error string"}
```

## Debug Marks
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
