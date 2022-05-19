package app

import (
	"net/http"
	"os"
)

func (app *App) clientConfig(w http.ResponseWriter, r *http.Request) {
	data := map[string]interface{}{
		"title":      "Nervatura Client language translation",
		"client_url": "http://localhost:" + os.Getenv("NT_HTTP_PORT") + "/client",
		"env": map[string]interface{}{
			"NT_CLIENT_CONFIG": os.Getenv("NT_CLIENT_CONFIG"),
			"NT_ALIAS_DEMO":    os.Getenv("NT_ALIAS_DEMO"),
		},
	}

	app.render(w, "client_config", data)
}
