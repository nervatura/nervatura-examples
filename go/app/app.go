package app

import (
	"embed"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"path"
	"path/filepath"
	"strings"
	"text/template"
	"time"

	"github.com/joho/godotenv"
	srv "github.com/nervatura/nervatura-examples/service"
	ut "github.com/nervatura/nervatura/service/pkg/utils"
	"github.com/slavamuravey/cors"
	"google.golang.org/grpc"
)

type App struct {
	rpc        *srv.RpcClient
	cli        *srv.CliClient
	http       *srv.HttpClient
	templates  map[string]*template.Template
	sessions   map[string]string
	privateKey string
}

//go:embed templates
var static embed.FS

func New() (err error) {
	err = godotenv.Load(".env")
	if err != nil {
		godotenv.Load(".env.example")
	}

	app := &App{
		rpc:        &srv.RpcClient{},
		cli:        &srv.CliClient{},
		http:       &srv.HttpClient{},
		sessions:   make(map[string]string),
		templates:  make(map[string]*template.Template),
		privateKey: "",
	}
	app.loadTemplates()
	app.setRouters()

	fmt.Printf("Example server serving at: %s:%s.\n", os.Getenv("NT_EXAMPLE_HOST"), os.Getenv("NT_EXAMPLE_PORT"))
	return http.ListenAndServe(os.Getenv("NT_EXAMPLE_HOST")+":"+os.Getenv("NT_EXAMPLE_PORT"), nil)
}

func (app *App) setRouters() {
	config := &cors.Config{
		AllowAllOrigin:   true,
		AllowAllHeaders:  true,
		AllowCredentials: true,
		//AllowOriginPattern: "^https?://localhost(:[0-9]+)?$",
		AllowMethods: []string{"POST", "GET", "OPTIONS", "PUT", "DELETE"},
	}
	corsMiddleware := cors.CreateMiddleware(config)

	http.HandleFunc("/", app.home)
	http.HandleFunc("/create_database", app.createDatabase)
	http.HandleFunc("/password_login", app.passwordLogin)
	http.HandleFunc("/token_login", app.tokenLogin)
	http.HandleFunc("/client_login", app.client_login)
	http.HandleFunc("/client_login/token", corsMiddleware(http.HandlerFunc(app.codeToken)))
	http.HandleFunc("/external_token", app.externalToken)
	http.HandleFunc("/client_config", app.clientConfig)
	http.HandleFunc("/create_invoice", app.createInvoice)
	http.HandleFunc("/create_invoice/report/", app.invoicePDF)
	http.HandleFunc("/server_shortcuts", app.serverShortcuts)
	http.HandleFunc("/server_shortcuts/homepage", app.menuHomepage)
	http.HandleFunc("/server_shortcuts/email", corsMiddleware(http.HandlerFunc(app.menuEmail)))
	http.HandleFunc("/csv_report", app.csvReport)
}

func (app *App) loadTemplates() {
	funcMap := template.FuncMap{
		"ToUpper": strings.ToUpper,
	}
	parseTemplate := func(file string) *template.Template {
		return template.Must(
			template.New("layout.html").Funcs(funcMap).ParseFS(static, path.Join("templates", "layout.html"), path.Join("templates", file)))
	}
	tempFiles := []string{
		"home", "password_login", "create_database", "token_login", "client_login",
		"external_token", "client_config", "create_invoice", "server_shortcuts", "csv_report",
	}
	for _, fkey := range tempFiles {
		app.templates[fkey] = parseTemplate(fkey + ".html")
	}
}

func (app *App) render(w http.ResponseWriter, file string, data interface{}) {
	w.Header().Set("Content-Type", "text/html; charset=utf-8")
	err := app.templates[file].Execute(w, data)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

func (app *App) home(w http.ResponseWriter, r *http.Request) {
	demo_db := false
	if _, err := os.Stat(filepath.Join("data", "demo.db")); err != nil {
		demo_db = true
	}
	data := map[string]interface{}{
		"title": "Nervatura examples",
		"demo":  demo_db,
	}
	app.render(w, "home", data)
}

func (app *App) createToken(username, database, kid, algorithm string) (token string, err error) {
	if app.privateKey == "" {
		app.privateKey = ut.GetHash(time.Now().Format("20060102"))
		if _, err := os.Stat(os.Getenv("NT_EXAMPLE_TOKEN_PRIVATE_KEY")); err == nil {
			content, err := ioutil.ReadFile(filepath.Clean(os.Getenv("NT_EXAMPLE_TOKEN_PRIVATE_KEY")))
			if err == nil {
				app.privateKey = string(content)
			}
		}
	}
	return ut.CreateToken(username, database, map[string]interface{}{
		"NT_TOKEN_EXP":         os.Getenv("NT_EXAMPLE_TOKEN_EXP"),
		"NT_TOKEN_ISS":         os.Getenv("NT_TOKEN_ISS"),
		"NT_TOKEN_PRIVATE_KID": kid,
		"NT_TOKEN_ALG":         algorithm,
		"NT_TOKEN_PRIVATE_KEY": app.privateKey,
	})
}

func (app *App) getAPI(apiFunc, apiType, secret string, options interface{}) (interface{}, error) {
	var conn *grpc.ClientConn
	var err error
	apiMap := map[string]map[string]func() (interface{}, error){
		"DatabaseCreate": {
			"rpc": func() (interface{}, error) {
				return app.rpc.DatabaseCreate(conn, secret, options.(map[string]interface{}))
			},
			"cli": func() (interface{}, error) {
				return app.cli.DatabaseCreate(secret, options.(map[string]interface{}))
			},
			"http": func() (interface{}, error) {
				return app.http.DatabaseCreate(secret, options.(map[string]interface{}))
			},
		},
		"View": {
			"rpc": func() (interface{}, error) {
				return app.rpc.View(conn, secret, options.([]map[string]interface{}))
			},
			"cli": func() (interface{}, error) {
				return app.cli.View(secret, options.([]map[string]interface{}))
			},
			"http": func() (interface{}, error) {
				return app.http.View(secret, options.([]map[string]interface{}))
			},
		},
		"Update": {
			"rpc": func() (interface{}, error) {
				return app.rpc.Update(conn, secret, options.(map[string]interface{}))
			},
			"cli": func() (interface{}, error) {
				return app.cli.Update(secret, options.(map[string]interface{}))
			},
			"http": func() (interface{}, error) {
				return app.http.Update(secret, options.(map[string]interface{}))
			},
		},
		"Report": {
			"rpc": func() (interface{}, error) {
				return app.rpc.Report(conn, secret, options.(map[string]interface{}))
			},
			"cli": func() (interface{}, error) {
				return app.cli.Report(secret, options.(map[string]interface{}))
			},
			"http": func() (interface{}, error) {
				return app.http.Report(secret, options.(map[string]interface{}))
			},
		},
		"TokenLogin": {
			"rpc": func() (interface{}, error) {
				return app.rpc.TokenLogin(conn, secret)
			},
			"cli": func() (interface{}, error) {
				return app.cli.TokenLogin(secret)
			},
			"http": func() (interface{}, error) {
				return app.http.TokenValidate(secret)
			},
		},
		"UserLogin": {
			"rpc": func() (interface{}, error) {
				return app.rpc.UserLogin(conn, options.(map[string]interface{}))
			},
			"cli": func() (interface{}, error) {
				return app.cli.UserLogin(options.(map[string]interface{}))
			},
			"http": func() (interface{}, error) {
				return app.http.UserLogin(options.(map[string]interface{}))
			},
		},
		"Function": {
			"rpc": func() (interface{}, error) {
				return app.rpc.Function(conn, secret, options.(map[string]interface{}))
			},
			"cli": func() (interface{}, error) {
				return app.cli.Function(secret, options.(map[string]interface{}))
			},
			"http": func() (interface{}, error) {
				return app.http.Function(secret, options.(map[string]interface{}))
			},
		},
	}

	if apiType == "rpc" {
		conn, err = app.rpc.Connect()
		if err != nil {
			return nil, err
		}
	}
	result, err := apiMap[apiFunc][apiType]()
	if apiType == "rpc" {
		conn.Close()
	}
	return result, err
}

func (app *App) sendRequest(w http.ResponseWriter, code int, payload interface{}) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(code)
	response, err := ut.ConvertToByte(payload)
	if err == nil {
		w.Write(response)
	}
}
