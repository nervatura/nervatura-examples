/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

var express = require('express');
var router = express.Router();
var async = require("async");

var utils = require('../lib/utils');

var shortcut_data = {
  username: "admin",
  database: "demo",
  api_type: process.env.NT_EXAMPLE_DEFAULT_API,
  title: "Nervatura Client menu shortcuts",
  homepage_title: "External page - GET example",
  error: null, exists: null, homepage: null, client_url: "",
  env: {
    NT_EXAMPLE_TOKEN_PRIVATE_KEY: process.env.NT_EXAMPLE_TOKEN_PRIVATE_KEY,
    NT_EXAMPLE_TOKEN_EXP: process.env.NT_EXAMPLE_TOKEN_EXP,
    NT_EXAMPLE_TOKEN_ALGORITHM_HMAC: process.env.NT_EXAMPLE_TOKEN_ALGORITHM_HMAC,
    NT_TOKEN_ISS: process.env.NT_TOKEN_ISS,
    NT_TOKEN_PRIVATE_KID: process.env.NT_TOKEN_PRIVATE_KID,
    NT_TOKEN_PRIVATE_KEY: process.env.NT_TOKEN_PRIVATE_KEY,
    NT_ALIAS_DEMO: process.env.NT_ALIAS_DEMO,
    NT_SMTP_HOST: process.env.NT_SMTP_HOST,
    NT_SMTP_PORT: process.env.NT_SMTP_PORT,
    NT_SMTP_USER: process.env.NT_SMTP_USER,
    NT_SMTP_PASSWORD: process.env.NT_SMTP_PASSWORD,
  },
  data: {
    ui_menu: [
      { menukey: "mnu_example_homepage", description: "External page - GET example", funcname: "homepage",
        address: `http://${process.env.NT_EXAMPLE_HOST}:${process.env.NT_EXAMPLE_PORT}/server_shortcuts/homepage`,
        keys: { method: "get" }},
      { menukey: "mnu_example_email", description: "Email sending - POST example", funcname: "email",
        address: `http://${process.env.NT_EXAMPLE_HOST}:${process.env.NT_EXAMPLE_PORT}/server_shortcuts/email`,
        keys: { method: "post" }},
    ],
    ui_menufields: [
      { fieldname: "homepage_string", description: "String input", orderby: 0,
        keys: { menu_id: "mnu_example_homepage", fieldtype: "string" }},
      { fieldname: "homepage_bool", description: "Bool input", orderby: 1,
        keys: { menu_id: "mnu_example_homepage", fieldtype: "bool" }},
      { fieldname: "homepage_date", description: "Date input", orderby: 2,
        keys: { menu_id: "mnu_example_homepage", fieldtype: "date" }},
      { fieldname: "homepage_integer", description: "Integer input", orderby: 3,
        keys: { menu_id: "mnu_example_homepage", fieldtype: "integer" }},
      { fieldname: "homepage_float", description: "Float input", orderby: 4,
        keys: { menu_id: "mnu_example_homepage", fieldtype: "float" }},
      { fieldname: "email_from", description: "Sender email", orderby: 0,
        keys: { menu_id: "mnu_example_email", fieldtype: "string" }},
      { fieldname: "email_to", description: "Email address", orderby: 1,
        keys: { menu_id: "mnu_example_email", fieldtype: "string" }},
    ]
  }
}

function checkFunctions(token, api_type, callback) {
  var views = [
    { key: "menu",
      text: `select count(*) as anum from ui_menu
        where menukey in(?,?)`,
      values: ["mnu_example_homepage","mnu_example_email"] 
    }
  ]
  utils.GetApi(token, api_type, "View", views, function(err, result){
    if(!err){
      return callback((parseInt(result.menu[0].anum,10) > 0))
    }
    callback(false)
  })
}

router.get('/', function (req, res) {
  var token = utils.CreateToken({ 
    username: shortcut_data.username, database: shortcut_data.database,
    algorithm:  process.env.NT_EXAMPLE_TOKEN_ALGORITHM_HMAC,
    kid: process.env.NT_TOKEN_PRIVATE_KID
  })
  checkFunctions(token, shortcut_data.api_type, function(result){
    var data = Object.assign({}, shortcut_data, { 
      exists: result, 
      client_url: (result) ? `http://localhost:${process.env.NT_HTTP_PORT}/client?#access_token=${token}` : ""
    })
    res.render('server_shortcuts.html', data);
  })
})

function createShortcuts(token, params, createCallback) {
  async.waterfall([
    function(callback) {
      utils.GetApi(token, params.api_type, "Update", 
        {nervatype: "ui_menu", data: params.data.ui_menu}, 
        function(err, result){
          callback(err)
        }
      )
    },

    function(callback) {
      utils.GetApi(token, params.api_type, "Update", 
        {nervatype: "ui_menufields", data: params.data.ui_menufields}, 
        function(err, result){
          callback(err)
        }
      )
    },
  ],
  function(err) {
    createCallback(err)
  })
}

router.post('/', function (req, res) {
  var token = utils.CreateToken({ 
    username: shortcut_data.username, database: shortcut_data.database,
    algorithm:  process.env.NT_EXAMPLE_TOKEN_ALGORITHM_HMAC,
    kid: process.env.NT_TOKEN_PRIVATE_KID
  })
  var params = Object.assign({}, shortcut_data, {
    api_type: req.body.api_type,
    client_url: `http://localhost:${process.env.NT_HTTP_PORT}/client?#access_token=${token}`
  })
  checkFunctions(token, req.body.api_type, function(result){
    if(!result){
      return createShortcuts(token, params, function(err){
        res.render('server_shortcuts.html', {
          ...params,
          error: (err) ? err : null,
          exists: (err) ? null : true,
          client_url: (err) ? "" : params.client_url
        });
      })
    }
    res.render('server_shortcuts.html', {
      ...params, error: null, exists: true,
    });
  })
  
})

router.get('/homepage', function (req, res) {
  var data = Object.assign({}, shortcut_data, { 
    homepage: true, homepage_values: {
      homepage_string: req.query.homepage_string||"MISSING",
      homepage_bool: req.query.homepage_bool||0,
      homepage_date: req.query.homepage_date||"MISSING",
      homepage_integer: req.query.homepage_integer||0,
      homepage_float: req.query.homepage_float||0,
    }
  })
  res.render('server_shortcuts.html', data);
})

router.post('/email', function (req, res) {
  function send(err, data){
    if(err){
      res.set('Content-Type', 'application/json');
      return res.status(400).send({ error: { message: err }})
    }
    res.set('Content-Type', 'text/plain');
    res.status(200).send(data)
  }
  
  if(!req.body.values.email_from || !String(req.body.values.email_from).includes("@")){
    return send("Invalid sender address")
  }
  if(!req.body.values.email_to || !String(req.body.values.email_to).includes("@")){
    return send("Invalid email address")
  }
  if((process.env.NT_SMTP_HOST === "EXAMPLE_SMTP_HOST") || (process.env.NT_SMTP_USER === "EXAMPLE_SMTP_USER")
    || (process.env.NT_SMTP_PASSWORD === "EXAMPLE_SMTP_PASSWORD")){
      return send("Invalid SMTP settings")
  }

  var token = utils.CreateToken({ 
    username: shortcut_data.username, database: shortcut_data.database,
    algorithm:  process.env.NT_EXAMPLE_TOKEN_ALGORITHM_HMAC,
    kid: process.env.NT_TOKEN_PRIVATE_KID
  })
  var options = { 
    key: "sendEmail", 
    values: { 
      provider: "smtp",
      email: { 
        from: req.body.values.email_from,
        recipients: [
          { email: req.body.values.email_to },
        ],
        subject: "Thank you for your order", 
        html: "<p>Thank you for your order!</p><b>Please</b> note: ...",
        attachments :[{ 
          reportkey:  "ntr_invoice_en", 
          nervatype: "trans", 
          refnumber: "DMINV/00001" 
        }] 
      }
    }
  }
  utils.GetApi(token, shortcut_data.api_type, "Function", options, function(err, result){
    send(err, "The message was successfully sent")  
  })
  
})

module.exports = router;