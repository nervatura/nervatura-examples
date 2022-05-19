package service

import (
	"context"
	"os"
	"strings"
	"time"

	pb "github.com/nervatura/nervatura/service/pkg/proto"
	ut "github.com/nervatura/nervatura/service/pkg/utils"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/grpc/metadata"
)

type RpcClient struct{}

func (rpc *RpcClient) Connect() (*grpc.ClientConn, error) {
	return grpc.Dial(os.Getenv("NT_EXAMPLE_HOST")+":"+os.Getenv("NT_GRPC_PORT"), grpc.WithTransportCredentials(insecure.NewCredentials()))
}

func (rpc *RpcClient) decodeValue(values map[string]*pb.Value) map[string]interface{} {
	item := make(map[string]interface{})
	for key, value := range values {
		if _, valid := value.Value.(*pb.Value_Text); valid {
			if value.GetText() == "null" {
				item[key] = nil
			} else {
				item[key] = value.GetText()
			}
		}
		if _, valid := value.Value.(*pb.Value_Number); valid {
			item[key] = value.GetNumber()
		}
		if _, valid := value.Value.(*pb.Value_Boolean); valid {
			item[key] = value.GetBoolean()
		}
	}
	return item
}

func (rpc *RpcClient) encodeValue(value interface{}) *pb.Value {
	if value == nil {
		return &pb.Value{Value: &pb.Value_Text{Text: "null"}}
	}
	if boolValue, valid := value.(bool); valid {
		return &pb.Value{Value: &pb.Value_Boolean{Boolean: boolValue}}
	}
	if intValue, valid := value.(int64); valid {
		return &pb.Value{Value: &pb.Value_Number{Number: ut.ToFloat(intValue, 0)}}
	}
	if floatValue, valid := value.(float64); valid {
		return &pb.Value{Value: &pb.Value_Number{Number: floatValue}}
	}
	if listValue, valid := value.([]string); valid {
		return &pb.Value{Value: &pb.Value_Text{Text: strings.Join(listValue, ",")}}
	}
	return &pb.Value{Value: &pb.Value_Text{Text: ut.ToString(value, "")}}
}

func (rpc *RpcClient) mapValue(values map[string]interface{}) map[string]*pb.Value {
	valueMap := make(map[string]*pb.Value)
	for key, value := range values {
		valueMap[key] = rpc.encodeValue(value)
	}
	return valueMap
}

func (rpc *RpcClient) DatabaseCreate(conn *grpc.ClientConn, apiKey string, options map[string]interface{}) (interface{}, error) {
	md := metadata.New(map[string]string{"x-api-key": apiKey})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	response, err := pb.NewAPIClient(conn).DatabaseCreate(ctx, &pb.RequestDatabaseCreate{
		Alias: ut.ToString(options["database"], ""),
		Demo:  ut.ToBoolean(options["demo"], false),
	})
	if err != nil {
		return nil, err
	}
	results := make([]map[string]interface{}, 0)
	for _, item := range response.Details.Items {
		results = append(results, rpc.decodeValue(item.Values))
	}
	return results, nil
}

func (rpc *RpcClient) UserLogin(conn *grpc.ClientConn, options map[string]interface{}) (interface{}, error) {
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*30)
	defer cancel()

	response, err := pb.NewAPIClient(conn).UserLogin(ctx, &pb.RequestUserLogin{
		Username: ut.ToString(options["username"], ""),
		Password: ut.ToString(options["password"], ""),
		Database: ut.ToString(options["database"], ""),
	})
	if err != nil {
		return nil, err
	}
	return map[string]interface{}{
		"token":   response.Token,
		"engine":  response.Engine,
		"version": response.Version,
	}, nil
}

func (rpc *RpcClient) TokenLogin(conn *grpc.ClientConn, token string) (interface{}, error) {
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	response, err := pb.NewAPIClient(conn).TokenLogin(ctx, &pb.RequestEmpty{})
	if err != nil {
		return nil, err
	}
	return map[string]interface{}{
		"id":         response.Id,
		"username":   response.Username,
		"empnumber":  response.Empnumber,
		"usergroup":  response.Usergroup,
		"scope":      response.Scope,
		"department": response.Department,
	}, nil
}

func (rpc *RpcClient) TokenRefresh(conn *grpc.ClientConn, token string) (interface{}, error) {
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	response, err := pb.NewAPIClient(conn).TokenRefresh(ctx, &pb.RequestEmpty{})
	if err != nil {
		return nil, err
	}
	return map[string]interface{}{
		"token": response.Value}, nil
}

func (rpc *RpcClient) UserPassword(conn *grpc.ClientConn, token string, options map[string]interface{}) (interface{}, error) {
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	_, err := pb.NewAPIClient(conn).UserPassword(ctx, &pb.RequestUserPassword{
		Username:   ut.ToString(options["username"], ""),
		Password:   ut.ToString(options["password"], ""),
		Confirm:    ut.ToString(options["confirm"], ""),
		Custnumber: ut.ToString(options["custnumber"], ""),
	})

	return nil, err
}

func (rpc *RpcClient) Report(conn *grpc.ClientConn, token string, options map[string]interface{}) (interface{}, error) {
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	filters := make(map[string]*pb.Value)
	if values, found := options["filters"].(map[string]interface{}); found {
		filters = rpc.mapValue(values)
	}
	response, err := pb.NewAPIClient(conn).Report(ctx, &pb.RequestReport{
		Reportkey:   ut.ToString(options["reportkey"], ""),
		Orientation: pb.ReportOrientation(pb.ReportOrientation_value[ut.ToString(options["orientation"], "portrait")]),
		Size:        pb.ReportSize(pb.ReportSize_value[ut.ToString(options["size"], "a4")]),
		Output:      pb.ReportOutput(pb.ReportOutput_value[ut.ToString(options["output"], "base64")]),
		Type:        pb.ReportType(pb.ReportType_value["report_"+ut.ToString(options["nervatype"], "none")]),
		Refnumber:   ut.ToString(options["refnumber"], ""),
		Template:    ut.ToString(options["template"], ""),
		Filters:     filters,
	})
	if err != nil {
		return nil, err
	}

	var result interface{}
	err = ut.ConvertFromByte(response.Value, &result)
	return result, err
}

func (rpc *RpcClient) ReportList(conn *grpc.ClientConn, token string, options map[string]interface{}) (interface{}, error) {
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	response, err := pb.NewAPIClient(conn).ReportList(ctx, &pb.RequestReportList{
		Label: ut.ToString(options["label"], ""),
	})
	if err != nil {
		return nil, err
	}

	results := make([]map[string]interface{}, 0)
	for _, item := range response.Items {
		results = append(results, map[string]interface{}{
			"reportkey":   item.Reportkey,
			"repname":     item.Repname,
			"description": item.Description,
			"label":       item.Label,
			"reptype":     item.Reptype,
			"filename":    item.Filename,
			"installed":   item.Installed,
		})
	}
	return results, err
}

func (rpc *RpcClient) ReportInstall(conn *grpc.ClientConn, token string, options map[string]interface{}) (interface{}, error) {
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	response, err := pb.NewAPIClient(conn).ReportInstall(ctx, &pb.RequestReportInstall{
		Reportkey: ut.ToString(options["reportkey"], ""),
	})
	if err != nil {
		return nil, err
	}

	return response.Id, nil
}

func (rpc *RpcClient) ReportDelete(conn *grpc.ClientConn, token string, options map[string]interface{}) (interface{}, error) {
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	_, err := pb.NewAPIClient(conn).ReportDelete(ctx, &pb.RequestReportDelete{
		Reportkey: ut.ToString(options["reportkey"], ""),
	})
	return nil, err
}

func (rpc *RpcClient) Function(conn *grpc.ClientConn, token string, options map[string]interface{}) (result interface{}, err error) {
	checkValue := func(values map[string]interface{}) bool {
		for _, value := range values {
			switch value.(type) {
			case bool, int64, float64, string, []string:
			default:
				if value != nil {
					return false
				}
			}
		}
		return true
	}

	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	var rpcValue []byte
	var rpcValues map[string]*pb.Value
	if values, found := options["values"].(map[string]interface{}); found {
		if checkValue(values) {
			rpcValues = rpc.mapValue(values)
		} else {
			rpcValue, err = ut.ConvertToByte(options["values"])
			if err != nil {
				return nil, err
			}
		}
	}
	response, err := pb.NewAPIClient(conn).Function(ctx, &pb.RequestFunction{
		Key:    ut.ToString(options["key"], ""),
		Values: rpcValues, Value: rpcValue,
	})
	if err != nil {
		return nil, err
	}

	err = ut.ConvertFromByte(response.Value, &result)
	return result, err
}

func (rpc *RpcClient) View(conn *grpc.ClientConn, token string, data []map[string]interface{}) (interface{}, error) {
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	rpcOptions := make([]*pb.RequestView_Query, 0)
	for _, item := range data {
		query := &pb.RequestView_Query{
			Key:  ut.ToString(item["key"], ""),
			Text: ut.ToString(item["text"], ""),
		}
		if values, found := item["values"].([]interface{}); found {
			rpcValues := make([]*pb.Value, 0)
			for _, value := range values {
				rpcValues = append(rpcValues, rpc.encodeValue(value))
			}
			query.Values = rpcValues
		}
		rpcOptions = append(rpcOptions, query)
	}
	response, err := pb.NewAPIClient(conn).View(ctx, &pb.RequestView{
		Options: rpcOptions,
	})
	if err != nil {
		return nil, err
	}

	results := make(map[string]interface{})
	for vkey, row := range response.Values {
		items := make([]interface{}, 0)
		for _, item := range row.Items {
			items = append(items, rpc.decodeValue(item.Values))
		}
		results[vkey] = items
	}
	return results, nil
}

func (rpc *RpcClient) Get(conn *grpc.ClientConn, token string, options map[string]interface{}) (interface{}, error) {

	itemMap := map[string]func(data *pb.ResponseGet_Value) interface{}{
		"address": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetAddress()
			/*
				-> interface result:
				address := data.GetAddress()
				return map[string]interface{}{
					"id": address.Id,
					"zipcode": address.Zipcode,
					...
				}
			*/
		},
		"barcode": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetBarcode()
		},
		"contact": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetContact()
		},
		"currency": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetCurrency()
		},
		"customer": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetCustomer()
		},
		"deffield": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetDeffield()
		},
		"employee": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetEmployee()
		},
		"event": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetEvent()
		},
		"fieldvalue": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetFieldvalue()
		},
		"groups": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetGroups()
		},
		"item": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetItem()
		},
		"link": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetLink()
		},
		"log": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetLog()
		},
		"movement": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetMovement()
		},
		"numberdef": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetNumberdef()
		},
		"pattern": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetPattern()
		},
		"payment": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetPayment()
		},
		"place": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetPlace()
		},
		"price": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetPrice()
		},
		"product": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetProduct()
		},
		"project": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetProject()
		},
		"rate": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetRate()
		},
		"tax": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetTax()
		},
		"tool": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetTool()
		},
		"trans": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetTrans()
		},
		"ui_audit": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetUiAudit()
		},
		"ui_menu": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetUiMenu()
		},
		"ui_menufields": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetUiMenufields()
		},
		"ui_message": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetUiMessage()
		},
		"ui_printqueue": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetUiPrintqueue()
		},
		"ui_report": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetUiReport()
		},
		"ui_userconfig": func(data *pb.ResponseGet_Value) interface{} {
			return data.GetUiUserconfig()
		},
	}

	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	rpcFilter := make([]string, 0)
	if filter, found := options["filter"].([]string); found {
		rpcFilter = filter
	}
	rpcIds := make([]int64, 0)
	if ids, found := options["ids"].([]int64); found {
		rpcIds = ids
	}
	response, err := pb.NewAPIClient(conn).Get(ctx, &pb.RequestGet{
		Nervatype: pb.DataType(pb.DataType_value[ut.ToString(options["nervatype"], "")]),
		Filter:    rpcFilter, Ids: rpcIds, Metadata: ut.ToBoolean(options["metadata"], false),
	})
	if err != nil {
		return nil, err
	}

	results := make([]interface{}, 0)
	for _, item := range response.Values {
		results = append(results, itemMap[ut.ToString(options["nervatype"], "")](item))
	}
	return results, nil
}

func (rpc *RpcClient) Update(conn *grpc.ClientConn, token string, options map[string]interface{}) (interface{}, error) {
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	rpcItems := make([]*pb.RequestUpdate_Item, 0)
	if _, found := options["data"].([]map[string]interface{}); found {
		for _, row := range options["data"].([]map[string]interface{}) {
			item := &pb.RequestUpdate_Item{Values: make(map[string]*pb.Value)}
			for fkey, value := range row {
				if keys, found := value.(map[string]interface{}); found && fkey == "keys" {
					item.Keys = rpc.mapValue(keys)
				} else {
					item.Values[fkey] = rpc.encodeValue(value)
				}
			}
			rpcItems = append(rpcItems, item)
		}
	}
	response, err := pb.NewAPIClient(conn).Update(ctx, &pb.RequestUpdate{
		Nervatype: pb.DataType(pb.DataType_value[ut.ToString(options["nervatype"], "")]),
		Items:     rpcItems,
	})
	if err != nil {
		return nil, err
	}

	//return response.Values, nil
	results := make([]interface{}, 0)
	for _, id := range response.Values {
		results = append(results, id)
	}
	return results, nil
}

func (rpc *RpcClient) Delete(conn *grpc.ClientConn, token string, options map[string]interface{}) (interface{}, error) {
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	_, err := pb.NewAPIClient(conn).Delete(ctx, &pb.RequestDelete{
		Nervatype: pb.DataType(pb.DataType_value[ut.ToString(options["nervatype"], "")]),
		Id:        ut.ToInteger(options["id"], 0),
		Key:       ut.ToString(options["key"], ""),
	})
	return nil, err
}
