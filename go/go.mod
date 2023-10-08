module github.com/nervatura/nervatura-examples

go 1.21

require (
	github.com/joho/godotenv v1.5.1
	google.golang.org/grpc v1.58.2
)

require github.com/golang-jwt/jwt/v4 v4.5.0

require google.golang.org/genproto/googleapis/rpc v0.0.0-20231002182017-d307bd883b97 // indirect

require (
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/nervatura/nervatura/service v0.0.0-20231008170516-7152ba83992d
	github.com/slavamuravey/cors v1.0.2
	golang.org/x/net v0.16.0 // indirect
	golang.org/x/sys v0.13.0 // indirect
	golang.org/x/text v0.13.0 // indirect
	google.golang.org/protobuf v1.31.0
)
