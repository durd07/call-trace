import requests

def sipmsg_report():
    SIP_INVITE_FULL = "INVITE sip:User.0000@tas01.defult.svc.cluster.local SIP/2.0\x0d\x0a" \
    "Via: SIP/2.0/TCP 11.0.0.10:15060;branch=z9hG4bK-3193-1-0\x0d\x0a" \
    "From: <sip:User.0001@tas01.defult.svc.cluster.local>;tag=1\x0d\x0a" \
    "To: <sip:User.0000@tas01.defult.svc.cluster.local>\x0d\x0a" \
    "Call-ID: 1-3193@11.0.0.10\x0d\x0a" \
    "CSeq: 1 INVITE\x0d\x0a" \
    "Contact: <sip:User.0001@11.0.0.10:15060;transport=TCP>\x0d\x0a" \
    "Supported: 100rel\x0d\x0a" \
    "Route: <sip:+16959000000:15306;role=anch;lr;transport=udp>\x0d\x0a" \
    "P-Asserted-Identity: <sip:User.0001@tas01.defult.svc.cluster.local>\x0d\x0a" \
    "Allow: UPDATE,INVITE,ACK,CANCEL,BYE,PRACK,REFER,MESSAGE,INFO\x0d\x0a" \
    "Max-Forwards: 70\x0d\x0a" \
    "Content-Type: application/sdp\x0d\x0a" \
    "Content-Length:  127\x0d\x0a" \
    "\x0d\x0a" \
    "v=0\x0d\x0a" \
    "o=PCTEL 256 2 IN IP4 11.0.0.10\x0d\x0a" \
    "c=IN IP4 11.0.0.10\x0d\x0a" \
    "m=audio 4030 RTP/AVP 0 8\x0d\x0a" \
    "a=rtpmap:0 PCMU/8000\x0d\x0a" \
    "a=rtpmap:8 PCMU/8000\x0d\x0a";

    ret = requests.post("http://localhost:9033/sipmsg_report", data=SIP_INVITE_FULL)
    print(ret.text)


sipmsg_report()
