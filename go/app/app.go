package app

import (
	"embed"
	"fmt"
	"net/http"
	"os"
	"path"
	"path/filepath"
	"strings"
	"text/template"
	"time"

	"github.com/joho/godotenv"
	srv "github.com/nervatura/nervatura-examples/service"
	ut "github.com/nervatura/nervatura-examples/utils"
	"github.com/slavamuravey/cors"
)

type App struct {
	apiMap     map[string]APIService
	templates  map[string]*template.Template
	sessions   map[string]string
	privateKey string
}

type APIService interface {
	DatabaseCreate(apiKey string, options map[string]interface{}) (interface{}, error)
	UserLogin(options map[string]interface{}) (interface{}, error)
	TokenLogin(token string) (interface{}, error)
	TokenRefresh(token string) (interface{}, error)
	UserPassword(token string, options map[string]interface{}) (interface{}, error)
	Delete(token string, options map[string]interface{}) (interface{}, error)
	Get(token string, options map[string]interface{}) (interface{}, error)
	View(token string, data []map[string]interface{}) (interface{}, error)
	Function(token string, options map[string]interface{}) (interface{}, error)
	Update(token string, options map[string]interface{}) (interface{}, error)
	Report(token string, options map[string]interface{}) (interface{}, error)
	ReportList(token string, options map[string]interface{}) (interface{}, error)
	ReportDelete(token string, options map[string]interface{}) (interface{}, error)
	ReportInstall(token string, options map[string]interface{}) (interface{}, error)
}

//go:embed templates
var static embed.FS

func New() (err error) {
	err = godotenv.Load(".env")
	if err != nil {
		godotenv.Load(".env.example")
	}

	app := &App{
		apiMap: map[string]APIService{
			"rpc":  &srv.RpcClient{},
			"cli":  &srv.CliClient{},
			"http": &srv.HttpClient{},
		},
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
			content, err := os.ReadFile(filepath.Clean(os.Getenv("NT_EXAMPLE_TOKEN_PRIVATE_KEY")))
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

func (app *App) sendRequest(w http.ResponseWriter, code int, payload interface{}) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(code)
	response, err := ut.ConvertToByte(payload)
	if err == nil {
		w.Write(response)
	}
}
