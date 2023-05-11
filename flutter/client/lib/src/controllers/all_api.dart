/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../app.dart';

class AllApiController with ChangeNotifier {
  final BuildContext context;

  AllApiController(this.context) {
    loc = AppLocalizations.of(context)!;
    app = context.watch<AppState>();
    initResultList();
  }
  late AppLocalizations loc;
  late AppState app;

  String labels(String key) {
    Map<String, String> labels = {
      'appTitle': loc.appTitle,
      'allApi': loc.allApi,
      'create': loc.create,
      'start': loc.start,
      'state': loc.state,
      'funcName': loc.funcName,
      'apiType': loc.apiType,
      'all': loc.all,
      'disabled': loc.disabled,
      'returned': loc.returned,
      'username': loc.username,
      'database': loc.database,
      'cli': 'CLI',
      'cgo': 'CGO',
      'rpc': 'GRPC',
      'http': 'HTTP'
    };
    return labels[key].toString();
  }

  List<String> error = [];
  List<Map<String, dynamic>> funcList = [];

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

  final Map<String, dynamic Function(Map<String, String> params)> _exampleData =
      {
    'databaseCreate': (Map<String, String> params) => [
          params['apiKey'],
          {
            'database': params['database'],
            'alias': params['database'],
            'demo': true
          }
        ],
    'userLogin': (Map<String, String> params) => [
          {
            'username': params['username'],
            'password': '',
            'database': params['database']
          }
        ],
    'tokenRefresh': (Map<String, String> params) => [params['token']],
    'tokenLogin': (Map<String, String> params) => [params['token']],
    'userPassword': (Map<String, String> params) => [
          params['token'],
          {
            'username': 'guest',
            'password': 'Password_1234',
            'confirm': 'Password_1234',
            'custnumber': ''
          }
        ],
    'report': (Map<String, String> params) => [
          params['token'],
          {
            'output': 'pdf',
            'reportkey': 'ntr_invoice_en',
            'orientation': 'portrait',
            'size': 'a4',
            'nervatype': 'trans',
            'refnumber': 'DMINV/00001',
            'template': '',
            'filters': {'@id': 5}
          }
        ],
    'reportList': (Map<String, String> params) => [
          params['token'],
          {'label': ''}
        ],
    'reportDelete': (Map<String, String> params) => [
          params['token'],
          {'reportkey': 'ntr_employee_en'}
        ],
    'reportInstall': (Map<String, String> params) => [
          params['token'],
          {'reportkey': 'ntr_employee_en'}
        ],
    'function': (Map<String, String> params) => [
          params['token'],
          {
            'key': 'nextNumber',
            'values': {
              'numberkey': 'custnumber',
              'step': false,
              'insert_key': false,
            },
            'value': ''
          }
        ],
    'view': (Map<String, String> params) => [
          params['token'],
          {
            'data': [
              {
                'key': 'customers',
                'text':
                    "select c.id, ct.groupvalue as custtype, c.custnumber, c.custname from customer c inner join groups ct on c.custtype = ct.id where c.deleted = 0 and c.custnumber <> 'HOME'",
                'values': []
              }
            ]
          }
        ],
    'get': (Map<String, String> params) => [
          params['token'],
          {
            'nervatype': 'customer',
            'metadata': true,
            'filter': '',
            'ids': '2,4',
          }
        ],
    'update': (Map<String, String> params) => [
          params['token'],
          {
            'nervatype': 'address',
            'data': [
              {
                'keys': {
                  'nervatype': 'customer',
                  'ref_id': 'customer/DMCUST/00001'
                },
                'zipcode': '12345'
              }
            ],
          }
        ],
    'delete': (Map<String, String> params) => [
          params['token'],
          {'nervatype': 'address', 'key': 'customer/DMCUST/00001~1'}
        ]
  };

  void initResultList() {
    for (var apiKey in app.enabledService.keys.toList()) {
      for (var funcName in _exampleData.keys.toList()) {
        if (app.enabledService[apiKey] == false) {
          disabled += 1;
        }
        funcList.add({
          'apiKey': apiKey,
          'funcName': funcName,
          'state':
              (app.enabledService[apiKey] == true) ? 'enabled' : 'disabled',
          'enabled': app.enabledService[apiKey]
        });
      }
    }
  }

  Icon stateIcon(String state) {
    if (state == 'error') {
      return const Icon(Icons.close, color: Colors.red);
    }
    if (state == 'disabled') {
      return const Icon(Icons.cancel, color: Colors.brown);
    }
    if (state == 'ok') {
      return const Icon(Icons.check, color: Colors.green);
    }
    return const Icon(Icons.question_mark, color: Colors.orange);
  }

  int disabled = 0;

  int _returned = 0;
  int get returned => _returned;
  set apiType(int value) {
    _returned = value;
    notifyListeners();
  }

  bool _progress = false;
  bool get progress => _progress;
  set progress(bool value) {
    _progress = value;
    notifyListeners();
  }

  TextEditingController usernameCtr = TextEditingController(text: 'admin');
  String get username => usernameCtr.value.text;

  TextEditingController databaseCtr = TextEditingController(text: 'demo');
  String get database => databaseCtr.value.text;

  Future<void> onStart() async {
    error = [];
    _returned = 0;
    progress = true;

    final token = await app.getToken(username, database, false);
    for (var item in funcList) {
      if (item['enabled'] == true) {
        final apiKey = item['apiKey'].toString();
        final funcName = item['funcName'].toString();
        final result = await app.serviceData(
            apiKey,
            funcName,
            _exampleData[funcName]!({
              'username': username,
              'database': database,
              'token': token,
              'apiKey': app.env['NT_API_KEY'].toString()
            }));
        _returned += 1;
        if (result.containsKey('error')) {
          item['state'] = 'error';
          error.add('$apiKey - $funcName: ${result['error']}');
        } else {
          item['state'] = 'ok';
        }
        notifyListeners();
      }
    }
    progress = false;
  }
}
