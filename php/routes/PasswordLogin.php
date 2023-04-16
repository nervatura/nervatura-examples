<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

class PasswordLogin {
  function init($f3){
    $f3->set('title', 'Basic password login');
    $f3->set('username', 'admin');
    $f3->set('password', '');
    $f3->set('database', 'demo');
    $f3->set('error', NULL);
    $f3->set('result', NULL);
    $f3->set('api_type', getenv('NT_EXAMPLE_DEFAULT_API'));
    $f3->set('env', array(
      'NT_PASSWORD_LOGIN'=>getenv('NT_PASSWORD_LOGIN'),
      'NT_ALIAS_DEMO'=>getenv('NT_ALIAS_DEMO')
    ));
  }

  function error($f3) {
    $this->init($f3);
    $f3->set('error', $f3->get('ERROR.text'));
    $this->sendResult($f3);
  }
  
  public function get($f3){
    $f3->set('ONERROR', 'PasswordLogin->error');
    $this->init($f3);
    $this->sendResult($f3);
  }

  public function post($f3){
    $this->init($f3);
    $f3->set('username', $f3->get('POST.username'));
    $f3->set('password', $f3->get('POST.password'));
    $f3->set('database', $f3->get('POST.database'));
    $f3->set('api_type', $f3->get('POST.api_type'));
    $api = $f3->get($f3->get('api_type'));
    $options = array(
      'username'=>$f3->get('username'),
      'password'=>$f3->get('password'),
      'database'=>$f3->get('database')
    );
    $result = $api->UserLogin($options);
    $f3->set('error', $result['error']);
    $f3->set('result', $result['result']);
    $this->sendResult($f3);
  }

  function sendResult($f3){
    $f3->set('content', 'password_login.html');
    echo Template::instance()->render('layout.html');
  }
}

?>