<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

require(__DIR__.'/../vendor/autoload.php');
require(__DIR__.'/cli.php');
require(__DIR__.'/rest.php');
require(__DIR__.'/utils.php');

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../','.env.example');
$dotenv->load();

$token = (new Utils())->CreateToken(array(
  'username' => 'admin', 
  'database' => 'demo',
  'algorithm' => getenv('NT_EXAMPLE_TOKEN_ALGORITHM'),
  'kid' => getenv('NT_TOKEN_PUBLIC_KID')
));

$api_map = array(
  'cli' => new Cli(),
  'http' => new Rest(),
);
if(extension_loaded('grpc') || extension_loaded('php_grpc')){
  require(__DIR__.'/rpc.php');
  $api_map = array_merge($api_map, array('rpc' => new Rpc()));
}

$func_map = array(
  'UserLogin' => function($api) {
    return $api->UserLogin(array(
      'username' => 'admin',
      'password' => '',
      'database' => 'demo'
    ));
  },
  'TokenRefresh' => function($api, $token) {
    return $api->TokenRefresh($token);
  },
  'TokenLogin' => function($api, $token, $api_key) {
    if($api_key == 'http') {
      return $api->TokenValidate($token);
    }
    return $api->TokenLogin($token);
  },
  'UserPassword' => function($api, $token) {
    return $api->UserPassword($token, array(
      'username' => 'guest',
      'password' => 'Password_1234',
      'confirm' => 'Password_1234',
      'custnumber' => ''
    ));
  },
  'Report' => function($api, $token) {
    return $api->Report($token, array(
      'output' => 'pdf',
      'reportkey' => 'ntr_invoice_en',
      'orientation' => 'portrait',
      'size' => 'a4',
      'nervatype' => 'trans',
      'refnumber' => 'DMINV/00001',
      'template' => '', 'filters' => array( '@id' => 5 )
    ));
  },
  'ReportList' => function($api, $token) {
    return $api->ReportList($token, array(
      'label' => ''
    ));
  },
  'ReportDelete' => function($api, $token) {
    return $api->ReportDelete($token, array(
      'reportkey' => 'ntr_employee_en'
    ));
  },
  'ReportInstall' => function($api, $token) {
    return $api->ReportInstall($token, array(
      'reportkey' => 'ntr_employee_en'
    ));
  },
  'Function' => function($api, $token) {
    return $api->Function($token, array(
      'key' => 'nextNumber',
      'values' => array(
        'numberkey' => 'custnumber',
        'step' => false,
        'insert_key' => false,
      ),
      'value' => ''
    ));
  },
  'View' => function($api, $token) {
    return $api->View($token, 
    array(
      array(
        'key' => 'customers',
        'text' => "select c.id, ct.groupvalue as custtype, c.custnumber, c.custname from customer c inner join groups ct on c.custtype = ct.id where c.deleted = 0 and c.custnumber <> 'HOME'",
        'values' => array()
      )
    ));
  },
  'Get' => function($api, $token) {
    return $api->Get($token, array(
      'nervatype' => 'customer',
      'metadata' => true,
      'filter' => '',
      'ids' => '2,4',
    ));
  },
  'Update' => function($api, $token) {
    return $api->Update($token, 
    array(
      'nervatype' => 'address',
      'data' => array(
        array(
          'keys' => array(
            'nervatype' => 'customer',
            'ref_id' => 'customer/DMCUST/00001'
          ),
          'zipcode' => '12345'
        )
      )
    ));
  },
  'Delete' => function($api, $token) {
    return $api->Delete($token, array(
      'nervatype' => 'address',
      'key' => 'customer/DMCUST/00001~1'
    ));
  }
);

$result = $api_map['http']->DatabaseCreate(
  getenv('NT_API_KEY'), 
  array(
    'demo' => 'true',
    'alias' => 'demo'
  )
);
if($result['error'] != NULL) {
  echo 'DatabaseCreate error: '.$result['error'].PHP_EOL;
  return;
}
echo 'DatabaseCreate OK'.PHP_EOL;
echo '--------------------'.PHP_EOL;

foreach ($api_map as $api_key => $api) {
  $start_time = microtime(true);
  foreach ($func_map as $func_name => $func_test) {
    $result = $func_test($api, $token, $api_key);
    if($result['error'] != NULL) {
      echo $api_key.' '.$func_name.' error: '.$result['error'].PHP_EOL;
      return;
    }
    echo $api_key.' '.$func_name.' OK'.PHP_EOL;
  }
  $end_time = microtime(true);
  echo '--------------------'.PHP_EOL;
  echo $api_key.' time: '.(int)(($end_time-$start_time)*1000).PHP_EOL;
  echo '--------------------'.PHP_EOL;
}

?>