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

from lib.api import getApi
import lib.utils as utils

router = APIRouter(prefix="/token_login")
templates = Jinja2Templates(directory="templates")

login_data = {
  "username": "admin",
  "database": "demo",
  "api_type": os.getenv("NT_EXAMPLE_DEFAULT_API"),
  "title": "Custom token (passwordless) login",
  "error": False, "result": False,
  "env": {
    "NT_EXAMPLE_TOKEN_PRIVATE_KEY": os.getenv("NT_EXAMPLE_TOKEN_PRIVATE_KEY"),
    "NT_EXAMPLE_TOKEN_EXP": os.getenv("NT_EXAMPLE_TOKEN_EXP"),
    "NT_EXAMPLE_TOKEN_ALGORITHM": os.getenv("NT_EXAMPLE_TOKEN_ALGORITHM"),
    "NT_TOKEN_ISS": os.getenv("NT_TOKEN_ISS"),
    "NT_TOKEN_PUBLIC_KID": os.getenv("NT_TOKEN_PUBLIC_KID"),
    "NT_TOKEN_PUBLIC_KEY": os.getenv("NT_TOKEN_PUBLIC_KEY"),
    "NT_ALIAS_DEMO": os.getenv("NT_ALIAS_DEMO"),
  }
}

@router.get("/", response_class=HTMLResponse)
async def index(request: Request):
  data = login_data | { "request": request }
  return templates.TemplateResponse("token_login.html", data)

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
  func_name = "TokenValidate" if api_type == "http" else "TokenLogin"
  result = getApi(api_type, func_name)(token)
  data = login_data | { 
    "api_type": api_type,
    "username": username, "database": database,
    "error": result[1] if result[1] is not None else False,
    "result": result[0] if result[1] is None else False,
    "request": request
  }
  return templates.TemplateResponse("token_login.html", data)