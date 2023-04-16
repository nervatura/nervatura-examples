<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

class ServerShortcuts {
  function init($f3){
    $f3->set('title', 'Nervatura Client menu shortcuts');
    $f3->set('homepage_title', 'External page - GET example');
    $f3->set('database', 'demo');
    $f3->set('username', 'admin');
    $f3->set('api_type', getenv('NT_EXAMPLE_DEFAULT_API'));
    $f3->set('error', NULL);
    $f3->set('exists', NULL);
    $f3->set('homepage', NULL);
    $f3->set('client_url', '');
    $f3->set('env', array(
      'NT_EXAMPLE_TOKEN_PRIVATE_KEY' => getenv('NT_EXAMPLE_TOKEN_PRIVATE_KEY'),
      'NT_EXAMPLE_TOKEN_EXP' => getenv('NT_EXAMPLE_TOKEN_EXP'),
      'NT_EXAMPLE_TOKEN_ALGORITHM' => getenv('NT_EXAMPLE_TOKEN_ALGORITHM'),
      'NT_TOKEN_ISS' => getenv('NT_TOKEN_ISS'),
      'NT_TOKEN_PUBLIC_KID' => getenv('NT_TOKEN_PUBLIC_KID'),
      'NT_TOKEN_PUBLIC_KEY' => getenv('NT_TOKEN_PUBLIC_KEY'),
      'NT_ALIAS_DEMO' => getenv('NT_ALIAS_DEMO'),
      'NT_SMTP_HOST' => getenv('NT_SMTP_HOST'),
      'NT_SMTP_PORT' => getenv('NT_SMTP_PORT'),
      'NT_SMTP_USER' => getenv('NT_SMTP_USER'),
      'NT_SMTP_PASSWORD' => getenv('NT_SMTP_PASSWORD')
    ));
    $f3->set('data', array(
      'ui_menu' => array(
        array('menukey' => 'mnu_example_homepage', 'description' => 'External page - GET example', 'funcname' => 'homepage',
          'address' => 'http://'.getenv('NT_EXAMPLE_HOST').':'.getenv('NT_EXAMPLE_PORT').'/server_shortcuts/homepage',
          'keys' => array('method' => 'get' )),
        array('menukey' => 'mnu_example_email', 'description' => 'Email sending - POST example', 'funcname' => 'email',
          'address' => 'http://'.getenv('NT_EXAMPLE_HOST').':'.getenv('NT_EXAMPLE_PORT').'/server_shortcuts/email',
          'keys' => array('method' => 'post' )),
      ),
      'ui_menufields' => array(
        array('fieldname' => 'homepage_string', 'description' => 'String input', 'orderby' => 0,
          'keys' => array('menu_id' => 'mnu_example_homepage', 'fieldtype' => 'string' )),
        array('fieldname' => 'homepage_bool', 'description' => 'Bool input', 'orderby' => 1,
          'keys' => array('menu_id' => 'mnu_example_homepage', 'fieldtype' => 'bool' )),
        array('fieldname' => 'homepage_date', 'description' => 'Date input', 'orderby' => 2,
          'keys' => array('menu_id' => 'mnu_example_homepage', 'fieldtype' => 'date' )),
        array('fieldname' => 'homepage_integer', 'description' => 'Integer input', 'orderby' => 3,
          'keys' => array('menu_id' => 'mnu_example_homepage', 'fieldtype' => 'integer' )),
        array('fieldname' => 'homepage_float', 'description' => 'Float input', 'orderby' => 4,
          'keys' => array('menu_id' => 'mnu_example_homepage', 'fieldtype' => 'float' )),
        array('fieldname' => 'email_from', 'description' => 'Sender email', 'orderby' => 0,
          'keys' => array('menu_id' => 'mnu_example_email', 'fieldtype' => 'string' )),
        array('fieldname' => 'email_to', 'description' => 'Email address', 'orderby' => 1,
          'keys' => array('menu_id' => 'mnu_example_email', 'fieldtype' => 'string' )),
      )
    ));
  }

  function checkFunctions($f3, $token) {
    $views = array(
      array('key' => 'menu',
        'text' => 'select count(*) as anum from ui_menu where menukey in(?,?)',
        'values' => array('mnu_example_homepage','mnu_example_email') 
      )
    );
    $view_result = $f3->get($f3->get('api_type'))->View($token, $views);
    if($view_result['error']) {
      return false;
    }
    return (bool)((int)$view_result['result']['menu'][0]['anum'] > 0);
  }

  function createShortcuts($f3, $token) {
    $data = $f3->get('data');
    $result = $f3->get($f3->get('api_type'))->Update(
      $token, array('nervatype' => 'ui_menu', 'data' => $data['ui_menu'])
    );
    if($result['error']) {
      return $result;
    }
    $result = $f3->get($f3->get('api_type'))->Update(
      $token, array('nervatype' => 'ui_menufields', 'data' => $data['ui_menufields'])
    );
    return $result;
  }
  
  public function get($f3){
    $this->init($f3);
    $token = (new Utils())->CreateToken(array(
      'username' => $f3->get('username'), 
      'database' => $f3->get('database'),
      'algorithm' => getenv('NT_EXAMPLE_TOKEN_ALGORITHM'),
      'kid' => getenv('NT_TOKEN_PUBLIC_KID')
    ));
    $exists = $this->checkFunctions($f3, $token);
    $f3->set('exists', $exists);
    if($exists) {
      $f3->set('client_url', 'http://localhost:'.getenv('NT_HTTP_PORT').'/client?#access_token='.$token);
    }
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
    $f3->set('client_url', 'http://localhost:'.getenv('NT_HTTP_PORT').'/client?#access_token='.$token);
    $f3->set('error', NULL);
    $f3->set('exists', true);
    $exists = $this->checkFunctions($f3, $token);
    if(!$exists) {
      $result = $this->createShortcuts($f3, $token);
      if($result['error']) {
        $f3->set('error', $result['error']);
        $f3->set('exists', false);
        $f3->set('client_url', '');
      }
    }
    $this->sendResult($f3);
  }

  public function homepage($f3){
    $this->init($f3);
    $get_keys = array(
      'homepage_string' => 'EMPTY',
      'homepage_bool' => 0,
      'homepage_date' => 'EMPTY',
      'homepage_integer' => 0,
      'homepage_float' => 0
    );
    $f3->set('homepage', true);
    $f3->set('homepage_values', array());
    foreach ($get_keys as $key => $value) {
      if($f3->get('GET.'.$key) == '') {
        $f3->set('homepage_values', array_merge($f3->get('homepage_values'), array($key => $value)));
      } else {
        $f3->set('homepage_values', array_merge($f3->get('homepage_values'), array($key => $f3->get('GET.'.$key))));
      }
    }
    $this->sendResult($f3);
  }

  function sendResult($f3){
    $f3->set('content', 'server_shortcuts.html');
    echo Template::instance()->render('layout.html');
  }

  public function email($f3){
    $this->init($f3);
    function error($message){
      header('Content-type: application/json', true, 400);
      echo json_encode(array(
        'code' => 400,
        'error' => array(
          'message' => $message
        )
      ));
    }
    $body = json_decode(file_get_contents('php://input'), true);

    if (!str_contains($body['values']['email_from'], '@')) {
      return error('Invalid sender address');
    }
    if (!str_contains($body['values']['email_to'], '@')) {
      return error('Invalid email address');
    }

    /*
    if ((getenv('NT_SMTP_HOST') == 'EXAMPLE_SMTP_HOST') 
      || (getenv('NT_SMTP_USER') == 'EXAMPLE_SMTP_USER') 
      || (getenv('NT_SMTP_PASSWORD') == 'EXAMPLE_SMTP_PASSWORD')
    ) { return error('Invalid SMTP settings'); }
    */

    $token = (new Utils())->CreateToken(array(
      'username' => $f3->get('username'), 
      'database' => $f3->get('database'),
      'algorithm' => getenv('NT_EXAMPLE_TOKEN_ALGORITHM'),
      'kid' => getenv('NT_TOKEN_PUBLIC_KID')
    ));

    $params = array(
      'key' => 'sendEmail', 
      'values' => array( 
        'provider' => 'smtp',
        'email' => array( 
          'from' => $body['values']['email_from'],
          'recipients' => array(
            array( 'email' => $body['values']['email_to'] ),
          ),
          'subject' => 'Thank you for your order', 
          'html' => '<p>Thank you for your order!</p><b>Please</b> note: ...',
          'attachments' => array(array( 
            'reportkey' =>  'ntr_invoice_en', 
            'nervatype' => 'trans', 
            'refnumber' => 'DMINV/00001' 
          ))
        )
      )
    );

    $result = $f3->get($f3->get('api_type'))->Function($token, $params);
    if($result['error']) {
      return error($result['error']);
    }

    header('Content-type: text/plain', true, 200);
    echo 'The message was successfully sent';
  }
}

?>