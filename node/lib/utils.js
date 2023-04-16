/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

var fs = require('fs');
var path = require('path');
var spawn = require('child_process').spawn;
var jwt = require('jsonwebtoken');

var privateKEY  = fs.readFileSync(process.env.NT_EXAMPLE_TOKEN_PRIVATE_KEY, 'utf8');
var servicePath = path.join("node_modules","nervatura","bin")
var serviceFile = (process.platform === "win32") ? "nervatura.exe" : "nervatura"
var serviceLib = (process.platform === "win32") ? "nervatura.dll" : "nervatura.so"

exports.servicePath = servicePath
exports.serviceFile = serviceFile
exports.serviceLib = serviceLib

exports.CheckJson = function(data, dataResult) {
  try { 
    const result = JSON.parse(data) 
    return result; 
  } catch (error) {
    if(dataResult){
      return data
    }
    return {code:400, message: String(data)};
  } 
}

exports.EncodeOptions = function(data) {
  return JSON.stringify(data)
}

exports.ToBytes = (string) => {
	const buffer = Buffer.from(string, 'utf8');
	const result = Array(buffer.length);
	for (var i = 0; i < buffer.length; i++) {
		result[i] = buffer[i];
	}
	return result;
};

exports.CreateToken = function(params) {
  var _token = { 
    iss: process.env.NT_TOKEN_ISS, 
    username: params.username,
  }
  if(params.database) {
    _token.database = params.database
  }
  try {
    _token = jwt.sign(_token, privateKEY,
      { 
        expiresIn: process.env.NT_EXAMPLE_TOKEN_EXP,
        algorithm:  params.algorithm,
        header: {
          kid: params.kid
        }
      }
    )
  } catch (error) {
    //public key hack... :-(
    _token = jwt.sign(_token, privateKEY,
      { 
        expiresIn: process.env.NT_EXAMPLE_TOKEN_EXP,
        algorithm:  params.algorithm,
        header: {
          kid: params.kid
        }
      }
    )
  }
  return _token
}

exports.StartService = function(consolLog, callback){
  const controller = new AbortController();
  const { signal } = controller;
  const child = spawn(path.join(servicePath, serviceFile), { env: { ...process.env }, signal });
  var result = false;
  child.stdout.on('data', (chunk) => {
    if(consolLog){
      console.log(chunk.toString());
    }
    if(!result){
      result = true
      callback(null, controller)
    } 
  });
  child.stderr.on('data', function(err) {
    if(!result){
      result = true
      callback(err, controller)
    }
  });
  child.on('error', function (err) {
    if(!result){
      callback(err, controller)
    }
  });
}

exports.GetApi = function(token, api_type, fName, options, apiCallback) {
  var http = require('./rest');
  var cli = require('./cli');
  var cgo = require('./cgo');
  var rpc = require('./rpc');

  switch (api_type) {
    case "cli":
      cli[fName](token, options, apiCallback)
      break;

    case "cgo":
      result = cgo[fName](token, options)
      const err = (!result || (result && typeof(result.code) !== "undefined"))
        ? result.message || result.error : null
        apiCallback(err, (err) ? null : result)
      break;
    
    case "rpc":
      rpc[fName](token, options, apiCallback)
      break;

    default:
      http[fName](token, options, function(data){
        const err = (typeof(data.code) !== "undefined")
          ? data.message : null
          apiCallback(err, (err) ? null : data) 
      })
      break;
  }
}