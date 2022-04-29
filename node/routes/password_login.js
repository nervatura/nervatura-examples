/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

var express = require('express');
var router = express.Router();

var http = require('../lib/rest');
var cli = require('../lib/cli');
var cgo = require('../lib/cgo');
var rpc = require('../lib/rpc');

var login_data = {
  username: "admin",
  password: "",
  database: "demo",
  api_type: "http",
  title: "Basic password login",
  error: null, result: null,
  env: {
    NT_PASSWORD_LOGIN: process.env.NT_PASSWORD_LOGIN,
    NT_ALIAS_DEMO: process.env.NT_ALIAS_DEMO
  }
}

router.get('/', function (req, res) {
  res.render('password_login.html', login_data);
})

router.post('/', function (req, res) {
  switch (req.body.api_type) {
    case "cli":
      cli.UserLogin(req.body, function(err, data){
        sendResult(res, req.body, data, err) 
      })
      break;

    case "cgo":
      result = cgo.UserLogin(req.body)
      const err = (!result || (result && typeof(result.code) !== "undefined"))
        ? result.message || result.error : null
      sendResult(res, req.body, (err) ? null : result, err)
      break;
    
    case "rpc":
      rpc.UserLogin(req.body, function(err, data){
        sendResult(res, req.body, data, err) 
      })
      break;
  
    default:
      http.UserLogin(req.body, function(data){
        const err = (typeof(data.code) !== "undefined")
          ? data.message : null
        sendResult(res, req.body, (err) ? null : data, err) 
      })
      break;
  }
})

function sendResult(res, params, result, err) {
  const data = Object.assign({}, login_data, params)
  return res.render('password_login.html', {
    ...data,
    error: (err) ? err : null,
    result: (err) ? null : result
  });
}

module.exports = router;