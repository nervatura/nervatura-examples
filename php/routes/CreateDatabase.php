<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

class CreateDatabase {
  function init($f3){
    $f3->set('title', 'Create a demo database');
    $f3->set('alias', 'demo');
    $f3->set('demo', 'true');
    $f3->set('error', NULL);
    $f3->set('result', NULL);
    $f3->set('api_key', getenv('NT_API_KEY'));
    $f3->set('api_type', getenv('NT_EXAMPLE_DEFAULT_API'));
    $f3->set('env', array(
      'NT_API_KEY'=>getenv('NT_API_KEY'),
      'NT_ALIAS_DEMO'=>getenv('NT_ALIAS_DEMO')
    ));
  }
  
  public function get($f3){
    $this->init($f3);
    $this->sendResult($f3);
  }

  public function post($f3){
    $this->init($f3);
    $f3->set('alias', $f3->get('POST.alias'));
    $f3->set('demo', $f3->get('POST.demo'));
    $f3->set('api_key', $f3->get('POST.api_key'));
    $f3->set('api_type', $f3->get('POST.api_type'));
    $api = $f3->get($f3->get('api_type'));
    $options = array(
      'demo' => $f3->get('demo'),
      'alias' => $f3->get('alias')
    );
    $result = $api->DatabaseCreate($f3->get('api_key'), $options);
    $f3->set('error', $result['error']);
    $f3->set('result', $result['result']);
    $this->sendResult($f3);
  }

  function sendResult($f3){
    $f3->set('content', 'create_database.html');
    echo Template::instance()->render('layout.html');
  }
}

?>