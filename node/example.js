const fs = require('fs')
var path = require('path');
var async = require("async");

if(!fs.existsSync(path.join(__dirname, ".env"))){
  fs.copyFileSync(path.join(__dirname, ".env.example"),path.join(__dirname, ".env"))
}
require('dotenv').config()

var utils = require('./lib/utils');

var api_map = {
  http: require('./lib/rest'),
  cli: require('./lib/cli'),
  cgo: require('./lib/cgo'),
  rpc: require('./lib/rpc')
}

var token = utils.CreateToken({ 
  username: "admin", database: "demo",
  algorithm:  process.env.NT_EXAMPLE_TOKEN_ALGORITHM,
  kid: process.env.NT_TOKEN_PUBLIC_KID
})

fn_map = {
  UserLogin: [{"username": "admin", "password": "", "database": "demo"}],
  TokenRefresh: [token],
  TokenLogin: [token],
  UserPassword: [token, {
    username: "guest",
    password: "Password_1234",
    confirm: "Password_1234",
    custnumber: ""
  }],
  Report: [token, {
    output: "pdf",
    reportkey: "ntr_invoice_en",
    orientation: "portrait",
    size: "a4",
    nervatype: "trans",
    refnumber: "DMINV/00001",
    template: "", "filters": {"@id": 5}
  }],
  ReportList: [token, {
    label: ""
  }],
  ReportDelete: [token, {
    reportkey: "ntr_employee_en"
  }],
  ReportInstall: [token, {
    reportkey: "ntr_employee_en"
  }],
  Function: [token, {
    key: "nextNumber",
    values: {
      numberkey: "custnumber",
      step: false,
      insert_key: false,
    },
    value: ""
  }],
  View: [token, [{
    key: "customers",
    text: "select c.id, ct.groupvalue as custtype, c.custnumber, c.custname from customer c inner join groups ct on c.custtype = ct.id where c.deleted = 0 and c.custnumber <> 'HOME'",
    values: []
  }]],
  Get: [token, {
    nervatype: "customer",
    metadata: true,
    filter: "",
    ids: "2,4",
  }],
  Update: [token, {
    nervatype: "address",
    data: [{
      keys: {
        nervatype: "customer",
        ref_id: "customer/DMCUST/00001"
      },
      zipcode: "12345"
    }]
  }],
  Delete: [token, {
    nervatype: "address",
    key: "customer/DMCUST/00001~1"
  }],
}

async.waterfall([
  function(callback) {
    const api_type = "cgo"
    utils.GetApi(
      process.env.NT_API_KEY, api_type, "DatabaseCreate", { alias: "demo", database: "demo", demo: true }, 
      function(err, result){
        if(err){
          return callback("DatabaseCreate error: "+err, start_time)
        }
        console.log("DatabaseCreate OK")
        console.log("--------------------")
        callback(null)
      }
    )
  },

  function(callback) {
    const start_time = Date.now()
    const api_type = "cli"
    var fn_lst = [];
    Object.keys(fn_map).forEach(func_name => {
      fn_lst.push(function(callback_){
        api_map[api_type][func_name](...fn_map[func_name], function(err, result){
          if(err){
            console.log(api_type+" "+func_name+" error: "+err)
          } else {
            console.log(api_type+" "+func_name+" OK")
          }
          callback_()
        })
      });
    });            
    async.series(fn_lst,function() {
      console.log("--------------------")
      console.log(`${api_type} time ${Math.floor(Date.now() - start_time)}`);
      console.log("--------------------")
      callback(null)
    });
  },

  function(callback) {
    const start_time = Date.now()
    const api_type = "cgo"
    Object.keys(fn_map).forEach(func_name => {
      result = api_map[api_type][func_name](...fn_map[func_name])
      const err = (!result || (result && typeof(result.code) !== "undefined"))
        ? result.message || result.error : null
        if(err && (err !== "OK")){
          console.log(api_type+" "+func_name+" error: "+err)
        } else {
          console.log(api_type+" "+func_name+" OK")
        }
    })
    console.log("--------------------")
    console.log(`${api_type} time ${Math.floor(Date.now() - start_time)}`);
    console.log("--------------------")
    callback(null)
  },

  function(callback) {
    utils.StartService(false, (err, controller)=>{
      callback(err, controller)
    })
  },

  function(controller, callback) {
    const start_time = Date.now()
    const api_type = "rpc"
    var fn_lst = [];
    Object.keys(fn_map).forEach(func_name => {
      fn_lst.push(function(callback_){
        api_map[api_type][func_name](...fn_map[func_name], function(err, result){
          if(err){
            console.log(api_type+" "+func_name+" error: "+err)
          } else {
            console.log(api_type+" "+func_name+" OK")
          }
          callback_()
        })
      });
    });            
    async.series(fn_lst,function() {
      console.log("--------------------")
      console.log(`${api_type} time ${Math.floor(Date.now() - start_time)}`);
      console.log("--------------------")
      callback(null, controller)
    });
  },

  function(controller, callback) {
    const start_time = Date.now()
    const api_type = "http"
    var fn_lst = [];
    Object.keys(fn_map).forEach(fn_name => {
      const func_name = (fn_name === "TokenLogin") ? "TokenValidate" : fn_name
      fn_lst.push(function(callback_){
        api_map[api_type][func_name](...fn_map[fn_name], function(data){
          const err = (typeof(data.code) !== "undefined")
            ? data.message : null
          if(err){
            console.log(api_type+" "+func_name+" error: "+err)
          } else {
            console.log(api_type+" "+func_name+" OK")
          }
          callback_()
        })
      });
    });            
    async.series(fn_lst,function() {
      console.log("--------------------")
      console.log(`${api_type} time ${Math.floor(Date.now() - start_time)}`);
      console.log("--------------------")
      callback(null, controller)
    });
  }

],  
function(err, controller) {
  if(err){
    console.log(err)
  }
  if(controller){
    controller.abort()
  }
})

