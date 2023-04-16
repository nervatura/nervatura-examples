<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

class ExternalToken {
  function init($f3){
    $f3->set('title', 'Using external API for token based authentication');
    $f3->set('env', array(
      'NT_TOKEN_PUBLIC_KEY_URL'=>getenv('NT_TOKEN_PUBLIC_KEY_URL'),
      'NT_ALIAS_DEFAULT'=>getenv('NT_ALIAS_DEFAULT'),
      'NT_ALIAS_DEMO'=>getenv('NT_ALIAS_DEMO')
    ));
  }
  
  public function get($f3){
    $this->init($f3);
    $this->sendResult($f3);
  }

  function sendResult($f3){
    $f3->set('content', 'external_token.html');
    echo Template::instance()->render('layout.html');
  }
}

?>