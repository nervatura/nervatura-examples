/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

var express = require('express');
const fs = require('fs')
var path = require('path');
var bodyParser = require('body-parser');
var cors = require('cors');

var app = express();
if(!fs.existsSync(path.join(__dirname, ".env"))){
  fs.copyFileSync(path.join(__dirname, ".env.example"),path.join(__dirname, ".env"))
}
require('dotenv').config()

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.engine('.html', require('ejs').__express);
app.set('view engine', 'ejs');
app.set("session", {})

var utils = require('./lib/utils');

//routes
var create_database = require('./routes/create_database');
var client_config = require('./routes/client_config');
var password_login = require('./routes/password_login');
var token_login = require('./routes/token_login');
var client_login = require('./routes/client_login');
var external_token = require('./routes/external_token');
var create_invoice = require('./routes/create_invoice');
var server_shortcuts = require('./routes/server_shortcuts');
var csv_report = require('./routes/csv_report');

app.set('serviceError', null);

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

app.use('/create_database', create_database);
app.use('/client_config', client_config);
app.use('/password_login', password_login);
app.use('/token_login', token_login);
app.use('/client_login', client_login);
app.use('/external_token', external_token);
app.use('/create_invoice', create_invoice);
app.use('/server_shortcuts', server_shortcuts);
app.use('/csv_report', csv_report);

app.get('/', function(req, res) {
  if(app.get('serviceError')){
    return res.send(app.get('serviceError'))
  }
  var demo_db = fs.existsSync(path.join(__dirname, "data", "demo.db")) 
  res.render('index.html', {
    title: "Nervatura examples",
    demo: demo_db
  });
});

app.listen(process.env.NT_EXAMPLE_PORT, process.env.NT_EXAMPLE_HOST, function () {
  console.log('%s: Node server started on %s:%s ...',
    Date(Date.now()), process.env.NT_EXAMPLE_HOST, process.env.NT_EXAMPLE_PORT);
  if(process.env.NT_EXAMPLE_SERVICE_DISABLED !== "true"){
    utils.StartService(true, (err)=>{
      if(err){
        app.set('serviceError', err);
        return console.log(err.message)
      }
    })
  }
});