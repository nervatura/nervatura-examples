""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import os
import uvicorn
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.middleware.cors import CORSMiddleware
from fastapi.templating import Jinja2Templates

from routers import client_login, create_database, password_login, token_login
from routers import external_token, client_config, create_invoice, server_shortcuts, csv_report

from dotenv import load_dotenv
if os.path.exists(".env"):
  load_dotenv()
else:
  load_dotenv(dotenv_path=".env.example")
os.environ["NT_ALIAS_DEMO"] = "sqlite://file:"+os.path.abspath(os.getcwd())+"/data/demo.db?cache=shared&mode=rwc"

app = FastAPI()

app.add_middleware(
  CORSMiddleware,
  allow_origins=["*"],
  allow_credentials=True,
  allow_methods=["*"],
  allow_headers=["*"],
)

app.include_router(create_database.router)
app.include_router(password_login.router)
app.include_router(token_login.router)
app.include_router(client_login.router)
app.include_router(external_token.router)
app.include_router(client_config.router)
app.include_router(create_invoice.router)
app.include_router(server_shortcuts.router)
app.include_router(csv_report.router)
app.state.session = {}

templates = Jinja2Templates(directory="templates")

@app.get("/", response_class=HTMLResponse)
async def home(request: Request):
  demo_db = os.path.exists(os.path.join("data","demo.db"))
  return templates.TemplateResponse("index.html", {
    "request": request, "demo": demo_db, "title": "Nervatura examples"})

if __name__ == "__main__":
  uvicorn.run("main:app",
    host=os.getenv("NT_EXAMPLE_HOST"), port=int(os.getenv("NT_EXAMPLE_PORT")), 
    reload=True, log_level="info")
