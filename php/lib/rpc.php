<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

class Rpc {
  function client(){
    return new Nervatura\APIClient('localhost:'.getenv('NT_GRPC_PORT'), [
      'credentials' => Grpc\ChannelCredentials::createInsecure(),
    ]);
  }

  function decodeValue($values) {
    $item = array();
    foreach ($values as $key => $value) {
      if($value->getValue() == 'boolean'){
        $item = array_merge($item, array($key => $value->getBoolean()));
      } else if($value->getValue() == 'number'){
        $item = array_merge($item, array($key => $value->getNumber()));
      } else if($value->getText() == 'null') {
        $item = array_merge($item, array($key => NULL));
      } else {
        $item = array_merge($item, array($key => $value->getText()));
      }
    }
    return $item;
  }

  function encodeValue($value) {
    $rpcValue = new Nervatura\Value();
    switch (gettype($value)) {
      case 'boolean':
        $rpcValue->setBoolean($value);
        break;

      case 'integer':
      case 'double':
        $rpcValue->setNumber($value);
        break;
      
      case 'array':
        $rpcValue->setText(implode(',', $value));
        break;
      
      default:
        $rpcValue->setText(strval($value));
        break;
    }
    return $rpcValue;
  }

  function mapValue($values) {
    $item = array();
    foreach ($values as $key => $value) {
      $item = array_merge($item, array($key => $this->encodeValue($value)));
    }
    return $item;
  }

  function checkValue($values) {
    foreach ($values as $key => $value) {
      switch (gettype($value)) {
        case 'boolean':
        case 'integer':
        case 'double':
        case 'string':
          break;

        case 'array':
          if(is_array($value) && !is_numeric(implode("", array_keys($value)))){
            return false;
          };
          break;
        
        default:
          return false;
      }
    }
    return true;
  }

  public function DatabaseCreate($api_key, $options){
    $metadata = ['x-api-key' => [$api_key]];
    $options['demo'] = ($options['demo'] == 'true');
    $request = new Nervatura\RequestDatabaseCreate($options);
    list($response, $status) = $this->client()->DatabaseCreate($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    $result = array();
    $items = $response->getDetails()->getItems();
    foreach ($items as $key => $value) {
      array_push($result, $this->decodeValue($value->getValues()));
    }
    return array(
      'result' => $result,
      'error' => NULL
    );
  }

  public function UserLogin($options){
    $request = new Nervatura\RequestUserLogin($options);
    list($response, $status) = $this->client()->UserLogin($request)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    return array(
      'result' => array(
        'engine' => $response->getEngine(),
        'version' => $response->getVersion(),
        'token' => $response->getToken()
      ),
      'error' => NULL
    );
  }

  public function TokenLogin($token){
    $metadata = ['authorization' => ['Bearer '.$token]];
    $request = new Nervatura\RequestEmpty();
    list($response, $status) = $this->client()->TokenLogin($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    return array(
      'result' => array(
        'id' => $response->getId(),
        'username' => $response->getUsername(),
        'empnumber' => $response->getEmpnumber(),
        'usergroup' => $response->getUsergroup(),
        'scope' => $response->getScope(),
        'department' => $response->getDepartment()
      ),
      'error' => NULL
    );
  }

  public function TokenRefresh($token){
    $metadata = ['authorization' => ['Bearer '.$token]];
    $request = new Nervatura\RequestEmpty();
    list($response, $status) = $this->client()->TokenRefresh($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    return array(
      'result' => array(
        'token' => $response->getValue()
      ),
      'error' => NULL
    );
  }

  public function UserPassword($token, $options){
    $metadata = ['authorization' => ['Bearer '.$token]];
    $request = new Nervatura\RequestUserPassword($options);
    list($response, $status) = $this->client()->UserPassword($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    return array(
      'result' => NULL,
      'error' => NULL
    );
  }

  public function Report($token, $options){
    function output($output_name) {
      switch ($output_name) {
        case 'print':
        case 'auto':
        case 'pdf':
          return 3;
        default:
          return (new Nervatura\ReportOutput())->value($output_name);
      }
    }
    $metadata = ['authorization' => ['Bearer '.$token]];
    $request = new Nervatura\RequestReport(array(
      'reportkey' => $options['reportkey'],
      'orientation' => (new Nervatura\ReportOrientation())->value($options['orientation']),
      'size' => (new Nervatura\ReportSize())->value($options['size']),
      'output' => output($options['output']),
      'type' => (new Nervatura\ReportType())->value('report_'.$options['nervatype']),
      'refnumber' => $options['refnumber'],
      'template' => $options['template'],
      'filters' => $this->mapValue($options['filters'])
    ));
    list($response, $status) = $this->client()->Report($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    return array(
      'result' => json_decode($response->getValue(), true),
      'error' => NULL
    );
  }

  public function ReportList($token, $options){
    $metadata = ['authorization' => ['Bearer '.$token]];
    $request = new Nervatura\RequestReportList($options);
    list($response, $status) = $this->client()->ReportList($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    $result = array();
    $items = $response->getItems();
    foreach ($items as $key => $value) {
      array_push($result, array(
        'reportkey' => $value->getReportkey(),
        'repname' => $value->getRepname(),
        'description' => $value->getDescription(),
        'label' => $value->getLabel(),
        'reptype' => $value->getReptype(),
        'filename' => $value->getFilename(),
        'installed' => $value->getInstalled()
      ));
    }
    return array(
      'result' => $result,
      'error' => NULL
    );
  }

  public function ReportInstall($token, $options){
    $metadata = ['authorization' => ['Bearer '.$token]];
    $request = new Nervatura\RequestReportInstall($options);
    list($response, $status) = $this->client()->ReportInstall($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    return array(
      'result' => array(
        'id' => $response->getId()
      ),
      'error' => NULL
    );
  }

  public function ReportDelete($token, $options){
    $metadata = ['authorization' => ['Bearer '.$token]];
    $request = new Nervatura\RequestReportDelete($options);
    list($response, $status) = $this->client()->ReportDelete($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    return array(
      'result' => NULL,
      'error' => NULL
    );
  }

  public function Function($token, $options){
    $metadata = ['authorization' => ['Bearer '.$token]];
    $value = ''; $values = array();
    if(array_key_exists('values', $options)){
      if ($this->checkValue($options['values'])) {
        $values = $this->mapValue($options['values']);
      } else {
        $value = json_encode($options['values']);
      }
    }
    $request = new Nervatura\RequestFunction(array(
      'key' => $options['key'],
      'value' => $value,
      'values' => $values,
    ));
    list($response, $status) = $this->client()->Function($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    return array(
      'result' => json_decode($response->getValue(), true),
      'error' => NULL
    );
  }

  public function View($token, $data){
    $metadata = ['authorization' => ['Bearer '.$token]];
    $rpcOptions = array();
    foreach ($data as $ikey => $item) {
      $values = array();
      foreach ($item['values'] as $key => $value) {
        array_push($values, $this->encodeValue($value));
      }
      array_push($rpcOptions, new Nervatura\RequestView\Query(array(
        'key' => $item['key'],
        'text' => $item['text'],
        'values' => $values
      )));
    }
    $request = new Nervatura\RequestView(array(
      'options' => $rpcOptions
    ));
    list($response, $status) = $this->client()->View($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    $result = array();
    foreach ($response->getValues() as $ikey => $item) {
      $items = array();
      foreach ($item->getItems() as $vkey => $value) {
        array_push($items, $this->decodeValue($value->getValues()));
      }
      $result = array_merge($result, array($ikey => $items));
    }
    return array(
      'result' => $result,
      'error' => NULL
    );
  }

  public function Get($token, $options){
    $metadata = ['authorization' => ['Bearer '.$token]];
    $rpcOptions = array(
      'nervatype' => (new Nervatura\DataType())->value($options['nervatype'])
    );
    if(array_key_exists('metadata', $options)){
      $rpcOptions = array_merge($rpcOptions, array('metadata' => $options['metadata']));
    }
    if(array_key_exists('ids', $options)){
      if(!is_array($options['ids'])) {
        $rpcOptions = array_merge($rpcOptions, 
          array('ids' => json_decode('['.$options['ids'].']'))
        );
      } else {
        $rpcOptions = array_merge($rpcOptions, array('ids' => $options['ids']));
      }
    }
    if(array_key_exists('filter', $options)){
      $rpcOptions = array_merge($rpcOptions, array('filter' => explode('|', $options['filter'])));
    }
    $request = new Nervatura\RequestGet($rpcOptions);
    list($response, $status) = $this->client()->Get($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    $result = array();
    foreach ($response->getValues() as $mkey => $item) {
      array_push($result, json_decode($item->serializeToJsonString(),true)[$item->getValue()]);
    }
    return array(
      'result' => $result,
      'error' => NULL
    );
  }

  public function Update($token, $options){
    $metadata = ['authorization' => ['Bearer '.$token]];
    $items = array();
    foreach ($options['data'] as $rkey => $row) {
      $item = new Nervatura\RequestUpdate\Item();
      $values = array();
      foreach ($row as $key => $value) {
        if($key == 'keys') {
          $item->setKeys($this->mapValue($value));
        } else {
          $values = array_merge($values, array($key => $this->encodeValue($value)));
        }
      }
      $item->setValues($values);
      array_push($items, $item);
    }
    $request = new Nervatura\RequestUpdate(array(
      'nervatype' => (new Nervatura\DataType())->value($options['nervatype']),
      'items' => $items
    ));
    list($response, $status) = $this->client()->Update($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    $result = array();
    foreach ($response->getValues() as $key => $id) {
      array_push($result, $id);
    }
    return array(
      'result' => $result,
      'error' => NULL
    );
  }

  public function Delete($token, $options){
    $metadata = ['authorization' => ['Bearer '.$token]];
    $rpcOptions = array(
      'nervatype' => (new Nervatura\DataType())->value($options['nervatype'])
    );
    if(array_key_exists('id', $options)){
      $rpcOptions = array_merge($rpcOptions, array('id' => $options['id']));
    }
    if(array_key_exists('key', $options)){
      $rpcOptions = array_merge($rpcOptions, array('key' => $options['key']));
    }
    $request = new Nervatura\RequestDelete($rpcOptions);
    list($response, $status) = $this->client()->Delete($request, $metadata)->wait();
    if ($status->code !== Grpc\STATUS_OK) {
      return array(
        'result' => NULL,
        'error' => $status->details
      );
    }
    return array(
      'result' => NULL,
      'error' => NULL
    );
  }

}

?>