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

router = APIRouter(prefix="/client_config")
templates = Jinja2Templates(directory="templates")

config_data = {
  "title": "Nervatura Client language translation",
  "client_url": "http://localhost:"+str(os.getenv("NT_HTTP_PORT"))+"/client",
  "locales_url": "http://localhost:"+str(os.getenv("NT_HTTP_PORT"))+"/locales",
  "env": {
    "NT_CLIENT_CONFIG": os.getenv("NT_CLIENT_CONFIG"),
    "NT_ALIAS_DEMO": os.getenv("NT_ALIAS_DEMO")
  }
}

@router.get("/", response_class=HTMLResponse)
async def index(request: Request):
  data = config_data | { "request": request }
  return templates.TemplateResponse("client_config.html", data)