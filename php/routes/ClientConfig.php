<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

class ClientConfig {
  function init($f3){
    $f3->set('title', 'Nervatura Client language translation');
    $f3->set('client_url', 'http://localhost:'.getenv('NT_HTTP_PORT').'/client');
    $f3->set('locales_url', 'http://localhost:'.getenv('NT_HTTP_PORT').'/locales');
    $f3->set('env', array(
      'NT_CLIENT_CONFIG'=>getenv('NT_CLIENT_CONFIG'),
      'NT_ALIAS_DEMO'=>getenv('NT_ALIAS_DEMO')
    ));
  }
  
  public function get($f3){
    $this->init($f3);
    $this->sendResult($f3);
  }

  function sendResult($f3){
    $f3->set('content', 'client_config.html');
    echo Template::instance()->render('layout.html');
  }
}

?>