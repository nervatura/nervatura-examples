<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

class CsvReport {
  private $report_data = array(
    'meta' => array(
      'reportkey' => 'csv_example_report',
      'nervatype' => 'report',
      'repname' => 'CSV Report Example',
      'description' => 'Customer contacts',
      'label' => 'Customer',
      'filetype' => 'csv'
    ),
    'details' => array(
      array(
        'columns' => array(
          'custname', 'firstname', 'surname', 'status', 'phone', 'email'
        ),
        'name' => 'contact',
        'databind' => 'contact'
      )
    ),
    'sources' => array(
      'contact' => array(
        'default' => "select c.custname as custname, co.firstname as firstname, co.surname as surname, co.status as status, co.phone as phone, co.email as email
        from contact co
        inner join groups nt on co.nervatype=nt.id and nt.groupvalue='customer'
        inner join customer c on co.ref_id=c.id
        where co.deleted = 0 and c.deleted=0 @where_str"
      )
    ),
    'fields' => array(
      'custname' => array(
        'fieldtype' => 'string', 'wheretype' => 'where', 'description' => 'Customer Name', 'orderby' => 0
      ),
      'surname' => array(
        'fieldtype' => 'string', 'wheretype' => 'where', 'description' => 'Contact Surname', 'orderby' => 1
      ),
    ),
    'data' => array(
      'labels' => array(
        'custname' => 'Customer', 'firstname' => 'Firstname', 'surname' => 'surname', 
        'status' => 'Status', 'phone' => 'Phone', 'email' => 'Email'
      )
    )
  );

  function init($f3){
    $f3->set('title', 'CSV Report Example');
    $f3->set('database', 'demo');
    $f3->set('username', 'admin');
    $f3->set('api_type', getenv('NT_EXAMPLE_DEFAULT_API'));
    $f3->set('error', NULL);
    $f3->set('exists', NULL);
    $f3->set('client_url', '');
    $f3->set('env', array(
      'NT_EXAMPLE_TOKEN_PRIVATE_KEY' => getenv('NT_EXAMPLE_TOKEN_PRIVATE_KEY'),
      'NT_EXAMPLE_TOKEN_EXP' => getenv('NT_EXAMPLE_TOKEN_EXP'),
      'NT_EXAMPLE_TOKEN_ALGORITHM' => getenv('NT_EXAMPLE_TOKEN_ALGORITHM'),
      'NT_TOKEN_ISS' => getenv('NT_TOKEN_ISS'),
      'NT_TOKEN_PUBLIC_KID' => getenv('NT_TOKEN_PUBLIC_KID'),
      'NT_TOKEN_PUBLIC_KEY' => getenv('NT_TOKEN_PUBLIC_KEY'),
      'NT_ALIAS_DEMO' => getenv('NT_ALIAS_DEMO')
    ));
    $f3->set('data', array(
      'ui_report' => array(
        array( 'reportkey' => $this->report_data['meta']['reportkey'],
          'repname' => $this->report_data['meta']['repname'],
          'description' => $this->report_data['meta']['description'],
          'label' => $this->report_data['meta']['label'],
          'report' => json_encode($this->report_data),
          'keys' => array(
            'nervatype' => $this->report_data['meta']['nervatype'],
            'filetype' => $this->report_data['meta']['filetype']
          )
        )
      )
    ));
  }

  function checkFunctions($f3, $token) {
    $views = array(
      array('key' => 'report',
        'text' => 'select count(*) as anum from ui_report where reportkey in(?)',
        'values' => array('csv_example_report') 
      )
    );
    $view_result = $f3->get($f3->get('api_type'))->View($token, $views);
    if($view_result['error']) {
      return false;
    }
    return (bool)((int)$view_result['result']['report'][0]['anum'] > 0);
  }

  function createReport($f3, $token) {
    $data = $f3->get('data');
    $result = $f3->get($f3->get('api_type'))->Update(
      $token, array('nervatype' => 'ui_report', 'data' => $data['ui_report'])
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
      $result = $this->createReport($f3, $token);
      if($result['error']) {
        $f3->set('error', $result['error']);
        $f3->set('exists', false);
        $f3->set('client_url', '');
      }
    }
    $this->sendResult($f3);
  }

  function sendResult($f3){
    $f3->set('content', 'csv_report.html');
    echo Template::instance()->render('layout.html');
  }
}

?>