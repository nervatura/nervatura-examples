""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import os
from fastapi import APIRouter, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

router = APIRouter(prefix="/external_token")
templates = Jinja2Templates(directory="templates")

config_data = {
  "title": "Using external API for token based authentication",
  "env": {
    "NT_ALIAS_DEMO": os.getenv("NT_ALIAS_DEMO"),
    "NT_ALIAS_DEFAULT": "demo",
    "NT_TOKEN_PUBLIC_KEY_URL": os.getenv("NT_TOKEN_PUBLIC_KEY_URL"),
  }
}

@router.get("/", response_class=HTMLResponse)
async def index(request: Request):
  data = config_data | { "request": request }
  return templates.TemplateResponse("external_token.html", data)