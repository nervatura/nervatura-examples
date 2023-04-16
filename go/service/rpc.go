package service

import (
	"context"
	"os"
	"strings"
	"time"

	ut "github.com/nervatura/nervatura-examples/utils"
	pb "github.com/nervatura/nervatura/service/pkg/proto"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/grpc/metadata"
	"google.golang.org/protobuf/encoding/protojson"
)

type RpcClient struct {
	conn      *grpc.ClientConn
	permanent bool
}

func (rpc *RpcClient) Connect(keeping bool) (err error) {
	if rpc.conn == nil {
		rpc.conn, err = grpc.Dial(os.Getenv("NT_EXAMPLE_HOST")+":"+os.Getenv("NT_GRPC_PORT"), grpc.WithTransportCredentials(insecure.NewCredentials()))
	}
	if keeping {
		rpc.permanent = true
	}
	return err
}

func (rpc *RpcClient) Close(all bool) {
	if rpc.conn != nil && (!rpc.permanent || all) {
		_ = rpc.conn.Close()
		rpc.conn = nil
		rpc.permanent = false
	}
}

func (rpc *RpcClient) PermanentConnect() {

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

func (rpc *RpcClient) DatabaseCreate(apiKey string, options map[string]interface{}) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
	md := metadata.New(map[string]string{"x-api-key": apiKey})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	response, err := pb.NewAPIClient(rpc.conn).DatabaseCreate(ctx, &pb.RequestDatabaseCreate{
		Alias: ut.ToString(options["database"], ""),
		Demo:  ut.ToBoolean(options["demo"], false),
	})
	rpc.Close(false)
	if err != nil {
		return nil, err
	}
	results := make([]map[string]interface{}, 0)
	for _, item := range response.Details.Items {
		results = append(results, rpc.decodeValue(item.Values))
	}
	return results, nil
}

func (rpc *RpcClient) UserLogin(options map[string]interface{}) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*30)
	defer cancel()

	response, err := pb.NewAPIClient(rpc.conn).UserLogin(ctx, &pb.RequestUserLogin{
		Username: ut.ToString(options["username"], ""),
		Password: ut.ToString(options["password"], ""),
		Database: ut.ToString(options["database"], ""),
	})
	rpc.Close(false)
	if err != nil {
		return nil, err
	}
	return map[string]interface{}{
		"token":   response.Token,
		"engine":  response.Engine,
		"version": response.Version,
	}, nil
}

func (rpc *RpcClient) TokenLogin(token string) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	response, err := pb.NewAPIClient(rpc.conn).TokenLogin(ctx, &pb.RequestEmpty{})
	rpc.Close(false)
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

func (rpc *RpcClient) TokenRefresh(token string) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	response, err := pb.NewAPIClient(rpc.conn).TokenRefresh(ctx, &pb.RequestEmpty{})
	rpc.Close(false)
	if err != nil {
		return nil, err
	}
	return map[string]interface{}{
		"token": response.Value}, nil
}

func (rpc *RpcClient) UserPassword(token string, options map[string]interface{}) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	_, err := pb.NewAPIClient(rpc.conn).UserPassword(ctx, &pb.RequestUserPassword{
		Username:   ut.ToString(options["username"], ""),
		Password:   ut.ToString(options["password"], ""),
		Confirm:    ut.ToString(options["confirm"], ""),
		Custnumber: ut.ToString(options["custnumber"], ""),
	})
	rpc.Close(false)
	return nil, err
}

func (rpc *RpcClient) Report(token string, options map[string]interface{}) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	filters := make(map[string]*pb.Value)
	if values, found := options["filters"].(map[string]interface{}); found {
		filters = rpc.mapValue(values)
	}
	response, err := pb.NewAPIClient(rpc.conn).Report(ctx, &pb.RequestReport{
		Reportkey:   ut.ToString(options["reportkey"], ""),
		Orientation: pb.ReportOrientation(pb.ReportOrientation_value[ut.ToString(options["orientation"], "portrait")]),
		Size:        pb.ReportSize(pb.ReportSize_value[ut.ToString(options["size"], "a4")]),
		Output:      pb.ReportOutput(pb.ReportOutput_value[ut.ToString(options["output"], "base64")]),
		Type:        pb.ReportType(pb.ReportType_value["report_"+ut.ToString(options["nervatype"], "none")]),
		Refnumber:   ut.ToString(options["refnumber"], ""),
		Template:    ut.ToString(options["template"], ""),
		Filters:     filters,
	})
	rpc.Close(false)
	if err != nil {
		return nil, err
	}

	var result interface{}
	err = ut.ConvertFromByte(response.Value, &result)
	return result, err
}

func (rpc *RpcClient) ReportList(token string, options map[string]interface{}) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	response, err := pb.NewAPIClient(rpc.conn).ReportList(ctx, &pb.RequestReportList{
		Label: ut.ToString(options["label"], ""),
	})
	rpc.Close(false)
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

func (rpc *RpcClient) ReportInstall(token string, options map[string]interface{}) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	response, err := pb.NewAPIClient(rpc.conn).ReportInstall(ctx, &pb.RequestReportInstall{
		Reportkey: ut.ToString(options["reportkey"], ""),
	})
	rpc.Close(false)
	if err != nil {
		return nil, err
	}

	return response.Id, nil
}

func (rpc *RpcClient) ReportDelete(token string, options map[string]interface{}) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	_, err := pb.NewAPIClient(rpc.conn).ReportDelete(ctx, &pb.RequestReportDelete{
		Reportkey: ut.ToString(options["reportkey"], ""),
	})
	rpc.Close(false)
	return nil, err
}

func (rpc *RpcClient) Function(token string, options map[string]interface{}) (result interface{}, err error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
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
	response, err := pb.NewAPIClient(rpc.conn).Function(ctx, &pb.RequestFunction{
		Key:    ut.ToString(options["key"], ""),
		Values: rpcValues, Value: rpcValue,
	})
	rpc.Close(false)
	if err != nil {
		return nil, err
	}

	err = ut.ConvertFromByte(response.Value, &result)
	return result, err
}

func (rpc *RpcClient) View(token string, data []map[string]interface{}) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
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
	response, err := pb.NewAPIClient(rpc.conn).View(ctx, &pb.RequestView{
		Options: rpcOptions,
	})
	rpc.Close(false)
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

func (rpc *RpcClient) Get(token string, options map[string]interface{}) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
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
	response, err := pb.NewAPIClient(rpc.conn).Get(ctx, &pb.RequestGet{
		Nervatype: pb.DataType(pb.DataType_value[ut.ToString(options["nervatype"], "")]),
		Filter:    rpcFilter, Ids: rpcIds, Metadata: ut.ToBoolean(options["metadata"], false),
	})
	rpc.Close(false)
	if err != nil {
		return nil, err
	}

	msgJson, err := protojson.Marshal(response)
	if err != nil {
		return nil, err
	}
	var results map[string]interface{}
	err = ut.ConvertFromByte(msgJson, &results)

	return results["values"], err
}

func (rpc *RpcClient) Update(token string, options map[string]interface{}) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
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
	response, err := pb.NewAPIClient(rpc.conn).Update(ctx, &pb.RequestUpdate{
		Nervatype: pb.DataType(pb.DataType_value[ut.ToString(options["nervatype"], "")]),
		Items:     rpcItems,
	})
	rpc.Close(false)
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

func (rpc *RpcClient) Delete(token string, options map[string]interface{}) (interface{}, error) {
	if err := rpc.Connect(false); err != nil {
		return nil, err
	}
	md := metadata.New(map[string]string{"authorization": "Bearer " + token})
	metaCtx := metadata.NewOutgoingContext(context.Background(), md)
	ctx, cancel := context.WithTimeout(metaCtx, time.Second*30)
	defer cancel()

	_, err := pb.NewAPIClient(rpc.conn).Delete(ctx, &pb.RequestDelete{
		Nervatype: pb.DataType(pb.DataType_value[ut.ToString(options["nervatype"], "")]),
		Id:        ut.ToInteger(options["id"], 0),
		Key:       ut.ToString(options["key"], ""),
	})
	rpc.Close(false)
	return nil, err
}
