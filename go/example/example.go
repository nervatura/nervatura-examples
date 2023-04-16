package main

import (
	"fmt"
	"os"
	"path/filepath"
	"time"

	"github.com/joho/godotenv"
	app "github.com/nervatura/nervatura-examples/app"
	srv "github.com/nervatura/nervatura-examples/service"
	ut "github.com/nervatura/nervatura-examples/utils"
)

func main() {
	err := godotenv.Load(".env")
	if err != nil {
		godotenv.Load(".env.example")
	}

	privateKey, err := os.ReadFile(filepath.Clean(os.Getenv("NT_EXAMPLE_TOKEN_PRIVATE_KEY")))
	if err != nil {
		fmt.Println("Private key error: " + err.Error())
		return
	}
	token, err := ut.CreateToken("admin", "demo", map[string]interface{}{
		"NT_TOKEN_EXP":         os.Getenv("NT_EXAMPLE_TOKEN_EXP"),
		"NT_TOKEN_ISS":         os.Getenv("NT_TOKEN_ISS"),
		"NT_TOKEN_PRIVATE_KID": os.Getenv("NT_TOKEN_PUBLIC_KID"),
		"NT_TOKEN_ALG":         os.Getenv("NT_EXAMPLE_TOKEN_ALGORITHM"),
		"NT_TOKEN_PRIVATE_KEY": string(privateKey),
	})
	if err != nil {
		fmt.Println("CreateToken error: " + err.Error())
		return
	}

	apiMap := map[string]app.APIService{
		"rpc":  &srv.RpcClient{},
		"cli":  &srv.CliClient{},
		"http": &srv.HttpClient{},
	}
	fnList := []string{
		"UserLogin", "TokenRefresh", "TokenLogin", "UserPassword", "Report", "ReportList",
		"ReportDelete", "ReportInstall", "Function", "View", "Get", "Update", "Delete",
	}
	fnMap := map[string]func(api app.APIService) (interface{}, error){
		"UserLogin": func(api app.APIService) (interface{}, error) {
			return api.UserLogin(map[string]interface{}{
				"username": "admin",
				"password": "",
				"database": "demo",
			})
		},
		"TokenRefresh": func(api app.APIService) (interface{}, error) {
			return api.TokenRefresh(token)
		},
		"TokenLogin": func(api app.APIService) (interface{}, error) {
			return api.TokenLogin(token)
		},
		"UserPassword": func(api app.APIService) (interface{}, error) {
			return api.UserPassword(token, map[string]interface{}{
				"username":   "guest",
				"password":   "Password_1234",
				"confirm":    "Password_1234",
				"custnumber": "",
			})
		},
		"Report": func(api app.APIService) (interface{}, error) {
			return api.Report(token, map[string]interface{}{
				"output":      "pdf",
				"reportkey":   "ntr_invoice_en",
				"orientation": "portrait",
				"size":        "a4",
				"nervatype":   "trans",
				"refnumber":   "DMINV/00001",
				"template":    "",
				"filters":     map[string]interface{}{"@id": 5},
			})
		},
		"ReportList": func(api app.APIService) (interface{}, error) {
			return api.ReportList(token, map[string]interface{}{
				"label": "",
			})
		},
		"ReportDelete": func(api app.APIService) (interface{}, error) {
			return api.ReportDelete(token, map[string]interface{}{
				"reportkey": "ntr_employee_en",
			})
		},
		"ReportInstall": func(api app.APIService) (interface{}, error) {
			return api.ReportInstall(token, map[string]interface{}{
				"reportkey": "ntr_employee_en",
			})
		},
		"Function": func(api app.APIService) (interface{}, error) {
			return api.Function(token, map[string]interface{}{
				"key": "nextNumber",
				"values": map[string]interface{}{
					"numberkey":  "custnumber",
					"step":       false,
					"insert_key": false,
				},
				"value": "",
			})
		},
		"View": func(api app.APIService) (interface{}, error) {
			return api.View(token, []map[string]interface{}{
				{
					"key":    "customers",
					"text":   "select c.id, ct.groupvalue as custtype, c.custnumber, c.custname from customer c inner join groups ct on c.custtype = ct.id where c.deleted = 0 and c.custnumber <> 'HOME'",
					"values": []interface{}{},
				},
			})
		},
		"Get": func(api app.APIService) (interface{}, error) {
			return api.Get(token, map[string]interface{}{
				"nervatype": "customer",
				"metadata":  true,
				"filter":    []string{},
				"ids":       []int64{2, 4},
			})
		},
		"Update": func(api app.APIService) (interface{}, error) {
			return api.Update(token, map[string]interface{}{
				"nervatype": "address",
				"data": []map[string]interface{}{
					{
						"keys": map[string]interface{}{
							"nervatype": "customer",
							"ref_id":    "customer/DMCUST/00001",
						},
						"zipcode": "12345",
					},
				},
			})
		},
		"Delete": func(api app.APIService) (interface{}, error) {
			return api.Delete(token, map[string]interface{}{
				"nervatype": "address",
				"key":       "customer/DMCUST/00001~1",
			})
		},
	}

	apiMap["rpc"].(*srv.RpcClient).Connect(true)
	_, err = apiMap["rpc"].DatabaseCreate(os.Getenv("NT_API_KEY"), map[string]interface{}{
		"alias": "demo", "database": "demo", "demo": true,
	})
	if err != nil {
		fmt.Println("DatabaseCreate error: " + err.Error())
		return
	} else {
		fmt.Println("DatabaseCreate OK")
	}

	for apiKey, api := range apiMap {
		startTime := time.Now()
		for _, fnKey := range fnList {
			_, err = fnMap[fnKey](api)
			if err != nil {
				fmt.Println(apiKey + " " + fnKey + " error: " + err.Error())
			} else {
				fmt.Println(apiKey + " " + fnKey + " OK")
			}
		}
		endTime := time.Now()
		fmt.Println("--------------------")
		fmt.Println(apiKey+" time ", int64(endTime.Sub(startTime).Seconds()*1000))
		fmt.Println("--------------------")
	}
	apiMap["rpc"].(*srv.RpcClient).Close(true)
}
