""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import os
from fastapi import APIRouter, Request, Form
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from typing import Optional

from lib.api import getApi

router = APIRouter(prefix="/password_login")
templates = Jinja2Templates(directory="templates")

login_data = {
  "username": "admin",
  "password": "",
  "database": "demo",
  "api_type": os.getenv("NT_EXAMPLE_DEFAULT_API"),
  "title": "Basic password login",
  "error": False, "result": False,
  "env": {
    "NT_PASSWORD_LOGIN": os.getenv("NT_PASSWORD_LOGIN"),
    "NT_ALIAS_DEMO": os.getenv("NT_ALIAS_DEMO")
  }
}

@router.get("/", response_class=HTMLResponse)
async def index(request: Request):
  data = login_data | { "request": request }
  return templates.TemplateResponse("password_login.html", data)

@router.post("/", response_class=HTMLResponse)
async def login(
  request: Request,
  username: str = Form(...),
  database: str = Form(...),
  api_type: str = Form(...),
  password: Optional[str] = Form(""),
):
  params = {
    "username": username, "database": database, "password": password
  }
  result = getApi(api_type, "UserLogin")(params)
  data = login_data | params | { 
    "api_type": api_type,
    "error": result[1] if result[1] is not None else False,
    "result": result[0] if result[1] is None else False,
    "request": request
  }
  return templates.TemplateResponse("password_login.html", data)