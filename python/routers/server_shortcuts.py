""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import os
from fastapi import APIRouter, Request, Form
from fastapi.responses import HTMLResponse, JSONResponse, PlainTextResponse
from fastapi.templating import Jinja2Templates
from typing import Any, Dict, Optional

from lib.api import getApi
import lib.utils as utils

router = APIRouter(prefix="/server_shortcuts")
templates = Jinja2Templates(directory="templates")

shortcut_data = {
  "username": "admin",
  "database": "demo",
  "api_type": "cli",
  "title": "Nervatura Client menu shortcuts",
  "homepage_title": "External page - GET example",
  "error": False, "exists": False, "homepage": False, "client_url": "",
  "env": {
    "NT_EXAMPLE_TOKEN_PRIVATE_KEY": os.getenv("NT_EXAMPLE_TOKEN_PRIVATE_KEY"),
    "NT_EXAMPLE_TOKEN_EXP": os.getenv("NT_EXAMPLE_TOKEN_EXP"),
    "NT_EXAMPLE_TOKEN_ALGORITHM_HMAC": os.getenv("NT_EXAMPLE_TOKEN_ALGORITHM_HMAC"),
    "NT_TOKEN_ISS": os.getenv("NT_TOKEN_ISS"),
    "NT_TOKEN_PRIVATE_KID": os.getenv("NT_TOKEN_PRIVATE_KID"),
    "NT_TOKEN_PRIVATE_KEY": os.getenv("NT_TOKEN_PRIVATE_KEY"),
    "NT_ALIAS_DEMO": os.getenv("NT_ALIAS_DEMO"),
    "NT_SMTP_HOST": os.getenv("NT_SMTP_HOST"),
    "NT_SMTP_PORT": os.getenv("NT_SMTP_PORT"),
    "NT_SMTP_USER": os.getenv("NT_SMTP_USER"),
    "NT_SMTP_PASSWORD": os.getenv("NT_SMTP_PASSWORD"),
  },
  "data": {
    "ui_menu": [
      { "menukey": "mnu_example_homepage", "description": "External page - GET example", "funcname": "homepage",
        "address": "http://"+str(os.getenv("NT_EXAMPLE_HOST"))+":"+str(os.getenv("NT_EXAMPLE_PORT"))+"/server_shortcuts/homepage",
        "keys": { "method": "get" }},
      { "menukey": "mnu_example_email", "description": "Email sending - POST example", "funcname": "email",
        "address": "http://"+str(os.getenv("NT_EXAMPLE_HOST"))+":"+str(os.getenv("NT_EXAMPLE_PORT"))+"/server_shortcuts/email",
        "keys": { "method": "post" }},
    ],
    "ui_menufields": [
      { "fieldname": "homepage_string", "description": "String input", "orderby": 0,
        "keys": { "menu_id": "mnu_example_homepage", "fieldtype": "string" }},
      { "fieldname": "homepage_bool", "description": "Bool input", "orderby": 1,
        "keys": { "menu_id": "mnu_example_homepage", "fieldtype": "bool" }},
      { "fieldname": "homepage_date", "description": "Date input", "orderby": 2,
        "keys": { "menu_id": "mnu_example_homepage", "fieldtype": "date" }},
      { "fieldname": "homepage_integer", "description": "Integer input", "orderby": 3,
        "keys": { "menu_id": "mnu_example_homepage", "fieldtype": "integer" }},
      { "fieldname": "homepage_float", "description": "Float input", "orderby": 4,
        "keys": { "menu_id": "mnu_example_homepage", "fieldtype": "float" }},
      { "fieldname": "email_from", "description": "Sender email", "orderby": 0,
        "keys": { "menu_id": "mnu_example_email", "fieldtype": "string" }},
      { "fieldname": "email_to", "description": "Email address", "orderby": 1,
        "keys": { "menu_id": "mnu_example_email", "fieldtype": "string" }},
    ]
  }
}

html_data = {
  "data": {
    "ui_menu": str(utils.encodeOptions(shortcut_data["data"]["ui_menu"]),"utf-8"),
    "ui_menufields": str(utils.encodeOptions(shortcut_data["data"]["ui_menufields"]),"utf-8")
  }
}

def checkFunctions(token, api_type):
  views = [
    { "key": "menu",
      "text": "select count(*) as anum from ui_menu where menukey in(?,?)",
      "values": ["mnu_example_homepage","mnu_example_email"] 
    }
  ]
  view_result = getApi(api_type, "View")(token, views)
  if view_result[1] is not None:
    return False
  return (int(view_result[0]["menu"][0]["anum"])>0)


@router.get("/", response_class=HTMLResponse)
async def index(request: Request):
  token = utils.CreateToken({ 
    "username": shortcut_data["username"], "database": shortcut_data["database"],
    "algorithm":  os.getenv("NT_EXAMPLE_TOKEN_ALGORITHM_HMAC"),
    "kid": os.getenv("NT_TOKEN_PRIVATE_KID")
  })
  exists = checkFunctions(token, shortcut_data["api_type"])
  data = shortcut_data | html_data | { 
    "request": request, "exists": exists,
    "client_url": "http://localhost:"+os.getenv("NT_HTTP_PORT")+"/client?#access_token="+token if exists else ""
  }
  return templates.TemplateResponse("server_shortcuts.html", data)

def createShortcuts(token, api_type):
  result = getApi(api_type, "Update")(
    token, {"nervatype": "ui_menu", "data": shortcut_data["data"]["ui_menu"]})
  if result[1] is not None:
    return result
  result = getApi(api_type, "Update")(
    token, {"nervatype": "ui_menufields", "data": shortcut_data["data"]["ui_menufields"]})
  return result

@router.post("/", response_class=HTMLResponse)
async def login(
  request: Request,
  username: str = Form(...),
  database: str = Form(...),
  api_type: str = Form(...),
):
  token = utils.CreateToken({ 
    "username": username, "database": database,
    "algorithm":  os.getenv("NT_EXAMPLE_TOKEN_ALGORITHM_HMAC"),
    "kid": os.getenv("NT_TOKEN_PRIVATE_KID")
  })
  data = shortcut_data | {
    "api_type": api_type, "request": request,
    "client_url": "http://localhost:"+os.getenv("NT_HTTP_PORT")+"/client?#access_token="+token,
    "error": False, "exists": True
  }
  if checkFunctions(token, api_type) == False:
    result = createShortcuts(token, api_type)
    if result[1] is not None:
      data["error"] = result[1]
      data["exists"] = False
      data["client_url"] = ""
  return templates.TemplateResponse("server_shortcuts.html", data)

@router.get("/homepage", response_class=HTMLResponse)
async def homepage(
  request: Request,
  homepage_string: Optional[str] = "MISSING",
  homepage_bool: Optional[int] = 0,
  homepage_date: Optional[str] = "MISSING",
  homepage_integer: Optional[int] = 0,
  homepage_float: Optional[float] = 0,
):
  homepage_string = "EMPTY" if homepage_string == "" else homepage_string
  homepage_date = "EMPTY" if homepage_date == "" else homepage_date
  data = shortcut_data | { 
    "request": request, "homepage": True, "homepage_values": {
      "homepage_string": homepage_string,
      "homepage_bool": homepage_bool,
      "homepage_date": homepage_date,
      "homepage_integer": homepage_integer,
      "homepage_float": homepage_float,
    }
  }
  return templates.TemplateResponse("server_shortcuts.html", data)

@router.post("/email")
async def email(options: Dict[Any, Any]):
  if "@" not in options["values"]["email_from"]:
    return JSONResponse(
      content={"code":400, "error": { "message": "Invalid sender address" }}, status_code=400)
  
  if "@" not in options["values"]["email_to"]:
    return JSONResponse(
      content={"code":400, "error": { "message": "Invalid email address" }}, status_code=400)

  if os.getenv("NT_SMTP_HOST") == "EXAMPLE_SMTP_HOST" or os.getenv("NT_SMTP_USER") == "EXAMPLE_SMTP_USER" or os.getenv("NT_SMTP_PASSWORD") == "EXAMPLE_SMTP_PASSWORD":
    return JSONResponse(
      content={"code":400, "error": { "message": "Invalid SMTP settings" }}, status_code=400)
  
  token = utils.CreateToken({ 
    "username": shortcut_data["username"], "database": shortcut_data["database"],
    "algorithm":  os.getenv("NT_EXAMPLE_TOKEN_ALGORITHM_HMAC"),
    "kid": os.getenv("NT_TOKEN_PRIVATE_KID")
  })
  params = { 
    "key": "sendEmail", 
    "values": { 
      "provider": "smtp",
      "email": { 
        "from": options["values"]["email_from"],
        "recipients": [
          { "email": options["values"]["email_to"] },
        ],
        "subject": "Thank you for your order", 
        "html": "<p>Thank you for your order!</p><b>Please</b> note: ...",
        "attachments" :[{ 
          "reportkey":  "ntr_invoice_en", 
          "nervatype": "trans", 
          "refnumber": "DMINV/00001" 
        }] 
      }
    }
  }
  result = getApi("cgo", "Function")(token, params)
  if result[1] is not None:
    return JSONResponse(
      content={"code":400, "error": { "message": result[1] }}, status_code=400)

  return PlainTextResponse("The message was successfully sent")