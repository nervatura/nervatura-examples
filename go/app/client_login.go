package app

import (
	"encoding/base64"
	"net/http"
	"os"

	ut "github.com/nervatura/nervatura-examples/utils"
)

func (app *App) client_login(w http.ResponseWriter, r *http.Request) {
	data := map[string]interface{}{
		"username":      "admin",
		"database":      "demo",
		"response_type": "code",
		"title":         "Nervatura Client custom token login - with the HMAC algorithm",
		"error":         nil,
		"env": map[string]interface{}{
			"NT_EXAMPLE_TOKEN_PRIVATE_KEY": os.Getenv("NT_EXAMPLE_TOKEN_PRIVATE_KEY"),
			"NT_EXAMPLE_TOKEN_EXP":         os.Getenv("NT_EXAMPLE_TOKEN_EXP"),
			"NT_EXAMPLE_TOKEN_ALGORITHM":   os.Getenv("NT_EXAMPLE_TOKEN_ALGORITHM"),
			"NT_TOKEN_ISS":                 os.Getenv("NT_TOKEN_ISS"),
			"NT_TOKEN_PUBLIC_KID":          os.Getenv("NT_TOKEN_PUBLIC_KID"),
			"NT_TOKEN_PUBLIC_KEY":          os.Getenv("NT_TOKEN_PUBLIC_KEY"),
			"NT_ALIAS_DEMO":                os.Getenv("NT_ALIAS_DEMO"),
		},
	}
	if r.Method == "GET" {
		if r.URL.Query().Get("error") != "" {
			errMsg, err := base64.URLEncoding.DecodeString(r.URL.Query().Get("error"))
			if err == nil {
				data["error"] = string(errMsg)
			}
		}
		app.render(w, "client_login", data)
		return
	}

	err := r.ParseForm()
	if err != nil {
		data["error"] = err.Error()
		app.render(w, "client_login", data)
		return
	}
	for key := range r.PostForm {
		data[key] = r.PostForm.Get(key)
	}

	url := "http://localhost:" + os.Getenv("NT_HTTP_PORT") + "/client"
	//url := "http://localhost:3000"
	token, err := app.createToken(
		ut.ToString(data["username"], ""),
		ut.ToString(data["database"], ""),
		os.Getenv("NT_TOKEN_PUBLIC_KID"),
		os.Getenv("NT_EXAMPLE_TOKEN_ALGORITHM"))
	if err != nil {
		data["error"] = err.Error()
		app.render(w, "client_login", data)
		return
	}
	if ut.ToString(data["response_type"], "") == "code" {
		code := ut.RandString(10)
		app.sessions[code] = token
		url += "?#code=" + code + "&callback=http://" + os.Getenv("NT_EXAMPLE_HOST") + ":" + os.Getenv("NT_EXAMPLE_PORT") + "/client_login/token&error=http://" + os.Getenv("NT_EXAMPLE_HOST") + ":" + os.Getenv("NT_EXAMPLE_PORT") + "/client_login"
	} else {
		url += "?#access_token=" + token + "&callback=http://" + os.Getenv("NT_EXAMPLE_HOST") + ":" + os.Getenv("NT_EXAMPLE_PORT") + "/client_login"
	}
	http.Redirect(w, r, url, http.StatusSeeOther)
}

func (app *App) codeToken(w http.ResponseWriter, r *http.Request) {
	var data map[string]interface{}
	err := ut.ConvertFromReader(r.Body, &data)
	if err != nil {
		app.sendRequest(w, 400, map[string]interface{}{"code": 400, "error": map[string]string{"message": err.Error()}})
		return
	}
	if code, found := data["code"]; found {
		if token, found := app.sessions[ut.ToString(code, "")]; found {
			app.sendRequest(w, 200, map[string]interface{}{
				"access_token": token,
				"token_type":   "bearer",
				"expires_in":   os.Getenv("NT_EXAMPLE_TOKEN_EXP"),
				"callback":     "http://" + os.Getenv("NT_EXAMPLE_HOST") + ":" + os.Getenv("NT_EXAMPLE_PORT") + "/client_login",
			})
			return
		}
	}
	app.sendRequest(w, 400, map[string]interface{}{"code": 400, "error": map[string]string{"message": "Invalid code"}})
}
