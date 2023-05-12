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
import 'package:url_launcher/url_launcher.dart';

import '../app.dart';

class CsvReportController with ChangeNotifier {
  final BuildContext context;

  CsvReportController(this.context) {
    loc = AppLocalizations.of(context)!;
    app = context.watch<AppState>();
    _apiType = app.enabledService.keys.toList()[0];
    _reportData = {
      'ui_report': [
        {
          'reportkey': _reportTemplate['meta']['reportkey'],
          'repname': _reportTemplate['meta']['repname'],
          'description': _reportTemplate['meta']['description'],
          'label': _reportTemplate['meta']['label'],
          'report': jsonEncode(_reportTemplate),
          'keys': {
            'nervatype': _reportTemplate['meta']['nervatype'],
            'filetype': _reportTemplate['meta']['filetype']
          }
        }
      ]
    };
    reportCtr.text = const JsonEncoder.withIndent('  ').convert(_reportData);
    checkFunctions();
  }
  late AppLocalizations loc;
  late AppState app;

  String labels(String key) {
    Map<String, String> labels = {
      'appTitle': loc.appTitle,
      'csvReport': loc.csvReport,
      'username': loc.username,
      'create': loc.create,
      'database': loc.database,
      'apiType': loc.apiType,
      "reportExist": loc.reportExist,
      'ntura': loc.ntura,
      'backend': loc.backend,
      'clientOpen': loc.clientOpen,
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

  final Map<String, dynamic> _reportTemplate = {
    'meta': {
      'reportkey': 'csv_example_report',
      'nervatype': 'report',
      'repname': 'CSV Report Example',
      'description': 'Customer contacts',
      'label': 'Customer',
      'filetype': 'csv'
    },
    'details': [
      {
        'columns': [
          'custname',
          'firstname',
          'surname',
          'status',
          'phone',
          'email'
        ],
        'name': 'contact',
        'databind': 'contact'
      }
    ],
    'sources': {
      'contact': {
        'default':
            """select c.custname as custname, co.firstname as firstname, co.surname as surname, co.status as status, co.phone as phone, co.email as email
      from contact co
      inner join groups nt on co.nervatype=nt.id and nt.groupvalue='customer'
      inner join customer c on co.ref_id=c.id
      where co.deleted = 0 and c.deleted=0 @where_str"""
      }
    },
    'fields': {
      'custname': {
        'fieldtype': 'string',
        'wheretype': 'where',
        'description': 'Customer Name',
        'orderby': 0
      },
      'surname': {
        'fieldtype': 'string',
        'wheretype': 'where',
        'description': 'Contact Surname',
        'orderby': 1
      },
    },
    'data': {
      'labels': {
        'custname': 'Customer',
        'firstname': 'Firstname',
        'surname': 'surname',
        'status': 'Status',
        'phone': 'Phone',
        'email': 'Email'
      }
    }
  };

  Map<String, dynamic> _reportData = {};

  TextEditingController usernameCtr = TextEditingController(text: 'admin');
  String get username => usernameCtr.value.text;

  TextEditingController databaseCtr = TextEditingController(text: 'demo');
  String get database => databaseCtr.value.text;

  TextEditingController reportCtr = TextEditingController(text: '');
  String get menu => reportCtr.value.text;

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

  bool _existing = false;
  bool get existing => _existing;
  set existing(bool value) {
    _existing = value;
    notifyListeners();
  }

  String _error = '';
  String get error => _error;
  set error(String value) {
    _error = value;
    notifyListeners();
  }

  String validApi() {
    for (var srv in app.enabledService.entries) {
      if (srv.value) {
        return srv.key.toString();
      }
    }
    return '';
  }

  void checkFunctions() async {
    final api = validApi();
    if (api == '') {
      return;
    }
    final token = await app.getToken(username, database, false);

    List<String> viewValues = ['csv_example_report'];
    final views = [
      {
        'key': 'report',
        'text': "select count(*) as anum from ui_report where reportkey in(?)",
        'values': viewValues,
      },
    ];

    final viewsResult = await app.serviceData(apiType, 'view', [
      token,
      {'data': views}
    ]);

    if (viewsResult.containsKey('error')) {
      error = viewsResult['error'];
    } else {
      existing = (int.parse(viewsResult['result']['report'][0]['anum']) > 0);
    }
  }

  Future<void> onCreate() async {
    error = '';
    progress = true;

    void errorResult(String err) {
      error = err;
      progress = false;
    }

    if (app.enabledService[apiType] == false) {
      return errorResult(loc.disabledService);
    }

    Map<String, dynamic> report = _reportData;

    final token = await app.getToken(username, database, false);

    final menuResult = await app.serviceData(apiType, 'update', [
      token,
      {'nervatype': "ui_report", 'data': report['ui_report']}
    ]);
    if (menuResult.containsKey('error')) {
      return errorResult(menuResult['error']);
    }

    existing = true;
    progress = false;
  }

  Future<void> onClient() async {
    error = '';
    final token = await app.getToken(username, database, false);
    String url =
        'http://${app.serverHost}:${app.env['NT_HTTP_PORT'].toString()}/client?#access_token=$token';
    url += '&callback=http://${app.serverHost}:${app.serverPort}/client_logout';
    try {
      Uri uri = Uri.parse(url);
      if (!await launchUrl(uri)) {
        error = 'Could not launch $url';
      }
    } catch (err) {
      error = err.toString();
    }
  }
}
