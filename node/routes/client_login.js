/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

var express = require('express');
var router = express.Router();

var utils = require('../lib/utils');

var login_data = {
  username: "admin",
  database: "demo",
  response_type: "code",
  title: "Nervatura Client custom token login",
  error: null,
  env: {
    NT_EXAMPLE_TOKEN_PRIVATE_KEY: process.env.NT_EXAMPLE_TOKEN_PRIVATE_KEY,
    NT_EXAMPLE_TOKEN_EXP: process.env.NT_EXAMPLE_TOKEN_EXP,
    NT_EXAMPLE_TOKEN_ALGORITHM: process.env.NT_EXAMPLE_TOKEN_ALGORITHM,
    NT_TOKEN_ISS: process.env.NT_TOKEN_ISS,
    NT_TOKEN_PUBLIC_KID: process.env.NT_TOKEN_PUBLIC_KID,
    NT_TOKEN_PUBLIC_KEY: process.env.NT_TOKEN_PUBLIC_KEY,
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
    algorithm:  process.env.NT_EXAMPLE_TOKEN_ALGORITHM,
    kid: process.env.NT_TOKEN_PUBLIC_KID
  })
  if(req.body.response_type === "code") {
    var code = `${Math.random().toString(16).slice(2)}-${Math.random().toString(16).slice(2)}`
    req.app.get("session")[code] = token
    url += `?#code=${code}&callback=http://${process.env.NT_EXAMPLE_HOST}:${process.env.NT_EXAMPLE_PORT}/client_login/token&error=http://${process.env.NT_EXAMPLE_HOST}:${process.env.NT_EXAMPLE_PORT}/client_login`
  } else {
    url += `?#access_token=${token}&callback=http://${process.env.NT_EXAMPLE_HOST}:${process.env.NT_EXAMPLE_PORT}/client_login`
  }
  res.redirect(url)
});

router.post('/token', function(req, res) {
  res.set('Content-Type', 'application/json');
  if(req.body.code && Object.keys(req.app.get("session")).includes(req.body.code)){
    res.status(200).send({
      access_token: req.app.get("session")[req.body.code],
      token_type: "bearer",
      expires_in: process.env.NT_EXAMPLE_TOKEN_EXP,
      callback: `http://${process.env.NT_EXAMPLE_HOST}:${process.env.NT_EXAMPLE_PORT}/client_login`
    })
  } else {
    res.status(400).send({ code: 400, error: { message: "Missing or invalid code" } })
  }
});

module.exports = router;