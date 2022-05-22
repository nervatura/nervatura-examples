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

var invoice_data = {
  username: "admin",
  database: "demo",
  api_type: process.env.NT_EXAMPLE_DEFAULT_API,
  title: "Create a customer invoice",
  error: null, result: null,
  env: {
    NT_EXAMPLE_TOKEN_PRIVATE_KEY: process.env.NT_EXAMPLE_TOKEN_PRIVATE_KEY,
    NT_EXAMPLE_TOKEN_EXP: process.env.NT_EXAMPLE_TOKEN_EXP,
    NT_EXAMPLE_TOKEN_ALGORITHM: process.env.NT_EXAMPLE_TOKEN_ALGORITHM,
    NT_TOKEN_ISS: process.env.NT_TOKEN_ISS,
    NT_TOKEN_PUBLIC_KID: process.env.NT_TOKEN_PUBLIC_KID,
    NT_TOKEN_PUBLIC_KEY: process.env.NT_TOKEN_PUBLIC_KEY,
    NT_ALIAS_DEMO: process.env.NT_ALIAS_DEMO,
  },
  data: {
    trans: {
      transdate: "2022-12-24",
      duedate: "2023-01-01",
      ref_transnumber: "REFNUMBER",
      curr: "EUR",
      notes: "Example invoice",
      fnote: '<p>'
        +"CONTACT INFORMATION: contact@mail.com<br />"
        +"Telephone: 0123456789</p>",
      keys: {
        transnumber: [
          "numberdef", "invoice_out"
        ],
        customer_id: "EXAMPLE_CUSTOMER",
        transtype: "invoice",
        direction: "out",
        paidtype: "transfer",
        department: "sales",
        transtate: "ok"
      }
    },
    customer: {
      custnumber: "EXAMPLE_CUSTOMER",
      custname: "Example Customer",
      taxnumber: "TN0123456",
      keys: {
        custtype: "company"
      }
    },
    address: [{
      zipcode: "01234", 
      city: "City", 
      street: "Street 123."
    }],
    contact: [{
      firstname: "Firstname", 
      surname: "Surname",
      phone: "0123456789",
      email: "contact@mail.com"
    }],
    items: [
      {
        unit: "piece",
        qty: 3,
        fxprice: 166.67,
        netamount: 500,
        discount: 0,
        vatamount: 100,
        amount: 600,
        description: "Big product",
        keys: {
          product_id: "DMPROD/00001",
          tax_id: "20%"
        }
      }
    ],
  }
}

router.get('/', function (req, res) {
  res.render('create_invoice.html', invoice_data);
})

function createInvoice(token, params, createCallback) {
  async.waterfall([
    function(callback) {
      var views = [
        { key: "customer",
          text: `select count(*) as anum from customer
            where custnumber=?`,
          values: [params.data.customer.custnumber] 
        },
        { key: "address",
          text: `select count(*) as anum from address a
            inner join groups g on a.nervatype=g.id and g.groupvalue='customer'
            inner join customer c on a.ref_id=c.id
            where c.custnumber=?`,
          values: [params.data.customer.custnumber] 
        },
        { key: "contact",
          text: `select count(*) as anum from contact co
            inner join groups g on co.nervatype=g.id and g.groupvalue='customer'
            inner join customer c on co.ref_id=c.id
            where c.custnumber=?`,
          values: [params.data.customer.custnumber] 
        }
      ]
      utils.GetApi(token, params.api_type, "View", views, function(err, result){
        callback(err, result)
      })
    },

    function(views, callback) {
      if(params.data.customer){
        if(parseInt(views.customer[0].anum,10) > 0){
          //existing customer
          params.data.customer.keys.id = params.data.customer.custnumber
        }
        utils.GetApi(token, params.api_type, "Update", 
          {nervatype: "customer", data: [params.data.customer]}, 
          function(err, result){
            callback(err, views)
          }
        )
      } else {
        callback(null, views)
      }
    },

    function(views, callback) {
      if(params.data.address){
        if(parseInt(views.address[0].anum,10) > 0){
          // existing address
          params.data.address[0].keys = {
            id: "customer/"+params.data.customer.custnumber+"~1"
          }
        } else {
          // new address data
          params.data.address[0].keys = {
            nervatype: "customer",
            ref_id: "customer/"+params.data.customer.custnumber
          }
        }
        utils.GetApi(token, params.api_type, "Update", 
          {nervatype: "address", data: params.data.address}, 
          function(err, result){
            callback(err, views)
          }
        )
      } else {
        callback(null, views)
      }
    },

    function(views, callback) {
      if(params.data.contact){
        if(parseInt(views.contact[0].anum,10) > 0){
          // existing contact
          params.data.contact[0].keys = {
            id: "customer/"+params.data.customer.custnumber+"~1"
          }
        } else {
          // new contact data
          params.data.contact[0].keys = {
            nervatype: "customer",
            ref_id: "customer/"+params.data.customer.custnumber
          }
        }
        utils.GetApi(token, params.api_type, "Update", 
          {nervatype: "contact", data: params.data.contact}, 
          function(err, result){
            callback(err)
          }
        )
      } else {
        callback(null)
      }
    },

    function(callback) {
      if(params.data.trans){
        utils.GetApi(token, params.api_type, "Update", 
          {nervatype: "trans", data: [params.data.trans]}, 
          function(err, result){
            if(result && params.data.items){
              params.data.items.forEach(item => {
                item.trans_id = result[0]
              });
            }
            callback(err, (result) ? result[0] : null)
          }
        )
      } else {
        callback(null, null)
      }
    },

    function(trans_id, callback) {
      if(params.data.items){
        utils.GetApi(token, params.api_type, "Update", 
          {nervatype: "item", data: params.data.items}, 
          function(err, result){
            callback(err, trans_id)
          }
        )
      } else {
        callback(null, trans_id)
      }
    }

  ],
  function(err, trans_id) {
    createCallback(err, trans_id)
  })
}

router.post('/', function (req, res) {
  const params = Object.assign({}, invoice_data, {
    username: req.body.username, database: req.body.database, api_type: req.body.api_type
  })
  token = utils.CreateToken({ 
    username: params.username, database: params.database,
    algorithm:  process.env.NT_EXAMPLE_TOKEN_ALGORITHM,
    kid: process.env.NT_TOKEN_PUBLIC_KID
  })
  req.app.get("session")["invoice_token"] = token
  createInvoice(token, params, function(err, trans_id){
    return res.render('create_invoice.html', {
      ...params,
      error: (err) ? err : null,
      result: (err) ? null : trans_id
    });
  })
})

router.get('/report/*', function (req, res) {
  var api_type = req.path.split("/")[2]
  var trans_id = req.path.split("/")[3]
  const params = {
    reportkey: "ntr_invoice_en",
    orientation: "portrait",
    size: "a4",
    output: "base64",
    nervatype: "trans",
    filters: {
      "@id": trans_id
    }
  }
  utils.GetApi(req.app.get("session")["invoice_token"], api_type, "Report", params, function(err, data){
    if(err){
      return res.render('create_invoice.html', {
        ...invoice_data,
        api_type: api_type,
        error: err,
        result: trans_id
      });
    }
    var result = data
    switch (api_type) {
      case "rpc":
        result = JSON.parse(data.toString('utf-8')).template
        break;

      case "http":
        result = data
        break;
    
      default:
        result = data.template
        break;
    }

    res.setHeader('Content-Disposition', `attachment; filename=Invoice_${trans_id}.pdf`);
    res.setHeader('Content-Type', 'application/pdf');
    result = Buffer.from(result.substring(result.indexOf(";base64,")+8), 'base64')
    res.status(200).send(result)
  })
})

module.exports = router;