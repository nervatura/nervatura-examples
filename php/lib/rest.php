<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

  class Rest {
    function request($method, $path, $token, $api_key, $options){
      $service_url = 'http://'.getenv('NT_EXAMPLE_HOST').':'.getenv('NT_HTTP_PORT').'/api'.$path;
      $header = array(
        'Content-Type: application/json',
        'Accept: application/json'
      );
      if ($token != '') {
        $header = array_merge($header, array('Authorization: Bearer '.$token));
      }
      if ($api_key != '') {
        $header = array_merge($header, array('X-API-Key: '.$api_key));
      }
      $params = array(
        'method'  => $method,
        'header' =>  $header,
        'ignore_errors' => true
      );
      if ($options != NULL) {
        $data = json_encode($options);
        if ($data == NULL) {
          return array(
            'result'=>NULL,
            'error'=>'Invalid data'
          );
        }
        $params = array_merge($params, array('content' => $data));
      }

      $result = \Web::instance()->request($service_url, $params);

      if($result['headers'][2] == 'Content-Type: application/pdf'){
        return array(
          'result' => $result['body'],
          'error' => NULL
        );
      }

      $response = json_decode($result['body'], true);
      if ($response == NULL) {
        if(str_contains($result['headers'][0], '204')){
          return array(
            'result' => NULL,
            'error' => NULL
          );
        }
        return array(
          'result' => NULL,
          'error' => $result['headers'][0]
        );
      }
      if (is_array($response) && array_key_exists('code', $response) && ($response['code'] != 200) && ($response['code'] != 204)) {
        return array(
          'result' => NULL,
          'error' => $response['message'] 
        );
      }
      if(str_contains($result['headers'][0], '200') || str_contains($result['headers'][0], '204')){
        return array(
          'result' => $response,
          'error' => NULL
        );
      }
      return array(
        'result' => NULL,
        'error' => $result['headers'][0]
      );
    }

    function error($f3) {
      return array(
        'result' => NULL,
        'error' => $f3->get('ERROR.text')
      );
    }

    public function DatabaseCreate($api_key, $options) {
      $path = '/database?alias='.$options['alias'].'&demo='.$options['demo'];
      return $this->request('POST', $path, '', $api_key, $options);
    }

    public function UserLogin($options){
      return $this->request('POST', '/auth/login', '', '', $options);
    }

    public function TokenRefresh($token){
      return $this->request('GET', '/auth/refresh', $token, '', NULL);
    }
    
    public function TokenValidate($token) {
      return $this->request('GET', '/auth/validate', $token, '', NULL);
    }

    public function UserPassword($token, $options){
      return $this->request('POST', '/auth/password', $token, '', $options);
    }

    public function Delete($token, $options){
      $path = '/'.$options['nervatype'];
      if (array_key_exists('id', $options)) {
        $path = $path.'?id='.$options['id'];
      } else if (array_key_exists('key', $options)) {
        $path = $path.'?key='.urlencode($options['key']);
      }
      return $this->request('DELETE', $path, $token, '', NULL);
    }

    public function Get($token, $options){
      $path = '/'.$options['nervatype'];
      if (array_key_exists('ids', $options) && is_array($options['ids'])){
        $path = $path.'/'.implode(',', $options['ids']);
      } else if (array_key_exists('ids', $options)){
        $path = $path.'/'.$options['ids'];
      } else {
        if (array_key_exists('metadata', $options) && ($options['metadata'] == true)) {
          $path = $path.'?metadata=true';
        } else {
          $path = $path.'?metadata=false';
        }
        if (array_key_exists('filter', $options)) {
          $path = $path.'&filter='.urlencode($options['filter']);
        }
      }
      return $this->request('GET', $path, $token, '', NULL);
    }
    
    public function View($token, $data) {
      return $this->request('POST', '/view', $token, '', $data);
    }
    
    public function Function($token, $options) {
      return $this->request('POST', '/function', $token, '', $options);
    }
    
    public function Update($token, $options) {
      return $this->request('POST', '/'.$options['nervatype'], $token, '', $options['data']);
    }

    public function Report($token, $options) {
      $path = '/report?filters[@id]='.$options['filters']['@id'];
      $path = $path.'&reportkey='.$options['reportkey'];
      $path = $path.'&orientation='.$options['orientation'];
      $path = $path.'&size='.$options['size'];
      $path = $path.'&output='.$options['output'];
      if (array_key_exists('nervatype', $options)){
        $path = $path.'&nervatype='.$options['nervatype'];
      }
      return $this->request('GET', $path, $token, '', NULL);
    }

    public function ReportList($token, $options){
      $path = '/report/list';
      if (array_key_exists('label', $options)) {
        $path = $path.'?label='.urlencode($options['label']);
      }
      return $this->request('GET', $path, $token, '', NULL);
    }

    public function ReportDelete($token, $options){
      $path = '/report/delete';
      if (array_key_exists('reportkey', $options)) {
        $path = $path.'?reportkey='.urlencode($options['reportkey']);
      }
      return $this->request('DELETE', $path, $token, '', NULL);
    }

    public function ReportInstall($token, $options){
      $path = '/report/install';
      if (array_key_exists('reportkey', $options)) {
        $path = $path.'?reportkey='.urlencode($options['reportkey']);
      }
      return $this->request('POST', $path, $token, '', NULL);
    }
  }
?>