package service

import (
	"bytes"
	"errors"
	"io"
	"net/http"
	"os"
	"strconv"
	"strings"

	ut "github.com/nervatura/nervatura-examples/utils"
)

type HttpClient struct{}

func (rest *HttpClient) request(method, path, token, apiKey string, options interface{}) (interface{}, error) {
	service_url := "http://" + os.Getenv("NT_EXAMPLE_HOST") + ":" + os.Getenv("NT_HTTP_PORT") + "/api"
	data, err := ut.ConvertToByte(options)
	if err != nil {
		return nil, err
	}

	request, err := http.NewRequest(method, service_url+path, bytes.NewBuffer(data))
	if err != nil {
		return nil, err
	}
	request.Header.Set("Content-Type", "application/json; charset=UTF-8")
	if token != "" {
		request.Header.Set("Authorization", "Bearer "+token)
	}
	if apiKey != "" {
		request.Header.Set("X-API-Key", apiKey)
	}

	client := &http.Client{}
	response, err := client.Do(request)
	if err != nil {
		return nil, err
	}
	defer response.Body.Close()

	if response.Header.Get("Content-Type") == "application/pdf" {
		responseStr := ""
		responseData, err := io.ReadAll(response.Body)
		if err == nil {
			responseStr = string(responseData)
		}
		return responseStr, err
	}

	var result interface{}
	if response.StatusCode == 200 {
		err = ut.ConvertFromReader(response.Body, &result)
		if err != nil {
			return nil, errors.New(response.Status)
		}
		if values, valid := result.(map[string]interface{}); valid {
			if value, found := values["code"]; found {
				if value != float64(200) && value != float64(204) {
					return nil, errors.New(ut.ToString(values["message"], "Error"))
				}
			}
		}
	}
	if response.StatusCode != 200 && response.StatusCode != 204 {
		return nil, errors.New(response.Status)
	}
	return result, err
}

func (rest *HttpClient) DatabaseCreate(apiKey string, options map[string]interface{}) (interface{}, error) {
	path := "/database?alias=" + ut.ToString(options["database"], "") + "&demo=" + ut.ToString(options["demo"], "false")
	return rest.request("POST", path, "", apiKey, options)
}

func (rest *HttpClient) UserLogin(options map[string]interface{}) (interface{}, error) {
	return rest.request("POST", "/auth/login", "", "", options)
}

func (rest *HttpClient) TokenRefresh(token string) (interface{}, error) {
	return rest.request("GET", "/auth/refresh", token, "", map[string]interface{}{})
}

func (rest *HttpClient) TokenLogin(token string) (interface{}, error) {
	return rest.request("GET", "/auth/validate", token, "", map[string]interface{}{})
}

func (rest *HttpClient) UserPassword(token string, options map[string]interface{}) (interface{}, error) {
	return rest.request("POST", "/auth/password", token, "", options)
}

func (rest *HttpClient) Delete(token string, options map[string]interface{}) (interface{}, error) {
	path := "/" + ut.ToString(options["nervatype"], "")
	if id, found := options["id"]; found {
		path += "?id=" + ut.ToString(id, "")
	} else if key, found := options["key"]; found {
		path += "?key=" + ut.ToString(key, "")
	}
	return rest.request("DELETE", path, token, "", options)
}

func (rest *HttpClient) Get(token string, options map[string]interface{}) (interface{}, error) {
	path := "/" + ut.ToString(options["nervatype"], "")
	if ids, found := options["ids"].([]int64); found {
		var sIds []string
		for _, id := range ids {
			sIds = append(sIds, strconv.Itoa(int(id)))
		}
		path += "/" + strings.Join(sIds, ",")
	}
	if metadata, found := options["metadata"].(bool); found && metadata {
		path += "?metadata=true"
	} else {
		path += "?metadata=false"
	}
	if filter, found := options["filter"].([]string); found {
		path += "&" + strings.Join(filter, "|")
	}
	return rest.request("GET", path, token, "", map[string]interface{}{})
}

func (rest *HttpClient) View(token string, data []map[string]interface{}) (interface{}, error) {
	return rest.request("POST", "/view", token, "", data)
}

func (rest *HttpClient) Function(token string, options map[string]interface{}) (interface{}, error) {
	return rest.request("POST", "/function", token, "", options)
}

func (rest *HttpClient) Update(token string, options map[string]interface{}) (interface{}, error) {
	return rest.request("POST", "/"+ut.ToString(options["nervatype"], ""), token, "", options["data"])
}

func (rest *HttpClient) Report(token string, options map[string]interface{}) (interface{}, error) {
	path := "/report?filters[@id]=" + ut.ToString(options["filters"].(map[string]interface{})["@id"], "")
	path += "&reportkey=" + ut.ToString(options["reportkey"], "")
	path += "&orientation=" + ut.ToString(options["orientation"], "")
	path += "&size=" + ut.ToString(options["size"], "")
	path += "&output=" + ut.ToString(options["output"], "")
	if nervatype, found := options["nervatype"]; found {
		path += "&nervatype=" + ut.ToString(nervatype, "")
	}
	return rest.request("GET", path, token, "", map[string]interface{}{})
}

func (rest *HttpClient) ReportList(token string, options map[string]interface{}) (interface{}, error) {
	path := "/report/list"
	if label, found := options["label"]; found {
		path += "?label=" + ut.ToString(label, "")
	}
	return rest.request("GET", path, token, "", map[string]interface{}{})
}

func (rest *HttpClient) ReportDelete(token string, options map[string]interface{}) (interface{}, error) {
	path := "/report/delete"
	if reportkey, found := options["reportkey"]; found {
		path += "?reportkey=" + ut.ToString(reportkey, "")
	}
	return rest.request("DELETE", path, token, "", map[string]interface{}{})
}

func (rest *HttpClient) ReportInstall(token string, options map[string]interface{}) (interface{}, error) {
	path := "/report/install"
	if reportkey, found := options["reportkey"]; found {
		path += "?reportkey=" + ut.ToString(reportkey, "")
	}
	return rest.request("POST", path, token, "", map[string]interface{}{})
}
