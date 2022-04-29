/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

var path = require('path');
var ffi = require('ffi-napi');

var utils = require('./utils');

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

exports.DatabaseCreate = function(apiKey, options) {
  return utils.CheckJson(ntura.DatabaseCreate(apiKey, utils.EncodeOptions(options)))
}

exports.UserLogin = function(options) {
  return utils.CheckJson(ntura.UserLogin(utils.EncodeOptions(options)))
}

exports.TokenLogin = function(token) {
  return utils.CheckJson(ntura.TokenLogin(token))
}

exports.TokenRefresh = function(token) {
  return utils.CheckJson(ntura.TokenRefresh(token))
}

exports.TokenDecode = function(token) {
  return utils.CheckJson(ntura.TokenDecode(token))
}

exports.UserPassword = function(token, options) {
  return utils.CheckJson(ntura.UserPassword(token, utils.EncodeOptions(options)))
}

exports.Delete = function(token, options) {
  return utils.CheckJson(ntura.Delete(token, utils.EncodeOptions(options)))
}

exports.Get = function(token, options) {
  return utils.CheckJson(ntura.Get(token, utils.EncodeOptions(options)))
}

exports.View = function(token, data) {
  return utils.CheckJson(ntura.View(token, utils.EncodeOptions(data)))
}

exports.Function = function(token, options) {
  return utils.CheckJson(ntura.Function(token, utils.EncodeOptions(options)))
}

exports.Update = function(token, options) {
  return utils.CheckJson(ntura.Update(token, options.nervatype, utils.EncodeOptions(options.data)))
}

exports.Report = function(token, options) {
  return utils.CheckJson(ntura.Report(token, utils.EncodeOptions(options)))
}

exports.ReportList = function(token, options) {
  return utils.CheckJson(ntura.ReportList(token, utils.EncodeOptions(options)))
}

exports.ReportDelete = function(token, options) {
  return utils.CheckJson(ntura.ReportDelete(token, utils.EncodeOptions(options)))
}

exports.ReportInstall = function(token, options) {
  return utils.CheckJson(ntura.ReportInstall(token, utils.EncodeOptions(options)))
}