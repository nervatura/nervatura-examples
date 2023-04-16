/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

var path = require('path');
const execFile = require('child_process').execFile;

var utils = require('./utils');

function cliApi(_args, callback){
  const child = execFile(path.join(utils.servicePath, utils.serviceFile), _args, {env: process.env}, 
    (error, stdout, stderr) => {
    if (error) {
      return callback(stderr, null)
    }
    const result = utils.CheckJson(stdout.toString().split("\n")[stdout.toString().split("\n").length-2], true)
    if((typeof result === "object") && result.code){
      if(result.code != 200 && result.code != 204){
        return callback(result.message, null)
      }
    }
    callback(null, result)
  });
}

exports.DatabaseCreate = function(apiKey, options, callback) {
  cliApi(['-c', 'DatabaseCreate', '-o', utils.EncodeOptions(options), "-k", apiKey], function(err, data){
    callback(err, data)
  })
}

exports.UserLogin = function(options, callback) {
  cliApi(['-c', 'UserLogin', '-o', utils.EncodeOptions(options)], function(err, data){
    callback(err, data)
  })
}

exports.TokenLogin = function(token, callback) {
  cliApi(['-c', 'TokenLogin', '-t', token], function(err, data){
    callback(err, data)
  })
}

exports.TokenRefresh = function(token, callback) {
  cliApi(['-c', 'TokenRefresh', '-t', token], function(err, data){
    callback(err, data)
  })
}

exports.TokenDecode = function(token, callback) {
  cliApi(['-c', 'TokenDecode', '-t', token], function(err, data){
    callback(err, data)
  })
}

exports.UserPassword = function(token, options, callback) {
  cliApi(['-c', 'UserPassword', '-o', utils.EncodeOptions(options), '-t', token], function(err, data){
    callback(err, data)
  })
}

exports.Delete = function(token, options, callback) {
  cliApi(['-c', 'Delete', '-o', utils.EncodeOptions(options), '-t', token], function(err, data){
    callback(err, data)
  })
}

exports.Get = function(token, options, callback) {
  cliApi(['-c', 'Get', '-o', utils.EncodeOptions(options), '-t', token], function(err, data){
    callback(err, data)
  })
}

exports.View = function(token, data, callback) {
  cliApi(['-c', 'View', '-d', utils.EncodeOptions(data), '-t', token], function(err, data){
    callback(err, data)
  })
}

exports.Function = function(token, options, callback) {
  cliApi(['-c', 'Function', '-o', utils.EncodeOptions(options), '-t', token], function(err, data){
    callback(err, data)
  })
}

exports.Update = function(token, options, callback) {
  cliApi(['-c', 'Update', '-nt', options.nervatype, '-d', utils.EncodeOptions(options.data), '-t', token], function(err, data){
    callback(err, data)
  })
}

exports.Report = function(token, options, callback) {
  cliApi(['-c', 'Report', '-o', utils.EncodeOptions(options), '-t', token], function(err, data){
    callback(err, data)
  })
}

exports.ReportList = function(token, options, callback) {
  cliApi(['-c', 'ReportList', '-o', utils.EncodeOptions(options), '-t', token], function(err, data){
    callback(err, data)
  })
}

exports.ReportDelete = function(token, options, callback) {
  cliApi(['-c', 'ReportDelete', '-o', utils.EncodeOptions(options), '-t', token], function(err, data){
    callback(err, data)
  })
}

exports.ReportInstall = function(token, options, callback) {
  cliApi(['-c', 'ReportInstall', '-o', utils.EncodeOptions(options), '-t', token], function(err, data){
    callback(err, data)
  })
}