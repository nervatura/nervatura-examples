/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../app.dart';

class CreateInvoiceController with ChangeNotifier {
  final BuildContext context;

  CreateInvoiceController(this.context) {
    loc = AppLocalizations.of(context)!;
    app = context.watch<AppState>();
    _apiType = app.enabledService.keys.toList()[0];
    transCtr.text =
        const JsonEncoder.withIndent('  ').convert(_invoiceData['trans']);
    itemsCtr.text =
        const JsonEncoder.withIndent('  ').convert(_invoiceData['items']);
    customerCtr.text =
        const JsonEncoder.withIndent('  ').convert(_invoiceData['customer']);
    addressCtr.text =
        const JsonEncoder.withIndent('  ').convert(_invoiceData['address']);
    contactCtr.text =
        const JsonEncoder.withIndent('  ').convert(_invoiceData['contact']);
  }
  late AppLocalizations loc;
  late AppState app;

  String labels(String key) {
    Map<String, String> labels = {
      'appTitle': loc.appTitle,
      'createInvoice': loc.createInvoice,
      'username': loc.username,
      'create': loc.create,
      'database': loc.database,
      'apiType': loc.apiType,
      "invoiceDownload": loc.invoiceDownload,
      "newInvoice": loc.newInvoice,
      'ntura': loc.ntura,
      'backend': loc.backend,
      'cli': 'CLI',
      'cgo': 'CGO',
      'rpc': 'GRPC',
      'http': 'HTTP'
    };
    return labels[key].toString();
  }

  Map<String, String> get env => (app.env.isNotEmpty)
      ? {
          'NT_EXAMPLE_TOKEN_PRIVATE_KEY':
              app.env['NT_EXAMPLE_TOKEN_PRIVATE_KEY'].toString(),
          'NT_EXAMPLE_TOKEN_EXP': app.env['NT_EXAMPLE_TOKEN_EXP'].toString(),
          'NT_EXAMPLE_TOKEN_ALGORITHM':
              app.env['NT_EXAMPLE_TOKEN_ALGORITHM'].toString(),
          'NT_TOKEN_ISS': app.env['NT_TOKEN_ISS'].toString(),
          'NT_TOKEN_PUBLIC_KID': app.env['NT_TOKEN_PUBLIC_KID'].toString(),
          'NT_TOKEN_PUBLIC_KEY': app.env['NT_TOKEN_PUBLIC_KEY'].toString(),
          'NT_ALIAS_DEMO': app.env['NT_ALIAS_DEMO'].toString(),
        }
      : {};

  final Map<String, dynamic> _invoiceData = {
    'trans': {
      'transdate': '2022-12-24',
      'duedate': '2023-01-01',
      'ref_transnumber': 'REFNUMBER',
      'curr': 'EUR',
      'notes': 'Example invoice',
      'fnote':
          '<p>CONTACT INFORMATION: contact@mail.com<br />Telephone: 0123456789</p>',
      'keys': {
        'transnumber': ['numberdef', 'invoice_out'],
        'customer_id': 'EXAMPLE_CUSTOMER',
        'transtype': 'invoice',
        'direction': 'out',
        'paidtype': 'transfer',
        'department': 'sales',
        'transtate': 'ok'
      }
    },
    'customer': {
      'custnumber': 'EXAMPLE_CUSTOMER',
      'custname': 'Example Customer',
      'taxnumber': 'TN0123456',
      'keys': {'custtype': 'company'}
    },
    'address': [
      {'keys': {}, 'zipcode': '01234', 'city': 'City', 'street': 'Street 123.'}
    ],
    'contact': [
      {
        'keys': {},
        'firstname': 'Firstname',
        'surname': 'Surname',
        'phone': '0123456789',
        'email': 'contact@mail.com'
      }
    ],
    'items': [
      {
        'unit': 'piece',
        'qty': 3,
        'fxprice': 166.67,
        'netamount': 500,
        'discount': 0,
        'vatamount': 100,
        'amount': 600,
        'description': 'Big product',
        'keys': {'product_id': 'DMPROD/00001', 'tax_id': '20%'}
      }
    ],
  };

  TextEditingController usernameCtr = TextEditingController(text: 'admin');
  String get username => usernameCtr.value.text;

  TextEditingController databaseCtr = TextEditingController(text: 'demo');
  String get database => databaseCtr.value.text;

  TextEditingController transCtr = TextEditingController(text: '');
  String get trans => transCtr.value.text;

  TextEditingController itemsCtr = TextEditingController(text: '');
  String get items => itemsCtr.value.text;

  TextEditingController customerCtr = TextEditingController(text: '');
  String get customer => customerCtr.value.text;

  TextEditingController addressCtr = TextEditingController(text: '');
  String get address => addressCtr.value.text;

  TextEditingController contactCtr = TextEditingController(text: '');
  String get contact => contactCtr.value.text;

  late String _apiType;
  String get apiType => _apiType;
  set apiType(String value) {
    _apiType = value;
    notifyListeners();
  }

  bool _progress = false;
  bool get progress => _progress;
  set progress(bool value) {
    _progress = value;
    notifyListeners();
  }

  String _error = '';
  String get error => _error;
  set error(String value) {
    _error = value;
    notifyListeners();
  }

  String _invoiceId = '';
  String get invoiceId => _invoiceId;
  set invoiceId(String value) {
    _invoiceId = value;
    notifyListeners();
  }

  Future<void> onCreate() async {
    invoiceId = '';
    error = '';
    progress = true;

    void errorResult(String err) {
      error = err;
      progress = false;
    }

    if (app.enabledService[apiType] == false) {
      return errorResult(loc.disabledService);
    }

    Map<String, dynamic> invoice = _invoiceData;

    final token = await app.getToken(username, database, false);

    List<String> viewValues = [invoice['customer']['custnumber']];
    final views = [
      {
        'key': "customer",
        'text': "select count(*) as anum from customer where custnumber=?",
        'values': viewValues,
      },
      {
        'key': "address",
        'text': """select count(*) as anum 
            from address a 
            inner join groups g on a.nervatype=g.id and g.groupvalue='customer' 
            inner join customer c on a.ref_id=c.id 
            where c.custnumber=?""",
        'values': viewValues,
      },
      {
        'key': "contact",
        'text': """select count(*) as anum 
            from contact co 
            inner join groups g on co.nervatype=g.id and g.groupvalue='customer' 
            inner join customer c on co.ref_id=c.id 
            where c.custnumber=?""",
        'values': viewValues,
      }
    ];

    final viewsResult = await app.serviceData(apiType, 'view', [
      token,
      {'data': views}
    ]);

    if (viewsResult.containsKey('error')) {
      return errorResult(viewsResult['error']);
    }

    if (int.parse(viewsResult['result']['customer'][0]['anum']) > 0) {
      //existing customer
      invoice['customer']['keys']['id'] = invoice['customer']['custnumber'];
    }
    final customerResult = await app.serviceData(apiType, 'update', [
      token,
      {
        'nervatype': "customer",
        'data': [invoice['customer'] as Map<String, dynamic>]
      }
    ]);
    if (customerResult.containsKey('error')) {
      return errorResult(customerResult['error']);
    }

    if (int.parse(viewsResult['result']['address'][0]['anum']) > 0) {
      //existing address
      invoice['address'][0]
          ['keys'] = {'id': 'customer/${invoice['customer']['custnumber']}~1'};
    } else {
      // new address data
      invoice['address'][0]['keys'] = {
        'nervatype': 'customer',
        'ref_id': 'customer/${invoice['customer']['custnumber']}'
      };
    }
    final addressResult = await app.serviceData(apiType, 'update', [
      token,
      {'nervatype': "address", 'data': invoice['address']}
    ]);
    if (addressResult.containsKey('error')) {
      return errorResult(addressResult['error']);
    }

    if (int.parse(viewsResult['result']['contact'][0]['anum']) > 0) {
      //existing contact
      invoice['contact'][0]
          ['keys'] = {'id': 'customer/${invoice['customer']['custnumber']}~1'};
    } else {
      // new contact data
      invoice['contact'][0]['keys'] = {
        'nervatype': 'customer',
        'ref_id': 'customer/${invoice['customer']['custnumber']}'
      };
    }
    final contactResult = await app.serviceData(apiType, 'update', [
      token,
      {'nervatype': "contact", 'data': invoice['contact']}
    ]);
    if (contactResult.containsKey('error')) {
      return errorResult(contactResult['error']);
    }

    final transResult = await app.serviceData(apiType, 'update', [
      token,
      {
        'nervatype': "trans",
        'data': [invoice['trans'] as Map<String, dynamic>]
      }
    ]);
    if (transResult.containsKey('error')) {
      return errorResult(transResult['error']);
    }

    for (var item in invoice['items']) {
      item['trans_id'] = transResult['result'][0];
    }

    final itemsResult = await app.serviceData(apiType, 'update', [
      token,
      {'nervatype': "item", 'data': invoice['items']}
    ]);
    if (itemsResult.containsKey('error')) {
      return errorResult(itemsResult['error']);
    }

    invoiceId = transResult['result'][0].toString();
    progress = false;
  }

  Future<void> onPdf() async {
    error = '';
    String url =
        'http://${app.serverHost}:${app.serverPort}/invoice/$apiType/$database/$username/$invoiceId';
    error = await app.showUrl(url);
    notifyListeners();
  }
}
