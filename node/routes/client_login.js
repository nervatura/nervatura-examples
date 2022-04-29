/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

var express = require('express');
var router = express.Router();

var utils = require('../lib/utils');

var sessions = {}
var login_data = {
  username: "admin",
  database: "demo",
  response_type: "code",
  title: "Nervatura Client custom token login - with the HMAC algorithm",
  error: null,
  env: {
    NT_EXAMPLE_TOKEN_PRIVATE_KEY: process.env.NT_EXAMPLE_TOKEN_PRIVATE_KEY,
    NT_EXAMPLE_TOKEN_EXP: process.env.NT_EXAMPLE_TOKEN_EXP,
    NT_EXAMPLE_TOKEN_ALGORITHM_HMAC: process.env.NT_EXAMPLE_TOKEN_ALGORITHM_HMAC,
    NT_TOKEN_ISS: process.env.NT_TOKEN_ISS,
    NT_TOKEN_PRIVATE_KID: process.env.NT_TOKEN_PRIVATE_KID,
    NT_TOKEN_PRIVATE_KEY: process.env.NT_TOKEN_PRIVATE_KEY,
    NT_ALIAS_DEMO: process.env.NT_ALIAS_DEMO,
  }
}

router.get('/', function (req, res) {
  var data = login_data
  if(req.query.error){
    data = Object.assign({}, login_data, {
      error: Buffer.from(req.query.error, "base64").toString("utf8")
    })
  }
  res.render('client_login.html', data);
})

router.post('/redirect', function(req, res) {
  var url = `http://localhost:${process.env.NT_HTTP_PORT}/client`
  var token = utils.CreateToken({ 
    username: req.body.username, database: req.body.database,
    algorithm:  process.env.NT_EXAMPLE_TOKEN_ALGORITHM_HMAC,
    kid: process.env.NT_TOKEN_PRIVATE_KID
  })
  if(req.body.response_type === "code") {
    var code = utils.Guid()
    sessions[code] = {
      token: token
    }
    url += `?code=${code}&callback=http://${process.env.NT_EXAMPLE_HOST}:${process.env.NT_EXAMPLE_PORT}/client_login/token&error=http://${process.env.NT_EXAMPLE_HOST}:${process.env.NT_EXAMPLE_PORT}/client_login`
  } else {
    url += `?#access_token=${token}&token_type=Bearer&expires_in=${process.env.NT_EXAMPLE_TOKEN_EXP}&callback=http://${process.env.NT_EXAMPLE_HOST}:${process.env.NT_EXAMPLE_PORT}/client_login`
  }
  if (req.body.path && (req.body.path !== "")) {
    url += "&path="+req.body.path
  }
  res.redirect(url)
});

router.post('/token', function(req, res) {
  res.set('Content-Type', 'application/json');
  if(req.body.code && Object.keys(sessions).includes(req.body.code)){
    res.status(200).send({
      access_token: sessions[req.body.code].token,
      token_type: "bearer",
      expires_in: process.env.NT_EXAMPLE_TOKEN_EXP,
      callback: `http://${process.env.NT_EXAMPLE_HOST}:${process.env.NT_EXAMPLE_PORT}/client_login`
    })
  } else {
    res.status(400).send({ code: 400, message: "Missing or invalid code" })
  }
});

module.exports = router;