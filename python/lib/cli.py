""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import subprocess

import lib.utils as utils

def decodeResult(output):
    if output.stderr.decode() != "":
        return [None, output.stderr.decode()]
    result = output.stdout.decode()
    result = utils.checkJson(result.split("\n")[len(result.split("\n"))-2])
    if type(result) == dict:
        if "code" in result:
            if result["code"] != 200 and result["code"] != 204:
                return [None, result["message"]]
    return [result, None]

def DatabaseCreate(apiKey, options):
    output = subprocess.run(utils.servicePath()+["-c", "DatabaseCreate", "-o", utils.encodeOptions(options), "-k", apiKey], capture_output=True)
    return decodeResult(output)

def UserLogin(options):
    output = subprocess.run(utils.servicePath()+["-c", "UserLogin", "-o", utils.encodeOptions(options)], capture_output=True)
    return decodeResult(output)

def TokenLogin(token):
    output = subprocess.run(utils.servicePath()+["-c", "TokenLogin", "-t", token], capture_output=True)
    return decodeResult(output)

def TokenRefresh(token):
    output = subprocess.run(utils.servicePath()+["-c", "TokenRefresh", "-t", token], capture_output=True)
    return decodeResult(output)

def TokenDecode(token):
    output = subprocess.run(utils.servicePath()+["-c", "TokenDecode", "-t", token], capture_output=True)
    return decodeResult(output)

def UserPassword(token, options):
    output = subprocess.run(utils.servicePath()+["-c", "UserPassword", "-o", utils.encodeOptions(options), "-t", token], capture_output=True)
    return decodeResult(output)

def Delete(token, options):
    output = subprocess.run(utils.servicePath()+["-c", "Delete", "-o", utils.encodeOptions(options), "-t", token], capture_output=True)
    return decodeResult(output)

def Get(token, options):
    output = subprocess.run(utils.servicePath()+["-c", "Get", "-o", utils.encodeOptions(options), "-t", token], capture_output=True)
    return decodeResult(output)

def View(token, data):
    output = subprocess.run(utils.servicePath()+["-c", "View", "-d", utils.encodeOptions(data), "-t", token], capture_output=True)
    return decodeResult(output)

def Function(token, options):
    output = subprocess.run(utils.servicePath()+["-c", "Function", "-o", utils.encodeOptions(options), "-t", token], capture_output=True)
    return decodeResult(output)

def Update(token, options):
    output = subprocess.run(utils.servicePath()+["-c", "Update", "-nt", options["nervatype"], "-d", utils.encodeOptions(options["data"]), "-t", token], capture_output=True)
    return decodeResult(output)

def Report(token, options):
    output = subprocess.run(utils.servicePath()+["-c", "Report", "-o", utils.encodeOptions(options), "-t", token], capture_output=True)
    return decodeResult(output)

def ReportList(token, options):
    output = subprocess.run(utils.servicePath()+["-c", "ReportList", "-o", utils.encodeOptions(options), "-t", token], capture_output=True)
    return decodeResult(output)

def ReportDelete(token, options):
    output = subprocess.run(utils.servicePath()+["-c", "ReportDelete", "-o", utils.encodeOptions(options), "-t", token], capture_output=True)
    return decodeResult(output)

def ReportInstall(token, options):
    output = subprocess.run(utils.servicePath()+["-c", "ReportInstall", "-o", utils.encodeOptions(options), "-t", token], capture_output=True)
    return decodeResult(output)

