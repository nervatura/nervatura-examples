package app

import (
	"net/http"
	"os"

	ut "github.com/nervatura/nervatura/service/pkg/utils"
)

func (app *App) tokenLogin(w http.ResponseWriter, r *http.Request) {
	data := map[string]interface{}{
		"username": "admin",
		"database": "demo",
		"api_type": os.Getenv("NT_EXAMPLE_DEFAULT_API"),
		"title":    "Custom token (passwordless) login - public/private key pair",
		"error":    nil, "result": nil,
		"api": []string{"cli", "rpc", "http"},
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

	if r.Method == "POST" {
		err := r.ParseForm()
		if err != nil {
			data["error"] = err.Error()
			app.render(w, "token_login", data)
			return
		}
		for key := range r.PostForm {
			data[key] = r.PostForm.Get(key)
		}
		token, err := app.createToken(
			ut.ToString(data["username"], ""),
			ut.ToString(data["database"], ""),
			os.Getenv("NT_TOKEN_PUBLIC_KID"),
			os.Getenv("NT_EXAMPLE_TOKEN_ALGORITHM"))
		if err != nil {
			data["error"] = err.Error()
		} else {
			data["result"], err = app.getAPI("TokenLogin", data["api_type"].(string), token, nil)
			if err != nil {
				data["error"] = err.Error()
			}
		}
	}

	app.render(w, "token_login", data)
}
