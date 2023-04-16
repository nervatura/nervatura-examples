/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

const http = require('http');
var utils = require('./utils');

function httpApi(params, callback){
  const options = {
    protocol: "http:", hostname: "localhost", port: process.env.NT_HTTP_PORT,
    path: "/api"+params.path, method: params.method,
    headers: {
      "Content-Type": "application/json",
    }
  };
  const post_data = (params.data) ? utils.EncodeOptions(params.data) : null
  if(params.token){
    options.headers["Authorization"] = "Bearer "+params.token
  }
  if(params.api_key){
    options.headers["X-API-Key"] = params.api_key
  }
  if(post_data){
    options.headers["Content-Length"] = post_data.length
  }
  const hreq = http.request(options, (hres) => {
    let data = "";

    hres.on("data", (chunk) => {
        data += chunk;
    });

    hres.on("end", () => {
      if(!String(params.path).startsWith("/report")){
        return callback(utils.CheckJson(data))
      }
      callback(data)
    });

  }).on("error", (err) => {
    callback({code:400, message: err.message})
  });
  
  if(post_data){
    hreq.write(post_data);
  }
  hreq.end();
}

exports.DatabaseCreate = function(apiKey, options, callback) {
  httpApi({ path: `/database?alias=${options.alias}&demo=${options.demo}`, method: "POST", api_key: apiKey }, 
    function(data){
      callback(data)
    })
}

exports.UserLogin = function(options, callback) {
  httpApi({ path: "/auth/login", method: "POST", data: options }, function(data){
    callback(data)
  })
}

exports.TokenRefresh = function(token, callback) {
  httpApi({ path: "/auth/refresh", method: "GET", token }, function(data){
    callback(data)
  })
}

exports.TokenValidate = function(token, callback) {
  httpApi({ path: "/auth/validate", method: "GET", token }, function(data){
    callback(data)
  })
}

exports.UserPassword = function(token, options, callback) {
  httpApi({ path: "/auth/password", method: "POST", token, data: options }, function(data){
    callback(data)
  })
}

exports.Delete = function(token, options, callback) {
  var path = "/"+options["nervatype"];
  if (options["id"]) {
    path += "?id="+options["id"];
  } else if (options["key"]) {
    path += "?key="+encodeURIComponent(options["key"]);
  }
  httpApi({ path, method: "DELETE", token }, function(data){
    callback(data)
  })
}

exports.Get = function(token, options, callback) {
  var path = "/"+options["nervatype"];
  if (options["ids"] && Array.isArray(options["ids"])) {
    path += "/"+Array(options["ids"]).join(",");
  } else if (options["ids"]){
    path += "/"+options["ids"];
  } else {
    if (options["metadata"] && (options["metadata"] === true)) {
      path += "?metadata=true";
    } else {
      path += "?metadata=false";
    }
    if (options["filter"]) {
      path += "&filter="+encodeURIComponent(options["filter"]);
    }
  }
  httpApi({ path, method: "GET", token }, function(data){
    callback(data)
  })
}

exports.View = function(token, data, callback) {
  httpApi({ path: "/view", method: "POST", token, data: data }, function(data){
    callback(data)
  })
}

exports.Function = function(token, options, callback) {
  httpApi({ path: "/function", method: "POST", token, data: options }, function(data){
    callback(data)
  })
}

exports.Update = function(token, options, callback) {
  httpApi({ path: "/"+options.nervatype, method: "POST", token, data: options.data }, 
    function(data){
      callback(data)
    })
}

exports.Report = function(token, options, callback) {
  var query = new URLSearchParams()
  query.append("reportkey", options.reportkey)
  query.append("orientation", options.orientation)
  query.append("size", options.size)
  query.append("output", options.output)
  query.append("nervatype", options.nervatype||"")
  var path = `/report?${query.toString()}&filters[@id]=${options.filters["@id"]}`
  httpApi({ path: path, method: "GET", token }, 
    function(data){
      callback(data)
    })
}

exports.ReportList = function(token, options, callback) {
  var path = "/report/list";
  if (options["label"]) {
    path += "?label="+encodeURIComponent(options["label"]);
  }
  httpApi({ path, method: "GET", token }, function(data){
    callback(data)
  })
}

exports.ReportDelete = function(token, options, callback) {
  var path = "/report/delete";
  if (options["reportkey"]) {
    path += "?reportkey="+encodeURIComponent(options["reportkey"]);
  }
  httpApi({ path, method: "DELETE", token }, function(data){
    callback(data)
  })
}

exports.ReportInstall = function(token, options, callback) {
  var path = "/report/install";
  if (options["reportkey"]) {
    path += "?reportkey="+encodeURIComponent(options["reportkey"]);
  }
  httpApi({ path, method: "POST", token }, function(data){
    callback(data)
  })
}