// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.26.0
// 	protoc        v3.12.4
// source: call_trace/call_trace.proto

package call_trace

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type Bool struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Value bool `protobuf:"varint,1,opt,name=value,proto3" json:"value,omitempty"`
}

func (x *Bool) Reset() {
	*x = Bool{}
	if protoimpl.UnsafeEnabled {
		mi := &file_call_trace_call_trace_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Bool) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Bool) ProtoMessage() {}

func (x *Bool) ProtoReflect() protoreflect.Message {
	mi := &file_call_trace_call_trace_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Bool.ProtoReflect.Descriptor instead.
func (*Bool) Descriptor() ([]byte, []int) {
	return file_call_trace_call_trace_proto_rawDescGZIP(), []int{0}
}

func (x *Bool) GetValue() bool {
	if x != nil {
		return x.Value
	}
	return false
}

type ShouldBeTracedRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Puid string `protobuf:"bytes,1,opt,name=puid,proto3" json:"puid,omitempty"`
}

func (x *ShouldBeTracedRequest) Reset() {
	*x = ShouldBeTracedRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_call_trace_call_trace_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ShouldBeTracedRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ShouldBeTracedRequest) ProtoMessage() {}

func (x *ShouldBeTracedRequest) ProtoReflect() protoreflect.Message {
	mi := &file_call_trace_call_trace_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ShouldBeTracedRequest.ProtoReflect.Descriptor instead.
func (*ShouldBeTracedRequest) Descriptor() ([]byte, []int) {
	return file_call_trace_call_trace_proto_rawDescGZIP(), []int{1}
}

func (x *ShouldBeTracedRequest) GetPuid() string {
	if x != nil {
		return x.Puid
	}
	return ""
}

type ShouldBeTracedResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	TraceId int32 `protobuf:"varint,1,opt,name=trace_id,json=traceId,proto3" json:"trace_id,omitempty"`
}

func (x *ShouldBeTracedResponse) Reset() {
	*x = ShouldBeTracedResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_call_trace_call_trace_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ShouldBeTracedResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ShouldBeTracedResponse) ProtoMessage() {}

func (x *ShouldBeTracedResponse) ProtoReflect() protoreflect.Message {
	mi := &file_call_trace_call_trace_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ShouldBeTracedResponse.ProtoReflect.Descriptor instead.
func (*ShouldBeTracedResponse) Descriptor() ([]byte, []int) {
	return file_call_trace_call_trace_proto_rawDescGZIP(), []int{2}
}

func (x *ShouldBeTracedResponse) GetTraceId() int32 {
	if x != nil {
		return x.TraceId
	}
	return 0
}

type CallTraceRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	TraceId   string `protobuf:"bytes,1,opt,name=trace_id,json=traceId,proto3" json:"trace_id,omitempty"`
	Puid      string `protobuf:"bytes,2,opt,name=puid,proto3" json:"puid,omitempty"`
	Timestamp string `protobuf:"bytes,3,opt,name=timestamp,proto3" json:"timestamp,omitempty"`
	Msg       string `protobuf:"bytes,4,opt,name=msg,proto3" json:"msg,omitempty"`
}

func (x *CallTraceRequest) Reset() {
	*x = CallTraceRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_call_trace_call_trace_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CallTraceRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CallTraceRequest) ProtoMessage() {}

func (x *CallTraceRequest) ProtoReflect() protoreflect.Message {
	mi := &file_call_trace_call_trace_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CallTraceRequest.ProtoReflect.Descriptor instead.
func (*CallTraceRequest) Descriptor() ([]byte, []int) {
	return file_call_trace_call_trace_proto_rawDescGZIP(), []int{3}
}

func (x *CallTraceRequest) GetTraceId() string {
	if x != nil {
		return x.TraceId
	}
	return ""
}

func (x *CallTraceRequest) GetPuid() string {
	if x != nil {
		return x.Puid
	}
	return ""
}

func (x *CallTraceRequest) GetTimestamp() string {
	if x != nil {
		return x.Timestamp
	}
	return ""
}

func (x *CallTraceRequest) GetMsg() string {
	if x != nil {
		return x.Msg
	}
	return ""
}

type WatchResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Puids []string `protobuf:"bytes,1,rep,name=puids,proto3" json:"puids,omitempty"`
}

func (x *WatchResponse) Reset() {
	*x = WatchResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_call_trace_call_trace_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *WatchResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*WatchResponse) ProtoMessage() {}

func (x *WatchResponse) ProtoReflect() protoreflect.Message {
	mi := &file_call_trace_call_trace_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use WatchResponse.ProtoReflect.Descriptor instead.
func (*WatchResponse) Descriptor() ([]byte, []int) {
	return file_call_trace_call_trace_proto_rawDescGZIP(), []int{4}
}

func (x *WatchResponse) GetPuids() []string {
	if x != nil {
		return x.Puids
	}
	return nil
}

var File_call_trace_call_trace_proto protoreflect.FileDescriptor

var file_call_trace_call_trace_proto_rawDesc = []byte{
	0x0a, 0x1b, 0x63, 0x61, 0x6c, 0x6c, 0x5f, 0x74, 0x72, 0x61, 0x63, 0x65, 0x2f, 0x63, 0x61, 0x6c,
	0x6c, 0x5f, 0x74, 0x72, 0x61, 0x63, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x2d, 0x65,
	0x6e, 0x76, 0x6f, 0x79, 0x2e, 0x65, 0x78, 0x74, 0x65, 0x6e, 0x73, 0x69, 0x6f, 0x6e, 0x73, 0x2e,
	0x66, 0x69, 0x6c, 0x74, 0x65, 0x72, 0x73, 0x2e, 0x6e, 0x65, 0x74, 0x77, 0x6f, 0x72, 0x6b, 0x2e,
	0x73, 0x69, 0x70, 0x5f, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x2e, 0x76, 0x33, 0x22, 0x1c, 0x0a, 0x04,
	0x42, 0x6f, 0x6f, 0x6c, 0x12, 0x14, 0x0a, 0x05, 0x76, 0x61, 0x6c, 0x75, 0x65, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x08, 0x52, 0x05, 0x76, 0x61, 0x6c, 0x75, 0x65, 0x22, 0x2b, 0x0a, 0x15, 0x53, 0x68,
	0x6f, 0x75, 0x6c, 0x64, 0x42, 0x65, 0x54, 0x72, 0x61, 0x63, 0x65, 0x64, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x70, 0x75, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x04, 0x70, 0x75, 0x69, 0x64, 0x22, 0x33, 0x0a, 0x16, 0x53, 0x68, 0x6f, 0x75, 0x6c,
	0x64, 0x42, 0x65, 0x54, 0x72, 0x61, 0x63, 0x65, 0x64, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x19, 0x0a, 0x08, 0x74, 0x72, 0x61, 0x63, 0x65, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x05, 0x52, 0x07, 0x74, 0x72, 0x61, 0x63, 0x65, 0x49, 0x64, 0x22, 0x71, 0x0a, 0x10,
	0x43, 0x61, 0x6c, 0x6c, 0x54, 0x72, 0x61, 0x63, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74,
	0x12, 0x19, 0x0a, 0x08, 0x74, 0x72, 0x61, 0x63, 0x65, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x07, 0x74, 0x72, 0x61, 0x63, 0x65, 0x49, 0x64, 0x12, 0x12, 0x0a, 0x04, 0x70,
	0x75, 0x69, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x70, 0x75, 0x69, 0x64, 0x12,
	0x1c, 0x0a, 0x09, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x18, 0x03, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x09, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x12, 0x10, 0x0a,
	0x03, 0x6d, 0x73, 0x67, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x52, 0x03, 0x6d, 0x73, 0x67, 0x22,
	0x25, 0x0a, 0x0d, 0x57, 0x61, 0x74, 0x63, 0x68, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x12, 0x14, 0x0a, 0x05, 0x70, 0x75, 0x69, 0x64, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x09, 0x52,
	0x05, 0x70, 0x75, 0x69, 0x64, 0x73, 0x32, 0xbf, 0x03, 0x0a, 0x09, 0x43, 0x61, 0x6c, 0x6c, 0x54,
	0x72, 0x61, 0x63, 0x65, 0x12, 0x9e, 0x01, 0x0a, 0x0d, 0x73, 0x68, 0x6f, 0x75, 0x64, 0x42, 0x65,
	0x54, 0x72, 0x61, 0x63, 0x65, 0x64, 0x12, 0x44, 0x2e, 0x65, 0x6e, 0x76, 0x6f, 0x79, 0x2e, 0x65,
	0x78, 0x74, 0x65, 0x6e, 0x73, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x66, 0x69, 0x6c, 0x74, 0x65, 0x72,
	0x73, 0x2e, 0x6e, 0x65, 0x74, 0x77, 0x6f, 0x72, 0x6b, 0x2e, 0x73, 0x69, 0x70, 0x5f, 0x70, 0x72,
	0x6f, 0x78, 0x79, 0x2e, 0x76, 0x33, 0x2e, 0x53, 0x68, 0x6f, 0x75, 0x6c, 0x64, 0x42, 0x65, 0x54,
	0x72, 0x61, 0x63, 0x65, 0x64, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x45, 0x2e, 0x65,
	0x6e, 0x76, 0x6f, 0x79, 0x2e, 0x65, 0x78, 0x74, 0x65, 0x6e, 0x73, 0x69, 0x6f, 0x6e, 0x73, 0x2e,
	0x66, 0x69, 0x6c, 0x74, 0x65, 0x72, 0x73, 0x2e, 0x6e, 0x65, 0x74, 0x77, 0x6f, 0x72, 0x6b, 0x2e,
	0x73, 0x69, 0x70, 0x5f, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x2e, 0x76, 0x33, 0x2e, 0x53, 0x68, 0x6f,
	0x75, 0x6c, 0x64, 0x42, 0x65, 0x54, 0x72, 0x61, 0x63, 0x65, 0x64, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x8f, 0x01, 0x0a, 0x05, 0x77, 0x61, 0x74, 0x63, 0x68, 0x12,
	0x44, 0x2e, 0x65, 0x6e, 0x76, 0x6f, 0x79, 0x2e, 0x65, 0x78, 0x74, 0x65, 0x6e, 0x73, 0x69, 0x6f,
	0x6e, 0x73, 0x2e, 0x66, 0x69, 0x6c, 0x74, 0x65, 0x72, 0x73, 0x2e, 0x6e, 0x65, 0x74, 0x77, 0x6f,
	0x72, 0x6b, 0x2e, 0x73, 0x69, 0x70, 0x5f, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x2e, 0x76, 0x33, 0x2e,
	0x53, 0x68, 0x6f, 0x75, 0x6c, 0x64, 0x42, 0x65, 0x54, 0x72, 0x61, 0x63, 0x65, 0x64, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x3c, 0x2e, 0x65, 0x6e, 0x76, 0x6f, 0x79, 0x2e, 0x65, 0x78,
	0x74, 0x65, 0x6e, 0x73, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x66, 0x69, 0x6c, 0x74, 0x65, 0x72, 0x73,
	0x2e, 0x6e, 0x65, 0x74, 0x77, 0x6f, 0x72, 0x6b, 0x2e, 0x73, 0x69, 0x70, 0x5f, 0x70, 0x72, 0x6f,
	0x78, 0x79, 0x2e, 0x76, 0x33, 0x2e, 0x57, 0x61, 0x74, 0x63, 0x68, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x22, 0x00, 0x30, 0x01, 0x12, 0x7f, 0x0a, 0x05, 0x74, 0x72, 0x61, 0x63, 0x65,
	0x12, 0x3f, 0x2e, 0x65, 0x6e, 0x76, 0x6f, 0x79, 0x2e, 0x65, 0x78, 0x74, 0x65, 0x6e, 0x73, 0x69,
	0x6f, 0x6e, 0x73, 0x2e, 0x66, 0x69, 0x6c, 0x74, 0x65, 0x72, 0x73, 0x2e, 0x6e, 0x65, 0x74, 0x77,
	0x6f, 0x72, 0x6b, 0x2e, 0x73, 0x69, 0x70, 0x5f, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x2e, 0x76, 0x33,
	0x2e, 0x43, 0x61, 0x6c, 0x6c, 0x54, 0x72, 0x61, 0x63, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x1a, 0x33, 0x2e, 0x65, 0x6e, 0x76, 0x6f, 0x79, 0x2e, 0x65, 0x78, 0x74, 0x65, 0x6e, 0x73,
	0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x66, 0x69, 0x6c, 0x74, 0x65, 0x72, 0x73, 0x2e, 0x6e, 0x65, 0x74,
	0x77, 0x6f, 0x72, 0x6b, 0x2e, 0x73, 0x69, 0x70, 0x5f, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x2e, 0x76,
	0x33, 0x2e, 0x42, 0x6f, 0x6f, 0x6c, 0x22, 0x00, 0x42, 0x46, 0x0a, 0x14, 0x69, 0x6f, 0x2e, 0x67,
	0x72, 0x70, 0x63, 0x2e, 0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x73, 0x2e, 0x74, 0x72, 0x61,
	0x42, 0x0e, 0x43, 0x61, 0x6c, 0x6c, 0x54, 0x72, 0x61, 0x63, 0x65, 0x50, 0x72, 0x6f, 0x74, 0x6f,
	0x50, 0x01, 0x5a, 0x1c, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x64,
	0x75, 0x72, 0x64, 0x30, 0x37, 0x2f, 0x63, 0x61, 0x6c, 0x6c, 0x5f, 0x74, 0x72, 0x61, 0x63, 0x65,
	0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_call_trace_call_trace_proto_rawDescOnce sync.Once
	file_call_trace_call_trace_proto_rawDescData = file_call_trace_call_trace_proto_rawDesc
)

func file_call_trace_call_trace_proto_rawDescGZIP() []byte {
	file_call_trace_call_trace_proto_rawDescOnce.Do(func() {
		file_call_trace_call_trace_proto_rawDescData = protoimpl.X.CompressGZIP(file_call_trace_call_trace_proto_rawDescData)
	})
	return file_call_trace_call_trace_proto_rawDescData
}

var file_call_trace_call_trace_proto_msgTypes = make([]protoimpl.MessageInfo, 5)
var file_call_trace_call_trace_proto_goTypes = []interface{}{
	(*Bool)(nil),                   // 0: envoy.extensions.filters.network.sip_proxy.v3.Bool
	(*ShouldBeTracedRequest)(nil),  // 1: envoy.extensions.filters.network.sip_proxy.v3.ShouldBeTracedRequest
	(*ShouldBeTracedResponse)(nil), // 2: envoy.extensions.filters.network.sip_proxy.v3.ShouldBeTracedResponse
	(*CallTraceRequest)(nil),       // 3: envoy.extensions.filters.network.sip_proxy.v3.CallTraceRequest
	(*WatchResponse)(nil),          // 4: envoy.extensions.filters.network.sip_proxy.v3.WatchResponse
}
var file_call_trace_call_trace_proto_depIdxs = []int32{
	1, // 0: envoy.extensions.filters.network.sip_proxy.v3.CallTrace.shoudBeTraced:input_type -> envoy.extensions.filters.network.sip_proxy.v3.ShouldBeTracedRequest
	1, // 1: envoy.extensions.filters.network.sip_proxy.v3.CallTrace.watch:input_type -> envoy.extensions.filters.network.sip_proxy.v3.ShouldBeTracedRequest
	3, // 2: envoy.extensions.filters.network.sip_proxy.v3.CallTrace.trace:input_type -> envoy.extensions.filters.network.sip_proxy.v3.CallTraceRequest
	2, // 3: envoy.extensions.filters.network.sip_proxy.v3.CallTrace.shoudBeTraced:output_type -> envoy.extensions.filters.network.sip_proxy.v3.ShouldBeTracedResponse
	4, // 4: envoy.extensions.filters.network.sip_proxy.v3.CallTrace.watch:output_type -> envoy.extensions.filters.network.sip_proxy.v3.WatchResponse
	0, // 5: envoy.extensions.filters.network.sip_proxy.v3.CallTrace.trace:output_type -> envoy.extensions.filters.network.sip_proxy.v3.Bool
	3, // [3:6] is the sub-list for method output_type
	0, // [0:3] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_call_trace_call_trace_proto_init() }
func file_call_trace_call_trace_proto_init() {
	if File_call_trace_call_trace_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_call_trace_call_trace_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Bool); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_call_trace_call_trace_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ShouldBeTracedRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_call_trace_call_trace_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ShouldBeTracedResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_call_trace_call_trace_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CallTraceRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_call_trace_call_trace_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*WatchResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_call_trace_call_trace_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   5,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_call_trace_call_trace_proto_goTypes,
		DependencyIndexes: file_call_trace_call_trace_proto_depIdxs,
		MessageInfos:      file_call_trace_call_trace_proto_msgTypes,
	}.Build()
	File_call_trace_call_trace_proto = out.File
	file_call_trace_call_trace_proto_rawDesc = nil
	file_call_trace_call_trace_proto_goTypes = nil
	file_call_trace_call_trace_proto_depIdxs = nil
}
