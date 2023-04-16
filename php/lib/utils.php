<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class Utils {
  public function CreateToken($params) {
    $private_key = file_get_contents(getenv('NT_EXAMPLE_TOKEN_PRIVATE_KEY'), true);
    $payload = [
      'iss' => getenv('NT_TOKEN_ISS'),
      'username' => $params['username'],
      'iat' => time(),
      'nbf' => time(),
      'exp' => time()+ ((int)getenv('NT_EXAMPLE_TOKEN_EXP') * 60)
    ];
    if(array_key_exists('database', $params)){
      $payload = array_merge($payload, array('database' => $params['database']));
    }
  
    $token = JWT::encode($payload, $private_key, $params['algorithm'], $params['kid']);
    return $token;
  }
}

?>