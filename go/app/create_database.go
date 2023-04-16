package app

import (
	"net/http"
	"os"

	ut "github.com/nervatura/nervatura-examples/utils"
)

func (app *App) createDatabase(w http.ResponseWriter, r *http.Request) {
	data := map[string]interface{}{
		"api_key":  os.Getenv("NT_API_KEY"),
		"database": "demo",
		"demo":     "true",
		"api_type": os.Getenv("NT_EXAMPLE_DEFAULT_API"),
		"title":    "Create a demo database",
		"error":    nil, "result": nil,
		"api": []string{"cli", "rpc", "http"},
		"env": map[string]string{
			"NT_API_KEY":    os.Getenv("NT_API_KEY"),
			"NT_ALIAS_DEMO": os.Getenv("NT_ALIAS_DEMO"),
		},
	}

	if r.Method == "POST" {
		err := r.ParseForm()
		if err != nil {
			data["error"] = err.Error()
			app.render(w, "create_database", data)
			return
		}
		options := make(map[string]interface{})
		api_type := data["api_type"].(string)
		for key := range r.PostForm {
			if key == "api_type" {
				api_type = r.PostForm.Get(key)
			} else {
				options[key] = r.PostForm.Get(key)
			}
			data[key] = r.PostForm.Get(key)
		}
		data["result"], err = app.apiMap[api_type].DatabaseCreate(ut.ToString(data["api_key"], ""), options)
		if err != nil {
			data["error"] = err.Error()
		}
	}

	app.render(w, "create_database", data)
}
