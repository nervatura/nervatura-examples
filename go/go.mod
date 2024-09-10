module github.com/nervatura/nervatura-examples

go 1.23

require (
	github.com/joho/godotenv v1.5.1
	google.golang.org/grpc v1.66.1
)

require github.com/golang-jwt/jwt/v4 v4.5.0

require google.golang.org/genproto/googleapis/rpc v0.0.0-20240903143218-8af14fe29dc1 // indirect

require (
	github.com/nervatura/nervatura/service v0.0.0-20240910200536-bdc70b875cbd
	github.com/slavamuravey/cors v1.0.2
	golang.org/x/net v0.29.0 // indirect
	golang.org/x/sys v0.25.0 // indirect
	golang.org/x/text v0.18.0 // indirect
	google.golang.org/protobuf v1.34.2
)
