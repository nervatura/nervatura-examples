""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import os
import requests
import lib.utils as utils

service_url = "http://localhost:"+str(os.getenv("NT_HTTP_PORT"))+"/api"

def decodeResult(resultStr, code):
    result = utils.checkJson(resultStr)
    if type(result) == dict:
      if "code" in result:
        if result["code"] != 200 and result["code"] != 204:
          return [None, result["message"]]
    if code != 200 and code != 204:
      return [None, resultStr]
    return [result, None]

def DatabaseCreate(apiKey, options):
    headers = {"Content-Type": "application/json; charset=utf-8", "X-API-Key": apiKey }
    params = { "alias": options["database"], "demo": options["demo"] }
    try:
      response = requests.post(service_url+"/database", headers=headers, params=params)
      return decodeResult(response.text, response.status_code)
    except requests.ConnectionError:
      return [None, "Connection failure"]

def TokenValidate(token):
    headers = {
      "Content-Type": "application/json; charset=utf-8", 
      "Authorization": "Bearer "+token }
    try:
      response = requests.get(service_url+"/auth/validate", headers=headers)
      return decodeResult(response.text, response.status_code)
    except requests.ConnectionError:
      return [None, "Connection failure"]

def UserLogin(options):
    headers = {"Content-Type": "application/json; charset=utf-8" }
    try:
      response = requests.post(service_url+"/auth/login", headers=headers, json=options)
      return decodeResult(response.text, response.status_code)
    except requests.ConnectionError:
      return [None, "Connection failure"]

def View(token, data):
    headers = {
      "Content-Type": "application/json; charset=utf-8", 
      "Authorization": "Bearer "+token }
    try:
      response = requests.post(service_url+"/view", headers=headers, json=data)
      return decodeResult(response.text, response.status_code)
    except requests.ConnectionError:
      return [None, "Connection failure"]

def Update(token, options):
    headers = {
      "Content-Type": "application/json; charset=utf-8", 
      "Authorization": "Bearer "+token }
    try:
      response = requests.post(service_url+"/"+options["nervatype"], headers=headers, json=options["data"])
      return decodeResult(response.text, response.status_code)
    except requests.ConnectionError:
      return [None, "Connection failure"]

def Report(token, options):
    headers = {
      "Content-Type": "application/json; charset=utf-8", 
      "Authorization": "Bearer "+token }
    try:
      params = { "reportkey": options["reportkey"], "orientation": options["orientation"],
        "size": options["size"], "output": options["output"]
      }
      if "nervatype" in options:
        params["nervatype"] = options["nervatype"]
      response = requests.get(service_url+"/report?filters[@id]="+str(options["filters"]["@id"]), headers=headers, params=params)
      return decodeResult(response.text, response.status_code)
    except requests.ConnectionError:
      return [None, "Connection failure"]