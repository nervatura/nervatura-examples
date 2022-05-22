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

router = APIRouter(prefix="/csv_report")
templates = Jinja2Templates(directory="templates")

report_data = {
  "meta": {
    "reportkey": "csv_example_report",
    "nervatype": "report",
    "repname": "CSV Report Example",
    "description": "Customer contacts",
    "label": "Customer",
    "filetype": "csv"
  },
  "details": [
    {
      "columns": [
        "custname", "firstname", "surname", "status", "phone", "email"
      ],
      "name": "contact",
      "databind": "contact"
    }
  ],
  "sources": {
    "contact": {
      "default": """select c.custname as custname, co.firstname as firstname, co.surname as surname, co.status as status, co.phone as phone, co.email as email
      from contact co
      inner join groups nt on co.nervatype=nt.id and nt.groupvalue='customer'
      inner join customer c on co.ref_id=c.id
      where co.deleted = 0 and c.deleted=0 @where_str"""
    }
  },
  "fields": {
    "custname": {
      "fieldtype": "string", "wheretype": "where", "description": "Customer Name", "orderby": 0
    },
    "surname": {
      "fieldtype": "string", "wheretype": "where", "description": "Contact Surname", "orderby": 1
    },
  },
  "data": {
    "labels": {
      "custname": "Customer", "firstname": "Firstname", "surname": "surname", 
      "status": "Status", "phone": "Phone", "email": "Email"
    }
  }
}

example_data = {
  "username": "admin",
  "database": "demo",
  "api_type": os.getenv("NT_EXAMPLE_DEFAULT_API"),
  "title": "CSV Report Example",
  "error": False, "exists": False, "client_url": "",
  "env": {
    "NT_EXAMPLE_TOKEN_PRIVATE_KEY": os.getenv("NT_EXAMPLE_TOKEN_PRIVATE_KEY"),
    "NT_EXAMPLE_TOKEN_EXP": os.getenv("NT_EXAMPLE_TOKEN_EXP"),
    "NT_EXAMPLE_TOKEN_ALGORITHM": os.getenv("NT_EXAMPLE_TOKEN_ALGORITHM"),
    "NT_TOKEN_ISS": os.getenv("NT_TOKEN_ISS"),
    "NT_TOKEN_PUBLIC_KID": os.getenv("NT_TOKEN_PUBLIC_KID"),
    "NT_TOKEN_PUBLIC_KEY": os.getenv("NT_TOKEN_PUBLIC_KEY"),
    "NT_ALIAS_DEMO": os.getenv("NT_ALIAS_DEMO")
  },
  "data": {
    "ui_report": [
      { "reportkey": report_data["meta"]["reportkey"],
        "repname": report_data["meta"]["repname"],
        "description": report_data["meta"]["description"],
        "label": report_data["meta"]["label"],
        "report": str(utils.encodeOptions(dict(report_data)),"utf-8"),
        "keys": {
          "nervatype": report_data["meta"]["nervatype"],
          "filetype": report_data["meta"]["filetype"]
        }
      }
    ]
  }
}

html_data = {
  "data": {
    "ui_report": str(utils.encodeOptions(example_data["data"]["ui_report"]),"utf-8"),
  }
}

def checkFunctions(token, api_type):
  views = [
    { "key": "report",
      "text": "select count(*) as anum from ui_report where reportkey in(?)",
      "values": ["csv_example_report"] 
    }
  ]
  view_result = getApi(api_type, "View")(token, views)
  if view_result[1] is not None:
    return False
  return (int(view_result[0]["report"][0]["anum"])>0)

@router.get("/", response_class=HTMLResponse)
async def index(request: Request):
  token = utils.CreateToken({ 
    "username": example_data["username"], "database": example_data["database"],
    "algorithm":  os.getenv("NT_EXAMPLE_TOKEN_ALGORITHM"),
    "kid": os.getenv("NT_TOKEN_PUBLIC_KID")
  })
  exists = checkFunctions(token, example_data["api_type"])
  data = example_data | html_data | { 
    "request": request, "exists": exists,
    "client_url": "http://localhost:"+os.getenv("NT_HTTP_PORT")+"/client?#access_token="+token if exists else ""
  }
  return templates.TemplateResponse("csv_report.html", data)

def createReport(token, api_type):
  result = getApi(api_type, "Update")(
    token, {"nervatype": "ui_report", "data": example_data["data"]["ui_report"]})
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
    "algorithm":  os.getenv("NT_EXAMPLE_TOKEN_ALGORITHM"),
    "kid": os.getenv("NT_TOKEN_PUBLIC_KID")
  })
  data = example_data | {
    "api_type": api_type, "request": request,
    "client_url": "http://localhost:"+os.getenv("NT_HTTP_PORT")+"/client?#access_token="+token,
    "error": False, "exists": True
  }
  if checkFunctions(token, api_type) == False:
    result = createReport(token, api_type)
    if result[1] is not None:
      data["error"] = result[1]
      data["exists"] = False
      data["client_url"] = ""
  return templates.TemplateResponse("csv_report.html", data)