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
  title: "Using external API for token based authentication",
  env: {
    NT_ALIAS_DEMO: process.env.NT_ALIAS_DEMO,
    NT_ALIAS_DEFAULT: "demo",
    NT_TOKEN_PUBLIC_KEY_URL: process.env.NT_TOKEN_PUBLIC_KEY_URL,
  }
}

router.get('/', function (req, res) {
  res.render('external_token.html', config_data);
})

module.exports = router;