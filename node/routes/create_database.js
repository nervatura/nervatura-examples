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
  api_key: process.env.NT_API_KEY,
  alias: "demo",
  demo: "true",
  api_type: process.env.NT_EXAMPLE_DEFAULT_API,
  title: "Create a demo database",
  error: null, result: null,
  env: {
    NT_API_KEY: process.env.NT_API_KEY,
    NT_ALIAS_DEMO: process.env.NT_ALIAS_DEMO
  }
}

router.get('/', function (req, res) {
  res.render('create_database.html', login_data);
})

router.post('/', function (req, res) {
  var options = { database: req.body.alias, alias: req.body.alias, 
    demo: (req.body.api_type === "rpc") 
      ? (req.body.demo === "true") ? true : false 
      : req.body.demo 
  }
  utils.GetApi(req.body.api_key, req.body.api_type, "DatabaseCreate", options, 
    function(err, result){
      sendResult(res, req.body, result, err)
    })
})

function sendResult(res, params, result, err) {
  const data = Object.assign({}, login_data, params)
  return res.render('create_database.html', {
    ...data,
    error: (err) ? err : null,
    result: (err) ? null : result
  });
}

module.exports = router;