/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

var path = require('path');
var utils = require('./utils');

try {
  var ffi = require('ffi-napi');
  var ntura = ffi.Library(path.join(utils.servicePath, utils.serviceLib), {
    DatabaseCreate: ["string", ["string", "string"]],
    UserLogin: ["string", ["string"]],
    TokenLogin: ["string", ["string"]],
    TokenRefresh: ["string", ["string"]],
    TokenDecode: ["string", ["string"]],
    UserPassword: ["string", ["string", "string"]],
    Delete: ["string", ["string", "string"]],
    Get: ["string", ["string", "string"]],
    View: ["string", ["string", "string"]],
    Function: ["string", ["string", "string"]],
    Update: ["string", ["string", "string", "string"]],
    Report: ["string", ["string", "string"]],
    ReportList: ["string", ["string", "string"]],
    ReportDelete: ["string", ["string", "string"]],
    ReportInstall: ["string", ["string", "string"]],
  });
} catch (error) {}

exports.DatabaseCreate = function(apiKey, options) {
  if(ntura && ntura.DatabaseCreate){
    return utils.CheckJson(ntura.DatabaseCreate(apiKey, utils.EncodeOptions(options)))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.UserLogin = function(options) {
  if(ntura && ntura.UserLogin){
    return utils.CheckJson(ntura.UserLogin(utils.EncodeOptions(options)))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.TokenLogin = function(token) {
  if(ntura && ntura.TokenLogin){
    return utils.CheckJson(ntura.TokenLogin(token))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.TokenRefresh = function(token) {
  if(ntura && ntura.TokenRefresh){
    return utils.CheckJson(ntura.TokenRefresh(token))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.TokenDecode = function(token) {
  if(ntura && ntura.TokenDecode){
    return utils.CheckJson(ntura.TokenDecode(token))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.UserPassword = function(token, options) {
  if(ntura && ntura.UserPassword){
    return utils.CheckJson(ntura.UserPassword(token, utils.EncodeOptions(options)))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.Delete = function(token, options) {
  if(ntura && ntura.Delete){
    return utils.CheckJson(ntura.Delete(token, utils.EncodeOptions(options)))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.Get = function(token, options) {
  if(ntura && ntura.Get){
    return utils.CheckJson(ntura.Get(token, utils.EncodeOptions(options)))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.View = function(token, data) {
  if(ntura && ntura.View){
    return utils.CheckJson(ntura.View(token, utils.EncodeOptions(data)))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.Function = function(token, options) {
  if(ntura && ntura.Function){
    return utils.CheckJson(ntura.Function(token, utils.EncodeOptions(options)))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.Update = function(token, options) {
  if(ntura && ntura.Update){
    return utils.CheckJson(ntura.Update(token, options.nervatype, utils.EncodeOptions(options.data)))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.Report = function(token, options) {
  if(ntura && ntura.Report){
    return utils.CheckJson(ntura.Report(token, utils.EncodeOptions(options)))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.ReportList = function(token, options) {
  if(ntura && ntura.ReportList){
    return utils.CheckJson(ntura.ReportList(token, utils.EncodeOptions(options)))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.ReportDelete = function(token, options) {
  if(ntura && ntura.ReportDelete){
    return utils.CheckJson(ntura.ReportDelete(token, utils.EncodeOptions(options)))
  }
  return {code:400, message: "Missing CGO API" }
}

exports.ReportInstall = function(token, options) {
  if(ntura && ntura.ReportInstall){
    return utils.CheckJson(ntura.ReportInstall(token, utils.EncodeOptions(options)))
  }
  return {code:400, message: "Missing CGO API" }
}