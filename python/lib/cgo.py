""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import ctypes
import os

import lib.utils as utils

ntura = ctypes.cdll.LoadLibrary(os.getenv("NT_EXAMPLE_SERVICE_LIB"))

def decodeResult(resultStr):
    result = utils.checkJson(resultStr)
    if type(result) == dict:
        if "code" in result:
            if result["code"] != 200 and result["code"] != 204:
                return [None, result["message"]]
    return [result, None]

def DatabaseCreate(apiKey, options):
    DatabaseCreate = ntura.DatabaseCreate
    DatabaseCreate.argtypes = [ctypes.c_char_p, ctypes.c_char_p]
    DatabaseCreate.restype = ctypes.c_void_p
    result = ctypes.string_at(DatabaseCreate(apiKey.encode("utf-8"), utils.encodeOptions(options))).decode("utf-8")
    return decodeResult(result)

def UserLogin(options):
    UserLogin = ntura.UserLogin
    UserLogin.argtypes = [ctypes.c_char_p]
    UserLogin.restype = ctypes.c_void_p
    result = ctypes.string_at(UserLogin(utils.encodeOptions(options))).decode("utf-8")
    return decodeResult(result)

def TokenLogin(token):
    TokenLogin = ntura.TokenLogin
    TokenLogin.argtypes = [ctypes.c_char_p]
    TokenLogin.restype = ctypes.c_void_p
    result = ctypes.string_at(TokenLogin(token.encode("utf-8"))).decode("utf-8")
    return decodeResult(result)

def TokenRefresh(token):
    TokenRefresh = ntura.TokenRefresh
    TokenRefresh.argtypes = [ctypes.c_char_p]
    TokenRefresh.restype = ctypes.c_void_p
    result = ctypes.string_at(TokenRefresh(token.encode("utf-8"))).decode("utf-8")
    return decodeResult(result)

def TokenDecode(token):
    TokenDecode = ntura.TokenDecode
    TokenDecode.argtypes = [ctypes.c_char_p]
    TokenDecode.restype = ctypes.c_void_p
    result = ctypes.string_at(TokenDecode(token.encode("utf-8"))).decode("utf-8")
    return decodeResult(result)

def UserPassword(token, options):
    UserPassword = ntura.UserPassword
    UserPassword.argtypes = [ctypes.c_char_p, ctypes.c_char_p]
    UserPassword.restype = ctypes.c_void_p
    result = ctypes.string_at(UserPassword(token.encode("utf-8"), utils.encodeOptions(options))).decode("utf-8")
    return decodeResult(result)

def Delete(token, options):
    Delete = ntura.Delete
    Delete.argtypes = [ctypes.c_char_p, ctypes.c_char_p]
    Delete.restype = ctypes.c_void_p
    result = ctypes.string_at(Delete(token.encode("utf-8"), utils.encodeOptions(options))).decode("utf-8")
    return decodeResult(result)

def Get(token, options):
    Get = ntura.Get
    Get.argtypes = [ctypes.c_char_p, ctypes.c_char_p]
    Get.restype = ctypes.c_void_p
    result = ctypes.string_at(Get(token.encode("utf-8"), utils.encodeOptions(options))).decode("utf-8")
    return decodeResult(result)

def View(token, data):
    View = ntura.View
    View.argtypes = [ctypes.c_char_p, ctypes.c_char_p]
    View.restype = ctypes.c_void_p
    result = ctypes.string_at(View(token.encode("utf-8"), utils.encodeOptions(data))).decode("utf-8")
    return decodeResult(result)

def Function(token, options):
    Function = ntura.Function
    Function.argtypes = [ctypes.c_char_p, ctypes.c_char_p]
    Function.restype = ctypes.c_void_p
    result = ctypes.string_at(Function(token.encode("utf-8"), utils.encodeOptions(options))).decode("utf-8")
    return decodeResult(result)

def Update(token, options):
    Update = ntura.Update
    Update.argtypes = [ctypes.c_char_p, ctypes.c_char_p, ctypes.c_char_p]
    Update.restype = ctypes.c_void_p
    result = ctypes.string_at(Update(token.encode("utf-8"), options["nervatype"].encode("utf-8"), utils.encodeOptions(options["data"]))).decode("utf-8")
    return decodeResult(result)

def Report(token, options):
    Report = ntura.Report
    Report.argtypes = [ctypes.c_char_p, ctypes.c_char_p]
    Report.restype = ctypes.c_void_p
    result = ctypes.string_at(Report(token.encode("utf-8"), utils.encodeOptions(options))).decode("utf-8")
    return decodeResult(result)

def ReportList(token, options):
    ReportList = ntura.ReportList
    ReportList.argtypes = [ctypes.c_char_p, ctypes.c_char_p]
    ReportList.restype = ctypes.c_void_p
    result = ctypes.string_at(ReportList(token.encode("utf-8"), utils.encodeOptions(options))).decode("utf-8")
    return decodeResult(result)

def ReportDelete(token, options):
    ReportDelete = ntura.ReportDelete
    ReportDelete.argtypes = [ctypes.c_char_p, ctypes.c_char_p]
    ReportDelete.restype = ctypes.c_void_p
    result = ctypes.string_at(ReportDelete(token.encode("utf-8"), utils.encodeOptions(options))).decode("utf-8")
    return decodeResult(result)

def ReportInstall(token, options):
    ReportInstall = ntura.ReportInstall
    ReportInstall.argtypes = [ctypes.c_char_p, ctypes.c_char_p]
    ReportInstall.restype = ctypes.c_void_p
    result = ctypes.string_at(ReportInstall(token.encode("utf-8"), utils.encodeOptions(options))).decode("utf-8")
    return decodeResult(result)

