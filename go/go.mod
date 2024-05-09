module github.com/nervatura/nervatura-examples

go 1.22

require (
	github.com/joho/godotenv v1.5.1
	google.golang.org/grpc v1.63.2
)

require github.com/golang-jwt/jwt/v4 v4.5.0

require google.golang.org/genproto/googleapis/rpc v0.0.0-20240509183442-62759503f434 // indirect

require (
	github.com/nervatura/nervatura/service v0.0.0-20240509201119-6ab2c30e0009
	github.com/slavamuravey/cors v1.0.2
	golang.org/x/net v0.25.0 // indirect
	golang.org/x/sys v0.20.0 // indirect
	golang.org/x/text v0.15.0 // indirect
	google.golang.org/protobuf v1.34.1
)
