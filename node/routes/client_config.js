/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

var express = require('express');
var router = express.Router();

var config_data = {
  title: "Nervatura Client language translation",
  client_url: `http://localhost:${process.env.NT_HTTP_PORT}/client`,
  env: {
    NT_CLIENT_CONFIG: process.env.NT_CLIENT_CONFIG,
    NT_ALIAS_DEMO: process.env.NT_ALIAS_DEMO
  }
}

router.get('/', function (req, res) {
  res.render('client_config.html', config_data);
})

module.exports = router;