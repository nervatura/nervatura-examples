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

var utils = require('../lib/utils');

var login_data = {
  username: "admin",
  database: "demo",
  api_type: process.env.NT_EXAMPLE_DEFAULT_API,
  title: "Custom token (passwordless) login - public/private key pair",
  error: null, result: null,
  env: {
    NT_EXAMPLE_TOKEN_PRIVATE_KEY: process.env.NT_EXAMPLE_TOKEN_PRIVATE_KEY,
    NT_EXAMPLE_TOKEN_EXP: process.env.NT_EXAMPLE_TOKEN_EXP,
    NT_EXAMPLE_TOKEN_ALGORITHM_RSA: process.env.NT_EXAMPLE_TOKEN_ALGORITHM_RSA,
    NT_TOKEN_ISS: process.env.NT_TOKEN_ISS,
    NT_TOKEN_PUBLIC_KID: process.env.NT_TOKEN_PUBLIC_KID,
    NT_TOKEN_PUBLIC_KEY: process.env.NT_TOKEN_PUBLIC_KEY,
    NT_ALIAS_DEMO: process.env.NT_ALIAS_DEMO,
  }
}

router.get('/', function (req, res) {
  res.render('token_login.html', login_data);
})

router.post('/', function (req, res) {
  var token = utils.CreateToken({ 
    username: req.body.username, database: req.body.database,
    algorithm:  process.env.NT_EXAMPLE_TOKEN_ALGORITHM_RSA,
    kid: process.env.NT_TOKEN_PUBLIC_KID
  })
  switch (req.body.api_type) {
    case "cli":
      cli.TokenLogin(token, function(err, data){
        sendResult(res, req.body, data, err) 
      })
      break;

    case "cgo":
      result = cgo.TokenLogin(token)
      const err = (!result || (result && typeof(result.code) !== "undefined"))
        ? result.message || result.error : null
      sendResult(res, req.body, (err) ? null : result, err)
      break;
    
    case "rpc":
      rpc.TokenLogin(token, function(err, data){
        sendResult(res, req.body, data, err) 
      })
      break;

    default:
      http.TokenValidate(token, function(data){
        const err = (typeof(data.code) !== "undefined")
          ? data.message : null
        sendResult(res, req.body, (err) ? null : data, err) 
      })
      break;
  }
})

function sendResult(res, params, result, err) {
  const data = Object.assign({}, login_data, params)
  return res.render('token_login.html', {
    ...data,
    error: (err) ? err : null,
    result: (err) ? null : result
  });
}

module.exports = router;