""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import os
import base64
from unittest import result
from fastapi import APIRouter, Request, Form
from fastapi.responses import HTMLResponse, Response
from fastapi.templating import Jinja2Templates

from lib.api import getApi
import lib.utils as utils

router = APIRouter(prefix="/create_invoice")
templates = Jinja2Templates(directory="templates")

invoice_data = {
  "username": "admin",
  "database": "demo",
  "api_type": os.getenv("NT_EXAMPLE_DEFAULT_API"),
  "title": "Create a customer invoice",
  "error": False, "result": False,
  "env": {
    "NT_EXAMPLE_TOKEN_PRIVATE_KEY": os.getenv("NT_EXAMPLE_TOKEN_PRIVATE_KEY"),
    "NT_EXAMPLE_TOKEN_EXP": os.getenv("NT_EXAMPLE_TOKEN_EXP"),
    "NT_EXAMPLE_TOKEN_ALGORITHM": os.getenv("NT_EXAMPLE_TOKEN_ALGORITHM"),
    "NT_TOKEN_ISS": os.getenv("NT_TOKEN_ISS"),
    "NT_TOKEN_PUBLIC_KID": os.getenv("NT_TOKEN_PUBLIC_KID"),
    "NT_TOKEN_PUBLIC_KEY": os.getenv("NT_TOKEN_PUBLIC_KEY"),
    "NT_ALIAS_DEMO": os.getenv("NT_ALIAS_DEMO"),
  },
  "data": {
    "trans": {
      "transdate": "2022-12-24",
      "duedate": "2023-01-01",
      "ref_transnumber": "REFNUMBER",
      "curr": "EUR",
      "notes": "Example invoice",
      "fnote": '<p>'
        +"CONTACT INFORMATION: contact@mail.com<br />"
        +"Telephone: 0123456789</p>",
      "keys": {
        "transnumber": [
          "numberdef", "invoice_out"
        ],
        "customer_id": "EXAMPLE_CUSTOMER",
        "transtype": "invoice",
        "direction": "out",
        "paidtype": "transfer",
        "department": "sales",
        "transtate": "ok"
      }
    },
    "customer": {
      "custnumber": "EXAMPLE_CUSTOMER",
      "custname": "Example Customer",
      "taxnumber": "TN0123456",
      "keys": {
        "custtype": "company"
      }
    },
    "address": [{
      "zipcode": "01234", 
      "city": "City", 
      "street": "Street 123."
    }],
    "contact": [{
      "firstname": "Firstname", 
      "surname": "Surname",
      "phone": "0123456789",
      "email": "contact@mail.com"
    }],
    "items": [
      {
        "unit": "piece",
        "qty": 3,
        "fxprice": 166.67,
        "netamount": 500,
        "discount": 0,
        "vatamount": 100,
        "amount": 600,
        "description": "Big product",
        "keys": {
          "product_id": "DMPROD/00001",
          "tax_id": "20%"
        }
      }
    ],
  }
}

html_data = {
  "data": {
    "trans": str(utils.encodeOptions(invoice_data["data"]["trans"]),"utf-8"),
    "items": str(utils.encodeOptions(invoice_data["data"]["items"]),"utf-8"),
    "customer": str(utils.encodeOptions(invoice_data["data"]["customer"]),"utf-8"),
    "address": str(utils.encodeOptions(invoice_data["data"]["address"]),"utf-8"),
    "contact": str(utils.encodeOptions(invoice_data["data"]["contact"]),"utf-8")
  }
}

@router.get("/", response_class=HTMLResponse)
async def index(request: Request):
  data = invoice_data | html_data | { "request": request }
  return templates.TemplateResponse("create_invoice.html", data)

def createInvoive(token, params):
  views = [
    { "key": "customer",
      "text": "select count(*) as anum from customer where custnumber=?",
      "values": [params["data"]["customer"]["custnumber"]] 
    },
    { "key": "address",
      "text": """select count(*) as anum from address a
        inner join groups g on a.nervatype=g.id and g.groupvalue='customer'
        inner join customer c on a.ref_id=c.id
        where c.custnumber=?""",
      "values": [params["data"]["customer"]["custnumber"]] 
    },
    { "key": "contact",
      "text": """select count(*) as anum from contact co
        inner join groups g on co.nervatype=g.id and g.groupvalue='customer'
        inner join customer c on co.ref_id=c.id
        where c.custnumber=?""",
      "values": [params["data"]["customer"]["custnumber"]] 
    }
  ]
  view_result = getApi(params["api_type"], "View")(token, views)
  if view_result[1] is not None:
    return view_result

  if "customer" in params["data"]:
    if int(view_result[0]["customer"][0]["anum"]) > 0:
      # existing customer
      params["data"]["customer"]["keys"]["id"] = params["data"]["customer"]["custnumber"]
    customer_result = getApi(params["api_type"], "Update")(
      token, {"nervatype": "customer", "data": [params["data"]["customer"]]})
    if customer_result[1] is not None:
      return customer_result

  if "address" in params["data"]:
    if int(view_result[0]["address"][0]["anum"]) > 0:
      # existing address
      params["data"]["address"][0]["keys"] = {
        "id": "customer/"+params["data"]["customer"]["custnumber"]+"~1"
      }
    else:
      # new address data
      params["data"]["address"][0]["keys"] = {
        "nervatype": "customer",
        "ref_id": "customer/"+params["data"]["customer"]["custnumber"]
      }
    address_result = getApi(params["api_type"], "Update")(
      token, {"nervatype": "address", "data": params["data"]["address"]})
    if address_result[1] is not None:
      return address_result
  
  if "contact" in params["data"]:
    if int(view_result[0]["contact"][0]["anum"]) > 0:
      # existing contact
      params["data"]["contact"][0]["keys"] = {
        "id": "customer/"+params["data"]["customer"]["custnumber"]+"~1"
      }
    else:
      # new contact data
      params["data"]["contact"][0]["keys"] = {
        "nervatype": "customer",
        "ref_id": "customer/"+params["data"]["customer"]["custnumber"]
      }
    contact_result = getApi(params["api_type"], "Update")(
      token, {"nervatype": "contact", "data": params["data"]["contact"]})
    if contact_result[1] is not None:
      return contact_result
  
  if "trans" in params["data"]:
    trans_result = getApi(params["api_type"], "Update")(
      token, {"nervatype": "trans", "data": [params["data"]["trans"]]})
    if trans_result[1] is not None:
      return trans_result
  
  if "items" in params["data"]:
    for item in params["data"]["items"]:
      item["trans_id"] = trans_result[0][0]
    item_result = getApi(params["api_type"], "Update")(
      token, {"nervatype": "item", "data": params["data"]["items"]})
    if item_result[1] is not None:
      return item_result

  return [trans_result[0][0], None]

@router.post("/", response_class=HTMLResponse)
async def login(
  request: Request,
  username: str = Form(...),
  database: str = Form(...),
  api_type: str = Form(...),
):
  params = invoice_data | {
    "username": username, "database": database, "api_type": api_type
  }
  token = utils.CreateToken({ 
    "username": username, "database": database,
    "algorithm":  os.getenv("NT_EXAMPLE_TOKEN_ALGORITHM"),
    "kid": os.getenv("NT_TOKEN_PUBLIC_KID")
  })
  request.app.state.session["invoice_token"] = token
  result = createInvoive(token, params)
  data = params | {
    "request": request,
    "error": result[1] if result[1] is not None else False,
    "result": result[0] if result[1] is None else False
  }
  return templates.TemplateResponse("create_invoice.html", data)

@router.get("/report/{api_type}/{trans_id}/", response_class=HTMLResponse)
async def report(
  request: Request,
  api_type: str,
  trans_id: int
):
  params = {
    "reportkey": "ntr_invoice_en",
    "orientation": "portrait",
    "size": "a4",
    "output": "base64",
    "nervatype": "trans",
    "refnumber": "",
    "template": "",
    "filters": { "@id": trans_id }
  }
  if "invoice_token" in request.app.state.session:
    result = getApi(api_type, "Report")(request.app.state.session["invoice_token"], params)
    if result[1] is not None:
      data = invoice_data | html_data | { 
        "request": request, "api_type": api_type, "error": result[1], "result": trans_id
      }
      return templates.TemplateResponse("create_invoice.html", data)
    content = result[0]
    if api_type != "http":
      content = content["template"]
    content = content[content.index(";base64,")+8:]
    content=base64.urlsafe_b64decode(content)
    return Response(
      content=content, status_code=200, media_type="application/pdf", 
      headers={
        "Content-Type": "application/pdf",
        "Content-Disposition": "attachment; filename=Invoice_"+str(trans_id)+".pdf"
      }
    )

  data = invoice_data | html_data | { 
    "request": request, "api_type": api_type, "error": "Missing token", "result": trans_id
  }
  return templates.TemplateResponse("create_invoice.html", data)