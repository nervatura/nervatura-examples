package app

import (
	"net/http"
	"os"
	"strings"

	ut "github.com/nervatura/nervatura/service/pkg/utils"
)

func (app *App) checkMenuExists(apiType, token string) bool {
	views := []map[string]interface{}{
		{"key": "menu",
			"text":   "select count(*) as anum from ui_menu where menukey in(?,?)",
			"values": []interface{}{"mnu_example_homepage", "mnu_example_email"},
		},
	}
	viewResult, err := app.getAPI("View", apiType, token, views)
	if err != nil {
		return false
	}
	return (ut.ToInteger(viewResult.(map[string]interface{})["menu"].([]interface{})[0].(map[string]interface{})["anum"], 0) > 0)
}

func (app *App) createShortcuts(apiType, token string, menuData map[string]interface{}) error {
	_, err := app.getAPI("Update", apiType, token, map[string]interface{}{
		"nervatype": "ui_menu", "data": menuData["ui_menu"]})
	if err != nil {
		return err
	}
	_, err = app.getAPI("Update", apiType, token, map[string]interface{}{
		"nervatype": "ui_menufields", "data": menuData["ui_menufields"]})
	return err
}

func (app *App) serverShortcuts(w http.ResponseWriter, r *http.Request) {
	encode := func(data interface{}) string {
		result, _ := ut.ConvertToByte(data)
		return string(result)
	}

	menuData := map[string]interface{}{
		"ui_menu": []map[string]interface{}{
			{"menukey": "mnu_example_homepage", "description": "External page - GET example", "funcname": "homepage",
				"address": "http://" + os.Getenv("NT_EXAMPLE_HOST") + ":" + os.Getenv("NT_EXAMPLE_PORT") + "/server_shortcuts/homepage",
				"keys":    map[string]interface{}{"method": "get"}},
			{"menukey": "mnu_example_email", "description": "Email sending - POST example", "funcname": "email",
				"address": "http://" + os.Getenv("NT_EXAMPLE_HOST") + ":" + os.Getenv("NT_EXAMPLE_PORT") + "/server_shortcuts/email",
				"keys":    map[string]interface{}{"method": "post"}},
		},
		"ui_menufields": []map[string]interface{}{
			{"fieldname": "homepage_string", "description": "String input", "orderby": 0,
				"keys": map[string]interface{}{"menu_id": "mnu_example_homepage", "fieldtype": "string"}},
			{"fieldname": "homepage_bool", "description": "Bool input", "orderby": 1,
				"keys": map[string]interface{}{"menu_id": "mnu_example_homepage", "fieldtype": "bool"}},
			{"fieldname": "homepage_date", "description": "Date input", "orderby": 2,
				"keys": map[string]interface{}{"menu_id": "mnu_example_homepage", "fieldtype": "date"}},
			{"fieldname": "homepage_integer", "description": "Integer input", "orderby": 3,
				"keys": map[string]interface{}{"menu_id": "mnu_example_homepage", "fieldtype": "integer"}},
			{"fieldname": "homepage_float", "description": "Float input", "orderby": 4,
				"keys": map[string]interface{}{"menu_id": "mnu_example_homepage", "fieldtype": "float"}},
			{"fieldname": "email_from", "description": "Sender email", "orderby": 0,
				"keys": map[string]interface{}{"menu_id": "mnu_example_email", "fieldtype": "string"}},
			{"fieldname": "email_to", "description": "Email address", "orderby": 1,
				"keys": map[string]interface{}{"menu_id": "mnu_example_email", "fieldtype": "string"}},
		},
	}
	data := map[string]interface{}{
		"username": "admin",
		"database": "demo",
		"api_type": os.Getenv("NT_EXAMPLE_DEFAULT_API"),
		"title":    "Nervatura Client menu shortcuts",
		"error":    nil, "exists": false, "homepage": nil, "client_url": "",
		"api": []string{"cli", "rpc", "http"},
		"env": map[string]interface{}{
			"NT_EXAMPLE_TOKEN_PRIVATE_KEY": os.Getenv("NT_EXAMPLE_TOKEN_PRIVATE_KEY"),
			"NT_EXAMPLE_TOKEN_EXP":         os.Getenv("NT_EXAMPLE_TOKEN_EXP"),
			"NT_EXAMPLE_TOKEN_ALGORITHM":   os.Getenv("NT_EXAMPLE_TOKEN_ALGORITHM"),
			"NT_TOKEN_ISS":                 os.Getenv("NT_TOKEN_ISS"),
			"NT_TOKEN_PUBLIC_KID":          os.Getenv("NT_TOKEN_PUBLIC_KID"),
			"NT_TOKEN_PUBLIC_KEY":          os.Getenv("NT_TOKEN_PUBLIC_KEY"),
			"NT_ALIAS_DEMO":                os.Getenv("NT_ALIAS_DEMO"),
			"NT_SMTP_HOST":                 os.Getenv("NT_SMTP_HOST"),
			"NT_SMTP_PORT":                 os.Getenv("NT_SMTP_PORT"),
			"NT_SMTP_USER":                 os.Getenv("NT_SMTP_USER"),
			"NT_SMTP_PASSWORD":             os.Getenv("NT_SMTP_PASSWORD"),
		},
		"data": map[string]interface{}{
			"ui_menu":       encode(menuData["ui_menu"]),
			"ui_menufields": encode(menuData["ui_menufields"]),
		},
	}

	token, err := app.createToken(
		ut.ToString(data["username"], ""),
		ut.ToString(data["database"], ""),
		os.Getenv("NT_TOKEN_PUBLIC_KID"),
		os.Getenv("NT_EXAMPLE_TOKEN_ALGORITHM"))
	if err != nil {
		data["error"] = err.Error()
		app.render(w, "server_shortcuts", data)
		return
	}
	data["exists"] = app.checkMenuExists(ut.ToString(data["api_type"], ""), token)
	if data["exists"].(bool) {
		data["client_url"] = "http://localhost:" + os.Getenv("NT_HTTP_PORT") + "/client?#access_token=" + token
	}

	if r.Method == "POST" && !data["exists"].(bool) {
		err := r.ParseForm()
		if err != nil {
			data["error"] = err.Error()
			app.render(w, "server_shortcuts", data)
			return
		}
		for key := range r.PostForm {
			data[key] = r.PostForm.Get(key)
		}
		err = app.createShortcuts(data["api_type"].(string), token, menuData)
		if err != nil {
			data["error"] = err.Error()
		}
		data["exists"] = true
		data["client_url"] = "http://localhost:" + os.Getenv("NT_HTTP_PORT") + "/client?#access_token=" + token
	}

	app.render(w, "server_shortcuts", data)
}

func (app *App) menuHomepage(w http.ResponseWriter, r *http.Request) {
	data := map[string]interface{}{
		"homepage": true,
		"title":    "External page - GET example",
		"homepage_values": map[string]interface{}{
			"homepage_string":  ut.ToString(r.URL.Query().Get("homepage_string"), "EMPTY"),
			"homepage_bool":    r.URL.Query().Get("homepage_bool"),
			"homepage_date":    ut.ToString(r.URL.Query().Get("homepage_date"), "EMPTY"),
			"homepage_integer": r.URL.Query().Get("homepage_integer"),
			"homepage_float":   r.URL.Query().Get("homepage_float"),
		},
	}
	app.render(w, "server_shortcuts", data)
}

func (app *App) menuEmail(w http.ResponseWriter, r *http.Request) {
	var data map[string]interface{}
	err := ut.ConvertFromReader(r.Body, &data)
	if err != nil {
		app.sendRequest(w, 400, map[string]interface{}{
			"code":  400,
			"error": map[string]string{"message": err.Error()},
		})
		return
	}
	values := data["values"].(map[string]interface{})
	if !strings.Contains(ut.ToString(values["email_from"], ""), "@") {
		app.sendRequest(w, 400, map[string]interface{}{
			"code":  400,
			"error": map[string]string{"message": "Invalid sender address"},
		})
		return
	}
	if !strings.Contains(ut.ToString(values["email_to"], ""), "@") {
		app.sendRequest(w, 400, map[string]interface{}{
			"code":  400,
			"error": map[string]string{"message": "Invalid email address"},
		})
		return
	}
	if os.Getenv("NT_SMTP_HOST") == "EXAMPLE_SMTP_HOST" ||
		os.Getenv("NT_SMTP_USER") == "EXAMPLE_SMTP_USER" ||
		os.Getenv("NT_SMTP_PASSWORD") == "EXAMPLE_SMTP_PASSWORD" {
		app.sendRequest(w, 400, map[string]interface{}{
			"code":  400,
			"error": map[string]string{"message": "Invalid SMTP settings"},
		})
		return
	}

	token, err := app.createToken(
		"admin", "demo",
		os.Getenv("NT_TOKEN_PUBLIC_KID"),
		os.Getenv("NT_EXAMPLE_TOKEN_ALGORITHM"))
	if err != nil {
		app.sendRequest(w, 400, map[string]interface{}{
			"code":  400,
			"error": map[string]string{"message": err.Error()},
		})
		return
	}
	params := map[string]interface{}{
		"key": "sendEmail",
		"values": map[string]interface{}{
			"provider": "smtp",
			"email": map[string]interface{}{
				"from": values["email_from"],
				"recipients": []interface{}{
					map[string]interface{}{"email": values["email_to"]}},
				"subject": "Thank you for your order",
				"text":    "<p>Thank you for your order!</p><b>Please</b> note: ...",
				"attachments": []interface{}{
					map[string]interface{}{
						"reportkey": "ntr_invoice_en",
						"nervatype": "trans",
						"refnumber": "DMINV/00001"}},
			},
		},
	}

	_, err = app.getAPI("Function", os.Getenv("NT_EXAMPLE_DEFAULT_API"), token, params)
	if err != nil {
		app.sendRequest(w, 400, map[string]interface{}{
			"code":  400,
			"error": map[string]string{"message": err.Error()},
		})
		return
	}
	w.Write([]byte("The message was successfully sent"))
}
