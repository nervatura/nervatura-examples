<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

class Home {
  public function get($f3, $args){
    $f3->set('demo', file_exists('../data/demo.db'));
    $f3->set('content', 'index.html');
    echo Template::instance()->render('layout.html');
  }
}

?>