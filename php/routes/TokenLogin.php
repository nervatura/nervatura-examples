<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

class TokenLogin {
  function init($f3){
    $f3->set('title', 'Custom token (passwordless) login');
    $f3->set('database', 'demo');
    $f3->set('username', 'admin');
    $f3->set('error', NULL);
    $f3->set('result', NULL);
    $f3->set('api_type', getenv('NT_EXAMPLE_DEFAULT_API'));
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
    $this->sendResult($f3);
  }

  public function post($f3){
    $this->init($f3);
    $f3->set('username', $f3->get('POST.username'));
    $f3->set('database', $f3->get('POST.database'));
    $f3->set('api_type', $f3->get('POST.api_type'));
    $token = (new Utils())->CreateToken(array(
      'username' => $f3->get('username'), 
      'database' => $f3->get('database'),
      'algorithm' => getenv('NT_EXAMPLE_TOKEN_ALGORITHM'),
      'kid' => getenv('NT_TOKEN_PUBLIC_KID')
    ));
    if($f3->get('api_type') == 'http'){
      $result = $f3->get($f3->get('api_type'))->TokenValidate($token);
    } else {
      $result = $f3->get($f3->get('api_type'))->TokenLogin($token);
    }
    $f3->set('error', $result['error']);
    $f3->set('result', $result['result']);
    $this->sendResult($f3);
  }

  function sendResult($f3){
    $f3->set('content', 'token_login.html');
    echo Template::instance()->render('layout.html');
  }
}

?>