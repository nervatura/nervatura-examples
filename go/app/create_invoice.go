package app

import (
	"encoding/base64"
	"net/http"
	"os"
	"strings"

	ut "github.com/nervatura/nervatura/service/pkg/utils"
)

func (app *App) createInvoiceData(apiType, token string, invoiceData map[string]interface{}) (transID int64, err error) {
	views := []map[string]interface{}{
		{"key": "customer",
			"text":   "select count(*) as anum from customer where custnumber=?",
			"values": []interface{}{invoiceData["customer"].(map[string]interface{})["custnumber"]},
		},
		{"key": "address",
			"text": `select count(*) as anum from address a
        inner join groups g on a.nervatype=g.id and g.groupvalue='customer'
        inner join customer c on a.ref_id=c.id
        where c.custnumber=?`,
			"values": []interface{}{invoiceData["customer"].(map[string]interface{})["custnumber"]},
		},
		{"key": "contact",
			"text": `select count(*) as anum from contact co
        inner join groups g on co.nervatype=g.id and g.groupvalue='customer'
        inner join customer c on co.ref_id=c.id
        where c.custnumber=?`,
			"values": []interface{}{invoiceData["customer"].(map[string]interface{})["custnumber"]},
		},
	}
	viewResult, err := app.getAPI("View", apiType, token, views)
	if err != nil {
		return 0, err
	}

	if customer, found := invoiceData["customer"].(map[string]interface{}); found {
		if ut.ToInteger(viewResult.(map[string]interface{})["customer"].([]interface{})[0].(map[string]interface{})["anum"], 0) > 0 {
			// existing customer
			customer["keys"].(map[string]interface{})["id"] = customer["custnumber"]
		}
		_, err := app.getAPI("Update", apiType, token, map[string]interface{}{
			"nervatype": "customer", "data": []map[string]interface{}{customer}})
		if err != nil {
			return 0, err
		}
	}

	if address, found := invoiceData["address"].([]map[string]interface{}); found {
		if ut.ToInteger(viewResult.(map[string]interface{})["address"].([]interface{})[0].(map[string]interface{})["anum"], 0) > 0 {
			// existing address
			address[0]["keys"] = map[string]interface{}{
				"id": "customer/" + ut.ToString(invoiceData["customer"].(map[string]interface{})["custnumber"], "") + "~1",
			}
		} else {
			// new address data
			address[0]["keys"] = map[string]interface{}{
				"nervatype": "customer",
				"ref_id":    "customer/" + ut.ToString(invoiceData["customer"].(map[string]interface{})["custnumber"], ""),
			}
		}
		_, err := app.getAPI("Update", apiType, token, map[string]interface{}{
			"nervatype": "address", "data": address})
		if err != nil {
			return 0, err
		}
	}

	if contact, found := invoiceData["contact"].([]map[string]interface{}); found {
		if ut.ToInteger(viewResult.(map[string]interface{})["contact"].([]interface{})[0].(map[string]interface{})["anum"], 0) > 0 {
			// existing contact
			contact[0]["keys"] = map[string]interface{}{
				"id": "customer/" + ut.ToString(invoiceData["customer"].(map[string]interface{})["custnumber"], "") + "~1",
			}
		} else {
			// new contact data
			contact[0]["keys"] = map[string]interface{}{
				"nervatype": "customer",
				"ref_id":    "customer/" + ut.ToString(invoiceData["customer"].(map[string]interface{})["custnumber"], ""),
			}
		}
		_, err := app.getAPI("Update", apiType, token, map[string]interface{}{
			"nervatype": "contact", "data": contact})
		if err != nil {
			return 0, err
		}
	}

	if trans, found := invoiceData["trans"].(map[string]interface{}); found {
		result, err := app.getAPI("Update", apiType, token, map[string]interface{}{
			"nervatype": "trans", "data": []map[string]interface{}{trans}})
		if err != nil {
			return 0, err
		}
		transID = ut.ToInteger(result.([]interface{})[0], 0)
	}

	if items, found := invoiceData["items"].([]map[string]interface{}); found {
		for _, item := range items {
			item["trans_id"] = transID
		}
		_, err := app.getAPI("Update", apiType, token, map[string]interface{}{
			"nervatype": "item", "data": items})
		if err != nil {
			return 0, err
		}
	}

	return transID, nil
}

func (app *App) createInvoice(w http.ResponseWriter, r *http.Request) {
	encode := func(data interface{}) string {
		result, _ := ut.ConvertToByte(data)
		return string(result)
	}

	invoiceData := map[string]interface{}{
		"trans": map[string]interface{}{
			"transdate":       "2022-12-24",
			"duedate":         "2023-01-01",
			"ref_transnumber": "REFNUMBER",
			"curr":            "EUR",
			"notes":           "Example invoice",
			"fnote":           "<p>CONTACT INFORMATION: contact@mail.com<br />Telephone: 0123456789</p>",
			"keys": map[string]interface{}{
				"transnumber": []string{
					"numberdef", "invoice_out",
				},
				"customer_id": "EXAMPLE_CUSTOMER",
				"transtype":   "invoice",
				"direction":   "out",
				"paidtype":    "transfer",
				"department":  "sales",
				"transtate":   "ok",
			},
		},
		"customer": map[string]interface{}{
			"custnumber": "EXAMPLE_CUSTOMER",
			"custname":   "Example Customer",
			"taxnumber":  "TN0123456",
			"keys": map[string]interface{}{
				"custtype": "company",
			},
		},
		"address": []map[string]interface{}{
			{
				"zipcode": "01234",
				"city":    "City",
				"street":  "Street 123.",
			}},
		"contact": []map[string]interface{}{{
			"firstname": "Firstname",
			"surname":   "Surname",
			"phone":     "0123456789",
			"email":     "contact@mail.com",
		}},
		"items": []map[string]interface{}{
			{
				"unit":        "piece",
				"qty":         3,
				"fxprice":     166.67,
				"netamount":   500,
				"discount":    0,
				"vatamount":   100,
				"amount":      600,
				"description": "Big product",
				"keys": map[string]interface{}{
					"product_id": "DMPROD/00001",
					"tax_id":     "20%",
				},
			},
		},
	}
	data := map[string]interface{}{
		"username": "admin",
		"database": "demo",
		"api_type": os.Getenv("NT_EXAMPLE_DEFAULT_API"),
		"title":    "Create a customer invoice",
		"error":    nil, "result": nil,
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
			"trans":    encode(invoiceData["trans"]),
			"items":    encode(invoiceData["items"]),
			"customer": encode(invoiceData["customer"]),
			"address":  encode(invoiceData["address"]),
			"contact":  encode(invoiceData["contact"]),
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
			os.Getenv("NT_TOKEN_PRIVATE_KID"),
			os.Getenv("NT_EXAMPLE_TOKEN_ALGORITHM_HMAC"))
		if err != nil {
			data["error"] = err.Error()
		} else {
			app.sessions["invoice_token"] = token
			data["result"], err = app.createInvoiceData(data["api_type"].(string), token, invoiceData)
			if err != nil {
				data["error"] = err.Error()
			}
		}
	}

	app.render(w, "create_invoice", data)
}

func (app *App) invoicePDF(w http.ResponseWriter, r *http.Request) {
	params := strings.Split(strings.TrimPrefix(r.URL.Path, "/create_invoice/report/"), "/")
	options := map[string]interface{}{
		"reportkey":   "ntr_invoice_en",
		"orientation": "portrait",
		"size":        "a4",
		"output":      "base64",
		"nervatype":   "trans",
		"refnumber":   "",
		"template":    "",
		"filters":     map[string]interface{}{"@id": ut.ToInteger(params[1], 0)},
	}
	if token, found := app.sessions["invoice_token"]; found {
		result, err := app.getAPI("Report", ut.ToString(params[0], ""), token, options)
		if err == nil {
			contentStr := ""
			if ut.ToString(params[0], "") == "http" {
				contentStr = strings.TrimPrefix(ut.ToString(result, ""), "data:application/pdf;filename=Report.pdf;base64,")
			} else {
				contentStr = strings.TrimPrefix(ut.ToString(result.(map[string]interface{})["template"], ""), "data:application/pdf;filename=Report.pdf;base64,")
			}
			content, err := base64.URLEncoding.DecodeString(contentStr)
			if err == nil {
				w.Header().Set("Content-Type", "application/pdf")
				w.Write([]byte(content))
				return
			}
		}
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	http.Error(w, "Missing token", http.StatusInternalServerError)
}
