""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import os
from datetime import datetime, timedelta
import json
import jwt

def getKey():
  f = open(os.getenv("NT_EXAMPLE_TOKEN_PRIVATE_KEY"), "r")
  key = f.read()
  f.close()
  return key

def encodeOptions(data):
  return json.dumps(data).encode("utf-8")

def checkJson(data):
  try:
    jdata = json.loads(data)
  except ValueError as err:
    return data
  return jdata

def servicePath(): 
  return os.getenv("NT_EXAMPLE_SERVICE_PATH")

def CreateToken(params):
  privateKEY = getKey()
  expiration = datetime.utcnow() + timedelta(minutes=float(os.getenv("NT_EXAMPLE_TOKEN_EXP")))
  payload = { 
    "iss": os.getenv("NT_TOKEN_ISS"), 
    "username": params["username"],
    "exp": expiration
  }
  if "database" in params:
    payload["database"] = params["database"]
  headers = {
    "kid": params["kid"]
  }
  token = jwt.encode(payload, privateKEY, algorithm=params["algorithm"], headers=headers)
  return token
 