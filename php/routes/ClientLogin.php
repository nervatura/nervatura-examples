<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

class ClientLogin {
  function init($f3){
    $f3->set('title', 'Nervatura Client custom token login');
    $f3->set('database', 'demo');
    $f3->set('username', 'admin');
    $f3->set('response_type', 'code');
    $f3->set('error', NULL);
    $f3->set('env', array(
      'NT_EXAMPLE_TOKEN_PRIVATE_KEY'=>getenv('NT_EXAMPLE_TOKEN_PRIVATE_KEY'),
      'NT_EXAMPLE_TOKEN_EXP'=>getenv('NT_EXAMPLE_TOKEN_EXP'),
      'NT_EXAMPLE_TOKEN_ALGORITHM'=>getenv('NT_EXAMPLE_TOKEN_ALGORITHM'),
      'NT_TOKEN_ISS'=>getenv('NT_TOKEN_ISS'),
      'NT_TOKEN_PUBLIC_KID'=>getenv('NT_TOKEN_PUBLIC_KID'),
      'NT_TOKEN_PUBLIC_KEY'=>getenv('NT_TOKEN_PUBLIC_KEY'),
      'NT_ALIAS_DEMO'=>getenv('NT_ALIAS_DEMO')
    ));
  }
  
  public function get($f3){
    $this->init($f3);
    $error = $f3->get('GET.error');
    if($error){
      $f3->set('error', base64_decode($error));
    }
    $this->sendResult($f3);
  }

  public function redirect($f3){
    $username = $f3->get('POST.username');
    $database = $f3->get('POST.database');
    $response_type = $f3->get('POST.response_type');
    $token = (new Utils())->CreateToken(array(
      'username' => $username, 
      'database' => $database,
      'algorithm' => getenv('NT_EXAMPLE_TOKEN_ALGORITHM'),
      'kid' => getenv('NT_TOKEN_PUBLIC_KID')
    ));
    $url = 'http://localhost:'.getenv('NT_HTTP_PORT').'/client';
    if ($response_type == 'code') {
      $code = uniqid();
      $cache = \Cache::instance();
      $cache->set('code', $code);
      $cache->set('token', $token);
      $url = $url.'?#code='.$code.'&callback=http://'.getenv('NT_EXAMPLE_HOST').':'.getenv('NT_EXAMPLE_PORT').'/client_login/token&error=http://'.getenv('NT_EXAMPLE_HOST').':'.getenv('NT_EXAMPLE_PORT').'/client_login';
    } else {
      $url = $url.'?#access_token='.$token.'&callback=http://'.getenv('NT_EXAMPLE_HOST').':'.getenv('NT_EXAMPLE_PORT').'/client_login';
    }
    
    $f3->reroute($url);
  }

  public function token($f3){
    $cache = \Cache::instance();
    $code = $cache->get('code');
    $body = json_decode(file_get_contents('php://input'), true);
    if(array_key_exists('code', $body) && ($body['code'] == $code)) {
      $token = $cache->get('token');
      $data = json_encode(array(
        'access_token' => $token,
        'token_type' => 'bearer',
        'expires_in' => getenv('NT_EXAMPLE_TOKEN_EXP'),
        'callback' => 'http://'.getenv('NT_EXAMPLE_HOST').':'.getenv('NT_EXAMPLE_PORT').'/client_login'
      ));
      header('Content-type: application/json', true, 200);
      echo $data;
      return;
    }
    header('Content-type: application/json', true, 400);
    $data = json_encode(array(
      'code' => 400,
      'error' => array(
        'message' => 'Invalid code'
      )
    ));
    echo $data;
  }

  function sendResult($f3){
    $f3->set('content', 'client_login.html');
    echo Template::instance()->render('layout.html');
  }
}

?>