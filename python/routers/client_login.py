""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import os
import base64
import uuid
from fastapi import APIRouter, Request, Form
from fastapi.responses import HTMLResponse, RedirectResponse, JSONResponse
from typing import Any, Dict, Optional
from fastapi.templating import Jinja2Templates

import lib.utils as utils

router = APIRouter(prefix="/client_login")
templates = Jinja2Templates(directory="templates")

login_data = {
  "username": "admin",
  "database": "demo",
  "response_type": "code",
  "title": "Nervatura Client custom token login",
  "error": False,
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
async def index(request: Request, error: Optional[str] = ""):
  data = login_data | { "request": request }
  if error != "":
    data["error"] = str(base64.b64decode(error),"utf-8")
  return templates.TemplateResponse("client_login.html", data)

@router.post("/redirect")
async def login(
  request: Request,
  username: str = Form(...),
  database: str = Form(...),
  response_type: str = Form(...)
):
  url = "http://localhost:"+os.getenv("NT_HTTP_PORT")+"/client"
  token = utils.CreateToken({ 
    "username": username, "database": database,
    "algorithm":  os.getenv("NT_EXAMPLE_TOKEN_ALGORITHM"),
    "kid": os.getenv("NT_TOKEN_PUBLIC_KID")
  })
  if response_type == "code":
    code = uuid.uuid4().hex
    request.app.state.session[code] = token
    url += "?#code="+code+"&callback=http://"+os.getenv("NT_EXAMPLE_HOST")+":"+os.getenv("NT_EXAMPLE_PORT")+"/client_login/token&error=http://"+os.getenv("NT_EXAMPLE_HOST")+":"+os.getenv("NT_EXAMPLE_PORT")+"/client_login"
  else:
    url += "?#access_token="+token+"&callback=http://"+os.getenv("NT_EXAMPLE_HOST")+":"+os.getenv("NT_EXAMPLE_PORT")+"/client_login"
  return RedirectResponse(url=url, status_code=302)

@router.post("/token")
async def token(
  request: Request,
  data: Dict[Any, Any]
):
  if "code" in data:
    if data["code"] in request.app.state.session:
      return JSONResponse(content={
        "access_token": request.app.state.session[data["code"]],
        "token_type": "bearer",
        "expires_in": os.getenv("NT_EXAMPLE_TOKEN_EXP"),
        "callback": "http://"+os.getenv("NT_EXAMPLE_HOST")+":"+os.getenv("NT_EXAMPLE_PORT")+"/client_login"
      }, status_code=200)
  return JSONResponse(content={"code":400, "error": {"message": "Invalid code"}}, status_code=400)