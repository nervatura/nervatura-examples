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

class TokenLoginController with ChangeNotifier {
  final BuildContext context;

  TokenLoginController(this.context) {
    loc = AppLocalizations.of(context)!;
    app = context.watch<AppState>();
    _apiType = app.enabledService.keys.toList()[0];
  }
  late AppLocalizations loc;
  late AppState app;

  String labels(String key) {
    Map<String, String> labels = {
      'appTitle': loc.appTitle,
      'tokenLogin': loc.tokenLogin,
      'username': loc.username,
      'validate': loc.validate,
      'database': loc.database,
      'login': loc.login,
      'tokenLoginTitle': loc.tokenLoginTitle,
      'apiType': loc.apiType,
      'cli': 'CLI',
      'cgo': 'CGO',
      'rpc': 'GRPC',
      'http': 'HTTP'
    };
    return labels[key].toString();
  }

  String error = '';
  Map<String, dynamic> result = {};

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

  TextEditingController usernameCtr = TextEditingController(text: 'admin');
  String get username => usernameCtr.value.text;

  TextEditingController databaseCtr = TextEditingController(text: 'demo');
  String get database => databaseCtr.value.text;

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

  Future<void> onValidate() async {
    result = {};
    error = '';
    progress = true;

    final token = await app.getToken(username, database, false);
    Map<String, dynamic> login =
        await app.serviceData(apiType, 'tokenLogin', [token]);

    if (login.containsKey('error')) {
      error = (login['error'] == 'disabled')
          ? loc.disabledService
          : login['error'].toString();
    } else {
      result = login['result'];
    }
    notifyListeners();
    progress = false;
  }
}
