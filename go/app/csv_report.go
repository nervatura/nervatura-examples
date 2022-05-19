package app

import (
	"net/http"
	"os"

	ut "github.com/nervatura/nervatura/service/pkg/utils"
)

func (app *App) checkReportExists(apiType, token string) bool {
	views := []map[string]interface{}{
		{"key": "report",
			"text":   "select count(*) as anum from ui_report where reportkey in(?)",
			"values": []interface{}{"csv_example_report"},
		},
	}
	viewResult, err := app.getAPI("View", apiType, token, views)
	if err != nil {
		return false
	}
	return (ut.ToInteger(viewResult.(map[string]interface{})["report"].([]interface{})[0].(map[string]interface{})["anum"], 0) > 0)
}

func (app *App) createReport(apiType, token string, reportData map[string]interface{}) error {
	_, err := app.getAPI("Update", apiType, token, map[string]interface{}{
		"nervatype": "ui_report", "data": reportData["ui_report"]})
	return err
}

func (app *App) csvReport(w http.ResponseWriter, r *http.Request) {
	encode := func(data interface{}) string {
		result, _ := ut.ConvertToByte(data)
		return string(result)
	}

	templateData := map[string]interface{}{
		"meta": map[string]interface{}{
			"reportkey":   "csv_example_report",
			"nervatype":   "report",
			"repname":     "CSV Report Example",
			"description": "Customer contacts",
			"label":       "Customer",
			"filetype":    "csv",
		},
		"details": []map[string]interface{}{
			{
				"columns": []interface{}{
					"custname", "firstname", "surname", "status", "phone", "email",
				},
				"name":     "contact",
				"databind": "contact",
			},
		},
		"sources": map[string]interface{}{
			"contact": map[string]interface{}{
				"default": `select c.custname as custname, co.firstname as firstname, co.surname as surname, co.status as status, co.phone as phone, co.email as email
				from contact co
				inner join groups nt on co.nervatype=nt.id and nt.groupvalue='customer'
				inner join customer c on co.ref_id=c.id
				where co.deleted = 0 and c.deleted=0 @where_str`,
			},
		},
		"fields": map[string]interface{}{
			"custname": map[string]interface{}{
				"fieldtype": "string", "wheretype": "where", "description": "Customer Name", "orderby": 0,
			},
			"surname": map[string]interface{}{
				"fieldtype": "string", "wheretype": "where", "description": "Contact Surname", "orderby": 1,
			},
		},
		"data": map[string]interface{}{
			"labels": map[string]interface{}{
				"custname": "Customer", "firstname": "Firstname", "surname": "surname",
				"status": "Status", "phone": "Phone", "email": "Email",
			},
		},
	}

	reportData := map[string]interface{}{
		"ui_report": []map[string]interface{}{
			{"reportkey": templateData["meta"].(map[string]interface{})["reportkey"],
				"repname":     templateData["meta"].(map[string]interface{})["repname"],
				"description": templateData["meta"].(map[string]interface{})["description"],
				"label":       templateData["meta"].(map[string]interface{})["label"],
				"report":      encode(templateData),
				"keys": map[string]interface{}{
					"nervatype": templateData["meta"].(map[string]interface{})["nervatype"],
					"filetype":  templateData["meta"].(map[string]interface{})["filetype"],
				},
			},
		},
	}

	data := map[string]interface{}{
		"username": "admin",
		"database": "demo",
		"api_type": os.Getenv("NT_EXAMPLE_DEFAULT_API"),
		"title":    "CSV Report Example",
		"error":    nil, "exists": false, "client_url": "",
		"api": []string{"cli", "rpc", "http"},
		"env": map[string]interface{}{
			"NT_EXAMPLE_TOKEN_PRIVATE_KEY":    os.Getenv("NT_EXAMPLE_TOKEN_PRIVATE_KEY"),
			"NT_EXAMPLE_TOKEN_EXP":            os.Getenv("NT_EXAMPLE_TOKEN_EXP"),
			"NT_EXAMPLE_TOKEN_ALGORITHM_HMAC": os.Getenv("NT_EXAMPLE_TOKEN_ALGORITHM_HMAC"),
			"NT_TOKEN_ISS":                    os.Getenv("NT_TOKEN_ISS"),
			"NT_TOKEN_PRIVATE_KID":            os.Getenv("NT_TOKEN_PRIVATE_KID"),
			"NT_TOKEN_PRIVATE_KEY":            os.Getenv("NT_TOKEN_PRIVATE_KEY"),
			"NT_ALIAS_DEMO":                   os.Getenv("NT_ALIAS_DEMO"),
		},
		"data": map[string]interface{}{
			"ui_report": encode(reportData["ui_report"]),
		},
	}

	token, err := app.createToken(
		ut.ToString(data["username"], ""),
		ut.ToString(data["database"], ""),
		os.Getenv("NT_TOKEN_PRIVATE_KID"),
		os.Getenv("NT_EXAMPLE_TOKEN_ALGORITHM_HMAC"))
	if err != nil {
		data["error"] = err.Error()
		app.render(w, "csv_report", data)
		return
	}
	data["exists"] = app.checkReportExists(ut.ToString(data["api_type"], ""), token)
	if data["exists"].(bool) {
		data["client_url"] = "http://localhost:" + os.Getenv("NT_HTTP_PORT") + "/client?#access_token=" + token
	}

	if r.Method == "POST" && !data["exists"].(bool) {
		err := r.ParseForm()
		if err != nil {
			data["error"] = err.Error()
			app.render(w, "csv_report", data)
			return
		}
		for key := range r.PostForm {
			data[key] = r.PostForm.Get(key)
		}
		err = app.createReport(data["api_type"].(string), token, reportData)
		if err != nil {
			data["error"] = err.Error()
		}
		data["exists"] = true
		data["client_url"] = "http://localhost:" + os.Getenv("NT_HTTP_PORT") + "/client?#access_token=" + token
	}

	app.render(w, "csv_report", data)
}
