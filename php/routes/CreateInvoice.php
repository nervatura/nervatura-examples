<?php
/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

class CreateInvoice {
  function init($f3){
    $f3->set('title', 'Create a customer invoice');
    $f3->set('database', 'demo');
    $f3->set('username', 'admin');
    $f3->set('api_type', getenv('NT_EXAMPLE_DEFAULT_API'));
    $f3->set('error', NULL);
    $f3->set('result', NULL);
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
      'trans' => array(
        'transdate' => '2022-12-24',
        'duedate' => '2023-01-01',
        'ref_transnumber' => 'REFNUMBER',
        'curr' => 'EUR',
        'notes' => 'Example invoice',
        'fnote' => '<p>'
          .'CONTACT INFORMATION: contact@mail.com<br />'
          .'Telephone: 0123456789</p>',
        'keys' => array(
          'transnumber' => array(
            'numberdef', 'invoice_out'
          ),
          'customer_id' => 'EXAMPLE_CUSTOMER',
          'transtype' => 'invoice',
          'direction' => 'out',
          'paidtype' => 'transfer',
          'department' => 'sales',
          'transtate' => 'ok'
        )
      ),
      'customer' => array(
        'custnumber' => 'EXAMPLE_CUSTOMER',
        'custname' => 'Example Customer',
        'taxnumber' => 'TN0123456',
        'keys' => array(
          'custtype' => 'company'
        )
      ),
      'address' => array(array(
        'zipcode' => '01234', 
        'city' => 'City', 
        'street' => 'Street 123.'
      )),
      'contact'=> array(array(
        'firstname' => 'Firstname', 
        'surname' => 'Surname',
        'phone' => '0123456789',
        'email' => 'contact@mail.com'
      )),
      'items'=> array(array(
        'unit' => 'piece',
        'qty'=>3,
        'fxprice'=>166.67,
        'netamount'=>500,
        'discount'=>0,
        'vatamount'=>100,
        'amount'=>600,
        'description' => 'Big product',
        'keys' => array(
          'product_id' => 'DMPROD/00001',
          'tax_id' => '20%'
        )
      )),
    ));
  }

  function createInvoive($f3, $token){
    $data = $f3->get('data');
    $views = array(
      array( 'key' => 'customer',
        'text' => "select count(*) as anum from customer where custnumber=?",
        'values' => array($data['customer']['custnumber']) 
      ),
      array( 'key' => 'address',
        'text' => "select count(*) as anum from address a
          inner join groups g on a.nervatype=g.id and g.groupvalue='customer'
          inner join customer c on a.ref_id=c.id
          where c.custnumber=?",
        'values' => array($data['customer']['custnumber'])
      ),
      array( 'key' => 'contact',
        'text' => "select count(*) as anum from contact co
          inner join groups g on co.nervatype=g.id and g.groupvalue='customer'
          inner join customer c on co.ref_id=c.id
          where c.custnumber=?",
        'values' => array($data['customer']['custnumber'])
      )
    );
    $view_result = $f3->get($f3->get('api_type'))->View($token, $views);
    if($view_result['error']) {
      return $view_result;
    }

    if(array_key_exists('customer', $data)) {
      if ((int)$view_result['result']['customer'][0]['anum'] > 0) {
        // existing customer
        $data['customer']['keys']['id'] = $data['customer']['custnumber'];
      }
      $customer_result = $f3->get($f3->get('api_type'))->Update(
        $token, array(
          'nervatype' => 'customer', 
          'data' => array($data['customer'])
        )
      );
      if($customer_result['error']) {
        return $customer_result;
      }
    }

    if(array_key_exists('address', $data)) {
      if ((int)$view_result['result']['address'][0]['anum'] > 0) {
        // existing address
        $data['address'][0]['keys'] = array(
          'id' => 'customer/'.$data['customer']['custnumber'].'~1'
        );
      } else {
        // new address data
        $data['address'][0]['keys'] = array(
          'nervatype' => 'customer',
          'ref_id' => 'customer/'.$data['customer']['custnumber']
        );
      }
      $address_result = $f3->get($f3->get('api_type'))->Update(
        $token, array(
          'nervatype' => 'address', 
          'data' => $data['address']
        )
      );
      if($address_result['error']) {
        return $address_result;
      }
    }

    if(array_key_exists('contact', $data)) {
      if ((int)$view_result['result']['contact'][0]['anum'] > 0) {
        // existing contact
        $data['contact'][0]['keys'] = array(
          'id' => 'customer/'.$data['customer']['custnumber'].'~1'
        );
      } else {
        // new contact data
        $data['contact'][0]['keys'] = array(
          'nervatype' => 'customer',
          'ref_id' => 'customer/'.$data['customer']['custnumber']
        );
      }
      $contact_result = $f3->get($f3->get('api_type'))->Update(
        $token, array(
          'nervatype' => 'contact', 
          'data' => $data['contact']
        )
      );
      if($contact_result['error']) {
        return $contact_result;
      }
    }

    if(array_key_exists('trans', $data)) {
      $trans_result = $f3->get($f3->get('api_type'))->Update(
        $token, array(
          'nervatype' => 'trans', 
          'data' => array($data['trans'])
        )
      );
      if($trans_result['error']) {
        return $trans_result;
      }
    }

    if(array_key_exists('items', $data)) {
      foreach ($data['items'] as $key => $item) {
        $data['items'][$key]['trans_id'] = $trans_result['result'][0];
      }
      $item_result = $f3->get($f3->get('api_type'))->Update(
        $token, array(
          'nervatype' => 'item', 
          'data' => $data['items']
        )
      );
      if($item_result['error']) {
        return $item_result;
      }
    }

    return array(
      'result' => $trans_result['result'][0],
      'error' => NULL
    );
  }
  
  public function get($f3){
    $this->init($f3);
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
    $cache = \Cache::instance();
    $cache->set('invoice_token', $token);
    $result = $this->createInvoive($f3, $token);
    $f3->set('error', $result['error']);
    $f3->set('result', $result['result']);
    $this->sendResult($f3);
  }

  function sendResult($f3){
    $f3->set('content', 'create_invoice.html');
    echo Template::instance()->render('layout.html');
  }

  public function report($f3){
    $this->init($f3);
    $api_type = $f3->get('PARAMS.api_type');
    $trans_id = $f3->get('PARAMS.trans_id');
    $f3->set('api_type', $api_type);
    $f3->set('result', $trans_id);
    $params = array(
      'reportkey' => 'ntr_invoice_en',
      'orientation' => 'portrait',
      'size' => 'a4',
      'output' => 'base64',
      'nervatype' => 'trans',
      'refnumber' => '',
      'template' => '',
      'filters' => array('@id' => (int)$trans_id )
    );
    $cache = \Cache::instance();
    $invoice_token = $cache->get('invoice_token');
    if($invoice_token) {
      $result = $f3->get($f3->get('api_type'))->Report($invoice_token, $params);
      if($result['error']) {
        $f3->set('error', $result['error']);
        $this->sendResult($f3);
        return;
      }
      $content = $result['result'];
      if($api_type != 'http') {
        $content = $content['template'];
      }
      if (strpos($content, ',') !== false) {
        $content = explode(',', $content)[1];
      }
      header('Content-Description: File Transfer');
      header('Content-Type: application/pdf');
      header('Content-Disposition: attachment; filename="Invoice_'.$trans_id.'.pdf"');
      header('Content-Transfer-Encoding: binary');
      header('Accept-Ranges: bytes');
      $pdf = base64_decode(str_pad(strtr($content, '-_', '+/'), strlen($content) % 4, '=', STR_PAD_RIGHT));
      echo $pdf;
      return;
    }
    $f3->set('error', 'Missing token');
    $this->sendResult($f3);
  }
}

?>