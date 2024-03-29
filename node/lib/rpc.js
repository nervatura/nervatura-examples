/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

var utils = require('./utils');

var path = require('path');
const protoLoader = require('@grpc/proto-loader');
const grpc = require('@grpc/grpc-js');
const { forEach } = require('async');

const protoPath = path.join("node_modules","nervatura","bin","proto","api.proto")

//const sslCreds = grpc.credentials.createSsl(sslCert);
const insecureCreds = grpc.credentials.createInsecure()

const pb = protoLoader.loadSync(protoPath, {
  keepCase: true, longs: Number, enums: String, defaults: false, oneofs: true
});
const nervatura = grpc.loadPackageDefinition(pb).nervatura

function rpcClient(ckey, meta, options, callback){
  const client = new nervatura.API(`localhost:${process.env.NT_GRPC_PORT}`, insecureCreds);
  client[ckey](options, meta, function(err, data){
    if(err && err.code === 14){
      client[ckey](options, meta, function(err, data){
        callback(err, data)
      })
    } else {
      callback(err, data)
    }
  });
}

function encodeValue(value) {
  if(typeof value === 'boolean'){
    return { boolean: value, value: "boolean" }
  } else if(typeof value === 'number'){
    return { number: value, value: "number" }
  } else if((typeof value === 'object') && Array.isArray(value)){
    return { text: value.join(","), value: "text" }
  } else {
    return { text: String(value), value: "text" }
  }
}

function decodeValue(values){
  var value = {}
  Object.keys(values).forEach(key => {
    value[key] = values[key][values[key].value]
    if (value[key] === "null"){
      value[key] = null
    }
  })
  return value
}

function mapValue(values){
  var value = {}
  Object.keys(values).forEach(fieldname => {
    value[fieldname] = encodeValue(values[fieldname])
  })
  return value
}

exports.DatabaseCreate = function(apiKey, options, callback) {
  var meta = new grpc.Metadata();
  meta.add('x-api-key', apiKey);
  rpcClient("DatabaseCreate", meta, options, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    var results = []
    if(data && data.details){
      results = data.details.items.map(item => decodeValue(item.values))
    }
    callback(null, results)
  })
}

exports.UserLogin = function(options, callback) {
  var meta = new grpc.Metadata();
  rpcClient("UserLogin", meta, options, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    callback(null, data)
  })
}

exports.TokenLogin = function(token, callback) {
  var meta = new grpc.Metadata();
  meta.add('Authorization', `Bearer ${token}`);
  rpcClient("TokenLogin", meta, {}, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    callback(null, data)
  })
}

exports.TokenRefresh = function(token, callback) {
  var meta = new grpc.Metadata();
  meta.add('Authorization', `Bearer ${token}`);
  rpcClient("TokenRefresh", meta, {token: token}, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    var result = (data && data.value) ? data.value : {}
    callback(null, result)
  })
}

exports.TokenDecode = function(token, callback) {
  var meta = new grpc.Metadata();
  rpcClient("TokenDecode", meta, {token: token}, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    callback(null, data)
  })
}

exports.UserPassword = function(token, options, callback) {
  var meta = new grpc.Metadata();
  meta.add('Authorization', `Bearer ${token}`);
  rpcClient("UserPassword", meta, options, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    callback(null, {})
  })
}

exports.Delete = function(token, options, callback) {
  var meta = new grpc.Metadata();
  meta.add('Authorization', `Bearer ${token}`);
  var rpcOptions = {
    nervatype: nervatura.DataType.type.value.filter(dtype => (dtype.name === options.nervatype))[0].number,
    id: (options.id) ? options.id : 0,
    key: (options.key) ? options.key : ""
  }
  rpcClient("Delete", meta, rpcOptions, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    callback(null, {})
  })
}

exports.Get = function(token, options, callback) {
  var meta = new grpc.Metadata();
  meta.add('Authorization', `Bearer ${token}`);
  var rpcOptions = {
    nervatype: nervatura.DataType.type.value.filter(dtype => (dtype.name === options.nervatype))[0].number,
    metadata: options.metadata,
    ids: (typeof(options.ids) === "string") ? String(options.ids).split(",") : options.ids,
    filter: options.filter
  }
  rpcClient("Get", meta, rpcOptions, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    var results = (data && data.values)
      ? data.values.map(item => item[options.datatype]) : []
    callback(null, results)
  })
}

exports.View = function(token, options, callback) {
  var meta = new grpc.Metadata();
  meta.add('Authorization', `Bearer ${token}`);
  var rpcOptions = {
    options: options.map(view => {
      return {
        key: view.key,
        text: view.text,
        values: view.values.map(value => encodeValue(value))
      }
    })
  }
  rpcClient("View", meta, rpcOptions, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    var results = {}
    if(data && data.values){
      Object.keys(data.values).forEach(fieldname => {
        var items = (data.values[fieldname].items) ? data.values[fieldname].items : []
        results[fieldname] = items.map(item => decodeValue(item.values))
      });
    }
    callback(null, results)
  })
}

exports.Function = function(token, options, callback) {
  function checkValue(prmValues){
    return (Object.values(prmValues).filter(value => (
      (typeof(value) !== "boolean") && (typeof(value) !== "number") 
      && (!Array.isArray(value)) && (typeof(value) !== "string")
    )).length === 0)
  }
  var meta = new grpc.Metadata();
  meta.add('Authorization', `Bearer ${token}`);
  var rcpValues, rcpValue
  if(checkValue(options.values||{})){
    rcpValues = mapValue(options.values)
  } else {
    rcpValue = utils.ToBytes(utils.EncodeOptions(options.values))
  }
  var rpcOptions = {
    key: options.key, values: rcpValues, value: rcpValue
  }
  rpcClient("Function", meta, rpcOptions, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    var result = (data && data.value) ? data.value : {}
    callback(null, result)
  })
}

exports.Update = function(token, options, callback) {
  var meta = new grpc.Metadata();
  meta.add('Authorization', `Bearer ${token}`);
  var nervatype = nervatura.DataType.type.value.filter(dtype => (dtype.name === options.nervatype))[0].number
  var rpcOptions = {
    nervatype: nervatype,
    items: options.data.map(item => {
      var result = {
        values: mapValue(item),
        keys: (item.keys) ? mapValue(item.keys) : {}
      }
      delete result.values.keys
      return result
    })
  }
  rpcClient("Update", meta, rpcOptions, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    var result = (data && data.values) ? data.values : {}
    callback(null, result)
  })
}

exports.Report = function(token, options, callback) {
  var meta = new grpc.Metadata();
  meta.add('Authorization', `Bearer ${token}`);
  var rpcOptions = {
    reportkey: options.reportkey || "",
    template: options.template || "",
    orientation: (options.orientation)? 
      nervatura.ReportOrientation.type.value.filter(dtype => (dtype.name === options.orientation))[0].number : 0,
    size: (options.size)? 
      nervatura.ReportSize.type.value.filter(dtype => (dtype.name === options.size))[0].number : 1,
    output: (options.output)?
      ((options.output === "print") || (options.output === "auto") || (options.output === "pdf")) ? 3 :
      nervatura.ReportOutput.type.value.filter(dtype => (dtype.name === options.output))[0].number : 0,
    type: (options.nervatype)? 
      nervatura.ReportType.type.value.filter(dtype => (dtype.name === "report_"+options.nervatype))[0].number : 0,
    refnumber: (options.refnumber) ? options.refnumber : null,
    filters: (options.filters) ? mapValue(options.filters) : {}
  }
  rpcClient("Report", meta, rpcOptions, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    var result = (data && data.value) ? data.value : {}
    callback(null, result)
  })
}

exports.ReportList = function(token, options, callback) {
  var meta = new grpc.Metadata();
  meta.add('Authorization', `Bearer ${token}`);
  rpcClient("ReportList", meta, options, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    var result = (data && data.items) ? data.items : []
    callback(null, result)
  })
}

exports.ReportDelete = function(token, options, callback) {
  var meta = new grpc.Metadata();
  meta.add('Authorization', `Bearer ${token}`);
  rpcClient("ReportDelete", meta, options, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    callback(null, {})
  })
}

exports.ReportInstall = function(token, options, callback) {
  var meta = new grpc.Metadata();
  meta.add('Authorization', `Bearer ${token}`);
  rpcClient("ReportInstall", meta, options, function(err, data){
    if(err !== null){
      return callback(err.details, null)
    }
    var result = (data && data.id) ? data.id: []
    callback(null, result)
  })
}