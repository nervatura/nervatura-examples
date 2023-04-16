package service

import (
	"errors"
	"os"
	"os/exec"
	"strconv"
	"strings"

	ut "github.com/nervatura/nervatura-examples/utils"
)

type CliClient struct{}

func (cli *CliClient) connect(arg ...string) (interface{}, error) {
	if os.Getenv("NT_EXAMPLE_SERVICE_PATH") == "docker" {
		arg = append([]string{"exec", "-i", "nervatura", "/nervatura"}, arg...)
	}
	cmd := exec.Command(os.Getenv("NT_EXAMPLE_SERVICE_PATH"), arg...)
	cmd.Env = os.Environ()
	stdout, err := cmd.Output()
	if err != nil {
		return nil, err
	}
	results := strings.Split(string(stdout), "\n")
	infoStr := results[len(results)-2]
	var result interface{}
	err = ut.ConvertFromByte([]byte(infoStr), &result)
	if err != nil {
		return nil, errors.New("command line error")
	}
	if values, valid := result.(map[string]interface{}); valid {
		if value, found := values["code"]; found {
			if value != float64(200) && value != float64(204) {
				return nil, errors.New(ut.ToString(values["message"], "Error"))
			}
		}
	}
	return result, nil
}

func (cli *CliClient) DatabaseCreate(apiKey string, options map[string]interface{}) (interface{}, error) {
	data, err := ut.ConvertToByte(options)
	if err != nil {
		return nil, err
	}
	return cli.connect("-c", "DatabaseCreate", "-o", string(data), "-k", apiKey)
}

func (cli *CliClient) UserLogin(options map[string]interface{}) (interface{}, error) {
	data, err := ut.ConvertToByte(options)
	if err != nil {
		return nil, err
	}
	return cli.connect("-c", "UserLogin", "-o", string(data))
}

func (cli *CliClient) TokenLogin(token string) (interface{}, error) {
	return cli.connect("-c", "TokenLogin", "-t", token)
}

func (cli *CliClient) TokenRefresh(token string) (interface{}, error) {
	return cli.connect("-c", "TokenRefresh", "-t", token)
}

func (cli *CliClient) TokenDecode(token string) (interface{}, error) {
	return cli.connect("-c", "TokenDecode", "-t", token)
}

func (cli *CliClient) tokenOptions(key, token, oarg string, options interface{}) (interface{}, error) {
	data, err := ut.ConvertToByte(options)
	if err != nil {
		return nil, err
	}
	return cli.connect("-c", key, oarg, string(data), "-t", token)
}

func (cli *CliClient) UserPassword(token string, options map[string]interface{}) (interface{}, error) {
	return cli.tokenOptions("UserPassword", token, "-o", options)
}

func (cli *CliClient) Delete(token string, options map[string]interface{}) (interface{}, error) {
	return cli.tokenOptions("Delete", token, "-o", options)
}

func (cli *CliClient) Get(token string, options map[string]interface{}) (interface{}, error) {
	if ids, found := options["ids"].([]int64); found {
		var sIds []string
		for _, id := range ids {
			sIds = append(sIds, strconv.Itoa(int(id)))
		}
		options["ids"] = strings.Join(sIds, ",")
	}
	if filter, found := options["filter"].([]string); found {
		options["filter"] = strings.Join(filter, "|")
	}
	return cli.tokenOptions("Get", token, "-o", options)
}

func (cli *CliClient) View(token string, data []map[string]interface{}) (interface{}, error) {
	return cli.tokenOptions("View", token, "-d", data)
}

func (cli *CliClient) Function(token string, options map[string]interface{}) (interface{}, error) {
	return cli.tokenOptions("Function", token, "-o", options)
}

func (cli *CliClient) Update(token string, options map[string]interface{}) (interface{}, error) {
	data, err := ut.ConvertToByte(options["data"])
	if err != nil {
		return nil, err
	}
	return cli.connect("-c", "Update", "-nt", ut.ToString(options["nervatype"], ""), "-d", string(data), "-t", token)
}

func (cli *CliClient) Report(token string, options map[string]interface{}) (interface{}, error) {
	return cli.tokenOptions("Report", token, "-o", options)
}

func (cli *CliClient) ReportList(token string, options map[string]interface{}) (interface{}, error) {
	return cli.tokenOptions("ReportList", token, "-o", options)
}

func (cli *CliClient) ReportDelete(token string, options map[string]interface{}) (interface{}, error) {
	return cli.tokenOptions("ReportDelete", token, "-o", options)
}

func (cli *CliClient) ReportInstall(token string, options map[string]interface{}) (interface{}, error) {
	return cli.tokenOptions("ReportInstall", token, "-o", options)
}
