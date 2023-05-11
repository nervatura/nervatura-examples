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

class ServerShortcutsController with ChangeNotifier {
  final BuildContext context;

  ServerShortcutsController(this.context) {
    loc = AppLocalizations.of(context)!;
    app = context.watch<AppState>();
    _apiType = app.enabledService.keys.toList()[0];
    _menuData['ui_menu'][0]['address'] =
        'http://${app.serverHost}:${app.serverPort}/server_shortcuts/homepage';
    _menuData['ui_menu'][1]['address'] =
        'http://${app.serverHost}:${app.serverPort}/server_shortcuts/email';
    menuCtr.text =
        const JsonEncoder.withIndent('  ').convert(_menuData['ui_menu']);
    fieldsCtr.text =
        const JsonEncoder.withIndent('  ').convert(_menuData['ui_menufields']);
    checkFunctions();
  }
  late AppLocalizations loc;
  late AppState app;

  String labels(String key) {
    Map<String, String> labels = {
      'appTitle': loc.appTitle,
      'serverShortcuts': loc.serverShortcuts,
      'username': loc.username,
      'create': loc.create,
      'database': loc.database,
      'apiType': loc.apiType,
      "menuExist": loc.menuExist,
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
          'NT_SMTP_HOST': app.env['NT_SMTP_HOST'].toString(),
          'NT_SMTP_PORT': app.env['NT_SMTP_PORT'].toString(),
          'NT_SMTP_USER': app.env['NT_SMTP_USER'].toString(),
          'NT_SMTP_PASSWORD': app.env['NT_SMTP_PASSWORD'].toString()
        }
      : {};

  final Map<String, dynamic> _menuData = {
    'ui_menu': [
      {
        'menukey': 'mnu_example_homepage',
        'description': 'External page - GET example',
        'funcname': 'homepage',
        'address': '',
        'keys': {'method': 'get'}
      },
      {
        'menukey': 'mnu_example_email',
        'description': 'Email sending - POST example',
        'funcname': 'email',
        'address': '',
        'keys': {'method': 'post'}
      },
    ],
    'ui_menufields': [
      {
        'fieldname': 'homepage_string',
        'description': 'String input',
        'orderby': 0,
        'keys': {'menu_id': 'mnu_example_homepage', 'fieldtype': 'string'}
      },
      {
        'fieldname': 'homepage_bool',
        'description': 'Bool input',
        'orderby': 1,
        'keys': {'menu_id': 'mnu_example_homepage', 'fieldtype': 'bool'}
      },
      {
        'fieldname': 'homepage_date',
        'description': 'Date input',
        'orderby': 2,
        'keys': {'menu_id': 'mnu_example_homepage', 'fieldtype': 'date'}
      },
      {
        'fieldname': 'homepage_integer',
        'description': 'Integer input',
        'orderby': 3,
        'keys': {'menu_id': 'mnu_example_homepage', 'fieldtype': 'integer'}
      },
      {
        'fieldname': 'homepage_float',
        'description': 'Float input',
        'orderby': 4,
        'keys': {'menu_id': 'mnu_example_homepage', 'fieldtype': 'float'}
      },
      {
        'fieldname': 'email_from',
        'description': 'Sender email',
        'orderby': 0,
        'keys': {'menu_id': 'mnu_example_email', 'fieldtype': 'string'}
      },
      {
        'fieldname': 'email_to',
        'description': 'Email address',
        'orderby': 1,
        'keys': {'menu_id': 'mnu_example_email', 'fieldtype': 'string'}
      },
    ],
  };

  TextEditingController usernameCtr = TextEditingController(text: 'admin');
  String get username => usernameCtr.value.text;

  TextEditingController databaseCtr = TextEditingController(text: 'demo');
  String get database => databaseCtr.value.text;

  TextEditingController menuCtr = TextEditingController(text: '');
  String get menu => menuCtr.value.text;

  TextEditingController fieldsCtr = TextEditingController(text: '');
  String get fields => fieldsCtr.value.text;

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

  String _invoiceId = '';
  String get invoiceId => _invoiceId;
  set invoiceId(String value) {
    _invoiceId = value;
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

    List<String> viewValues = ['mnu_example_homepage', 'mnu_example_email'];
    final views = [
      {
        'key': 'menu',
        'text': "select count(*) as anum from ui_menu where menukey in(?,?)",
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
      existing = (int.parse(viewsResult['result']['menu'][0]['anum']) > 0);
    }
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

    Map<String, dynamic> menu = _menuData;

    final token = await app.getToken(username, database, false);

    final menuResult = await app.serviceData(apiType, 'update', [
      token,
      {'nervatype': "ui_menu", 'data': menu['ui_menu']}
    ]);
    if (menuResult.containsKey('error')) {
      return errorResult(menuResult['error']);
    }

    final fieldsResult = await app.serviceData(apiType, 'update', [
      token,
      {'nervatype': "ui_menufields", 'data': menu['ui_menufields']}
    ]);
    if (fieldsResult.containsKey('error')) {
      return errorResult(fieldsResult['error']);
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
