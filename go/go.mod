module github.com/nervatura/nervatura-examples

go 1.21

require (
	github.com/joho/godotenv v1.5.1
	google.golang.org/grpc v1.59.0
)

require github.com/golang-jwt/jwt/v4 v4.5.0

require google.golang.org/genproto/googleapis/rpc v0.0.0-20231030173426-d783a09b4405 // indirect

require (
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/nervatura/nervatura/service v0.0.0-20231101144101-dbf182794d9c
	github.com/slavamuravey/cors v1.0.2
	golang.org/x/net v0.17.0 // indirect
	golang.org/x/sys v0.13.0 // indirect
	golang.org/x/text v0.13.0 // indirect
	google.golang.org/protobuf v1.31.0
)
