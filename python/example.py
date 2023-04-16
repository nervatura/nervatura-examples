""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import os
import time

from dotenv import load_dotenv
load_dotenv(dotenv_path=".env.example")

from lib.utils import CreateToken
from lib import cgo, cli, rpc, rest

token = CreateToken({ 
  "username": "admin", "database": "demo",
  "algorithm":  os.getenv("NT_EXAMPLE_TOKEN_ALGORITHM"),
  "kid": os.getenv("NT_TOKEN_PUBLIC_KID")
})

api_map = {
  "cgo": cgo, "cli": cli, "rpc": rpc, "http": rest
}
fn_map = {
  "UserLogin": [{"username": "admin", "password": "", "database": "demo"}],
  "TokenRefresh": [token],
  "TokenLogin": [token],
  "UserPassword": [token, {
    "username": "guest",
    "password": "Password_1234",
    "confirm": "Password_1234",
    "custnumber": ""
  }],
  "Report": [token, {
    "output": "pdf",
    "reportkey": "ntr_invoice_en",
    "orientation": "portrait",
    "size": "a4",
    "nervatype": "trans",
    "refnumber": "DMINV/00001",
    "template": "", "filters": {"@id": 5}
  }],
  "ReportList": [token, {
    "label": ""
  }],
  "ReportDelete": [token, {
    "reportkey": "ntr_invoice_en"
  }],
  "ReportInstall": [token, {
    "reportkey": "ntr_invoice_en"
  }],
  "Function": [token, {
    "key": "nextNumber",
    "values": {
      "numberkey": "custnumber",
      "step": False,
      "insert_key": False,
    },
    "value": ""
  }],
  "View": [token, [{
    "key": "customers",
    "text": "select c.id, ct.groupvalue as custtype, c.custnumber, c.custname from customer c inner join groups ct on c.custtype = ct.id where c.deleted = 0 and c.custnumber <> 'HOME'",
    "values": []
  }]],
  "Get": [token, {
    "nervatype": "customer",
    "metadata": True,
    "filter": "",
    "ids": "2,4",
  }],
  "Update": [token, {
    "nervatype": "address",
    "data": [{
      "keys": {
        "nervatype": "customer",
        "ref_id": "customer/DMCUST/00001"
      },
      "zipcode": "12345"
    }]
  }],
  "Delete": [token, {
    "nervatype": "address",
    "key": "customer/DMCUST/00001~1"
  }]
}

result = cgo.DatabaseCreate(
  os.getenv("NT_API_KEY"), {
    "demo": True, "database": "demo"
  }
)
if result[1] is not None:
  print("DatabaseCreate error: "+result[1])
  exit()
else:
  print("DatabaseCreate OK")
  print("--------------------")

for api_key in api_map:
  start_time = time.perf_counter()
  for fn_key in fn_map:
    func_name = "TokenValidate" if api_key == "http" and fn_key == "TokenLogin" else fn_key
    result = api_map[api_key].__dict__[func_name](*fn_map[fn_key])
    if result[1] is not None:
      print(api_key+" "+func_name+" error: "+result[1])
    else:
      print(api_key+" "+func_name+" OK")
  end_time = time.perf_counter()
  print("--------------------")
  print(f"{api_key} time {int((end_time - start_time)*1000)}")
  print("--------------------")