""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import os
from fastapi import APIRouter, Request, Form
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

from lib.api import getApi

router = APIRouter(prefix="/create_database")
templates = Jinja2Templates(directory="templates")

login_data = {
  "api_key": os.getenv("NT_API_KEY"),
  "alias": "demo",
  "demo": "true",
  "api_type": os.getenv("NT_EXAMPLE_DEFAULT_API"),
  "title": "Create a demo database",
  "error": False, "result": False,
  "env": {
    "NT_API_KEY": os.getenv("NT_API_KEY"),
    "NT_ALIAS_DEMO": os.getenv("NT_ALIAS_DEMO")
  }
}

@router.get("/", response_class=HTMLResponse)
async def index(request: Request):
  data = login_data | { "request": request }
  return templates.TemplateResponse("create_database.html", data)

@router.post("/", response_class=HTMLResponse)
async def login(
  request: Request,
  api_key: str = Form(...),
  alias: str = Form(...),
  demo: str = Form(...),
  api_type: str = Form(...),
):
  result = getApi(api_type, "DatabaseCreate")(
    api_key, 
    { "database": alias, "demo": True if demo == "true" else False })
  data = login_data | { "api_key": api_key,
    "alias": alias, "demo": demo, "api_type": api_type,
    "error": result[1] if result[1] is not None else False,
    "result": result[0] if result[1] is None else False,
    "request": request
  }
  return templates.TemplateResponse("create_database.html", data)