package app

import (
	"net/http"
	"os"
)

func (app *App) externalToken(w http.ResponseWriter, r *http.Request) {
	data := map[string]interface{}{
		"title": "Using external API for token based authentication",
		"env": map[string]interface{}{
			"NT_ALIAS_DEMO":           os.Getenv("NT_ALIAS_DEMO"),
			"NT_ALIAS_DEFAULT":        "demo",
			"NT_TOKEN_PUBLIC_KEY_URL": os.Getenv("NT_TOKEN_PUBLIC_KEY_URL"),
		},
	}

	app.render(w, "external_token", data)
}
