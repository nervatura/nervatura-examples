<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

require(__DIR__.'/../vendor/autoload.php');
require(__DIR__.'/../lib/cli.php');
require(__DIR__.'/../lib/rest.php');
require(__DIR__.'/../lib/utils.php');

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
if (!file_exists('../.env')){
  $dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../','.env.example');
}
$dotenv->load();

$grpc_enabled = extension_loaded('grpc') || extension_loaded('php_grpc');

// Allow from any origin
if (isset($_SERVER['HTTP_ORIGIN'])) {
  // header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
  header("Access-Control-Allow-Origin: *");
  header('Access-Control-Allow-Credentials: true');
  header('Access-Control-Max-Age: 86400');    // cache for 1 day
}
// Access-Control headers are received during OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

  if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD'])) {
      header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
  }
  if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS'])) {
      header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
  }
}

$f3 = Base::instance();
$f3->config(__DIR__.'/../routes/config.ini');
$f3->config(__DIR__.'/../routes/routes.ini');
$f3->set('api_values', array('cli','http'));
$f3->set('cli', new Cli());
$f3->set('http', new Rest());
if($grpc_enabled) {
  // https://cloud.google.com/php/grpc
  require(__DIR__.'/../lib/rpc.php');
  $f3->set('rpc', new Rpc());
  $f3->set('api_values', array('cli','rpc','http'));
}
$f3->run();
