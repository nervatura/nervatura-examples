""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

from lib import cgo, cli, rpc, rest

apiMap = {
  "cgo": cgo, "cli": cli, "rpc": rpc, "http": rest
}

def getApi(apiKey, funcName):
  return apiMap[apiKey].__dict__[funcName]