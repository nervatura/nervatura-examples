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

var report_data = {
  meta: {
    reportkey: "csv_example_report",
    nervatype: "report",
    repname: "CSV Report Example",
    description: "Customer contacts",
    label: "Customer",
    filetype: "csv"
  },
  details: [
    {
      columns: [
        "custname", "firstname", "surname", "status", "phone", "email"
      ],
      name: "contact",
      databind: "contact"
    }
  ],
  sources: {
    contact: {
      default: `select c.custname as custname, co.firstname as firstname, co.surname as surname, co.status as status, co.phone as phone, co.email as email
      from contact co
      inner join groups nt on co.nervatype=nt.id and nt.groupvalue='customer'
      inner join customer c on co.ref_id=c.id
      where co.deleted = 0 and c.deleted=0 @where_str`
    }
  },
  fields: {
    custname: {
      fieldtype: "string", wheretype: "where", description: "Customer Name", orderby: 0
    },
    surname: {
      fieldtype: "string", wheretype: "where", description: "Contact Surname", orderby: 1
    },
  },
  data: {
    labels: {
      custname: "Customer", firstname: "Firstname", surname: "surname", 
      status: "Status", phone: "Phone", email: "Email"
    }
  }
}

var example_data = {
  username: "admin",
  database: "demo",
  api_type: process.env.NT_EXAMPLE_DEFAULT_API,
  title: "CSV Report Example",
  error: null, exists: null, client_url: "",
  env: {
    NT_EXAMPLE_TOKEN_PRIVATE_KEY: process.env.NT_EXAMPLE_TOKEN_PRIVATE_KEY,
    NT_EXAMPLE_TOKEN_EXP: process.env.NT_EXAMPLE_TOKEN_EXP,
    NT_EXAMPLE_TOKEN_ALGORITHM: process.env.NT_EXAMPLE_TOKEN_ALGORITHM,
    NT_TOKEN_ISS: process.env.NT_TOKEN_ISS,
    NT_TOKEN_PUBLIC_KID: process.env.NT_TOKEN_PUBLIC_KID,
    NT_TOKEN_PUBLIC_KEY: process.env.NT_TOKEN_PUBLIC_KEY,
    NT_ALIAS_DEMO: process.env.NT_ALIAS_DEMO
  },
  data: {
    ui_report: [
      { reportkey: report_data.meta.reportkey,
        repname: report_data.meta.repname,
        description: report_data.meta.description,
        label: report_data.meta.label,
        report: JSON.stringify(report_data),
        keys: {
          nervatype: report_data.meta.nervatype,
          filetype: report_data.meta.filetype
        }
      }
    ]
  }
}

function checkFunctions( token, api_type, callback) {
  var views = [
    { key: "report",
      text: `select count(*) as anum from ui_report
        where reportkey in(?)`,
      values: ["csv_example_report"] 
    }
  ]
  utils.GetApi(token, api_type, "View", views, function(err, result){
    if(!err){
      return callback((parseInt(result.report[0].anum,10) > 0))
    }
    callback(false)
  })
}

router.get('/', function (req, res) {
  var token = utils.CreateToken({ 
    username: example_data.username, database: example_data.database,
    algorithm:  process.env.NT_EXAMPLE_TOKEN_ALGORITHM,
    kid: process.env.NT_TOKEN_PUBLIC_KID
  })
  checkFunctions(token, example_data.api_type, function(result){
    var data = Object.assign({}, example_data, { 
      exists: result, 
      client_url: `http://localhost:${process.env.NT_HTTP_PORT}/client?#access_token=${token}` 
    })
    res.render('csv_report.html', data);
  })
})

function createReport(token, params, createCallback) {
  utils.GetApi(token, params.api_type, "Update", 
    {nervatype: "ui_report", data: params.data.ui_report}, 
    function(err, result){
      createCallback(err)
    }
  )
}

router.post('/', function (req, res) {
  var params = Object.assign({}, example_data, {
    api_type: req.body.api_type
  })
  var token = utils.CreateToken({ 
    username: example_data.username, database: example_data.database,
    algorithm:  process.env.NT_EXAMPLE_TOKEN_ALGORITHM,
    kid: process.env.NT_TOKEN_PUBLIC_KID
  })
  checkFunctions(token, req.body.api_type, function(result){
    if(!result){
      return createReport(token, params, function(err){
        res.render('csv_report.html', {
          ...params,
          error: (err) ? err : null,
          exists: (err) ? null : true,
          client_url: `http://localhost:${process.env.NT_HTTP_PORT}/client?#access_token=${token}`
        });
      })
    }
    res.render('csv_report.html', {
      ...params,
      error: null,
      exists: true
    });
  })
  
})

module.exports = router;