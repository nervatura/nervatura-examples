<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

class Cli {
  function connect($arg){
    $command = array(getenv('NT_EXAMPLE_SERVICE_PATH'));
    if (getenv('NT_EXAMPLE_SERVICE_PATH') == 'docker') {
      $command = array('docker', 'exec', '-i', 'nervatura', '/nervatura');
    }
    $process = proc_open(
      array_merge($command, $arg), 
      array(0 => array('pipe', 'r'), 1 => array('pipe', 'w'), 2 => array('pipe', 'w')), 
      $pipes, __DIR__.'/..', getenv()
    );

    $result_str = ''; $error = '';
    if (is_resource($process)) {      
      fclose($pipes[0]);

      $result_str = stream_get_contents($pipes[1]);
      fclose($pipes[1]);

      $error = stream_get_contents($pipes[2]);
      fclose($pipes[2]);
      proc_close($process);
    }
    if ($error != '') {
      return array(
        'result'=>NULL,
        'error'=>$error
      );
    }
    $result_arr = explode(PHP_EOL, $result_str);
    $result = $result_arr[count($result_arr)-2];
    $result_map = json_decode($result, true);
    if ($result_map == NULL) {
      return array(
        'result'=>NULL,
        'error'=>$result
      );
    }
    if (is_array($result_map) && array_key_exists('code', $result_map) && ($result_map['code'] != 200) && ($result_map['code'] != 204)) {
      return array(
        'result'=>NULL,
        'error'=>$result_map['message'] 
      );
    }
    return array(
      'result'=>$result_map,
      'error'=>NULL
    );
  }

  function tokenOptions($key, $token, $oarg, $options){
    $data = json_encode($options);
    if ($data == NULL) {
      return array(
        'result'=>NULL,
        'error'=>'Invalid data'
      );
    }
    return $this->connect(array('-c', $key, $oarg, $data, '-t', $token));
  }

  public function DatabaseCreate($api_key, $options){
    $data = json_encode($options);
    if ($data == NULL) {
      return array(
        'result'=>NULL,
        'error'=>'Invalid data'
      );
    }
    return $this->connect(array('-c', 'DatabaseCreate', '-o', $data, '-k', $api_key));
  }

  public function UserLogin($options){
    $data = json_encode($options);
    if ($data == NULL) {
      return array(
        'result'=>NULL,
        'error'=>'Invalid data'
      );
    }
    return $this->connect(array('-c', 'UserLogin', '-o', $data));
  }

  public function TokenLogin($token){
    return $this->connect(array('-c', 'TokenLogin', '-t', $token));
  }

  public function TokenRefresh($token){
    return $this->connect(array('-c', 'TokenRefresh', '-t', $token));
  }

  public function TokenDecode($token){
    return $this->connect(array('-c', 'TokenDecode', '-t', $token));
  }

  public function UserPassword($token, $options){
    return $this->tokenOptions('UserPassword', $token, '-o', $options);
  }

  public function Delete($token, $options){
    return $this->tokenOptions('Delete', $token, '-o', $options);
  }

  public function Get($token, $options){
    return $this->tokenOptions('Get', $token, '-o', $options);
  }

  public function View($token, $data){
    return $this->tokenOptions('View', $token, '-d', $data);
  }

  public function Function($token, $options){
    return $this->tokenOptions('Function', $token, '-o', $options);
  }

  public function Update($token, $options){
    $data = json_encode($options['data']);
    if ($data == NULL) {
      return array(
        'result'=>NULL,
        'error'=>'Invalid data'
      );
    }
    return $this->connect(array('-c', 'Update', '-nt', $options['nervatype'], '-d', $data, '-t', $token));
  }

  public function Report($token, $options){
    return $this->tokenOptions('Report', $token, '-o', $options);
  }

  public function ReportList($token, $options){
    return $this->tokenOptions('ReportList', $token, '-o', $options);
  }

  public function ReportDelete($token, $options){
    return $this->tokenOptions('ReportDelete', $token, '-o', $options);
  }

  public function ReportInstall($token, $options){
    return $this->tokenOptions('ReportInstall', $token, '-o', $options);
  }
}

?>