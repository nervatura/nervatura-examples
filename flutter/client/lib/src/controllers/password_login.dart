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

class PasswordLoginController with ChangeNotifier {
  final BuildContext context;

  PasswordLoginController(this.context) {
    loc = AppLocalizations.of(context)!;
    app = context.watch<AppState>();
    _apiType = app.enabledService.keys.toList()[0];
  }
  late AppLocalizations loc;
  late AppState app;

  String labels(String key) {
    Map<String, String> labels = {
      'appTitle': loc.appTitle,
      'passwordLogin': loc.passwordLogin,
      'username': loc.username,
      'password': loc.password,
      'database': loc.database,
      'login': loc.login,
      'passwordLoginTitle': loc.passwordLoginTitle,
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
          'NT_PASSWORD_LOGIN': app.env['NT_PASSWORD_LOGIN'].toString(),
          'NT_ALIAS_DEMO': app.env['NT_ALIAS_DEMO'].toString(),
        }
      : {};

  TextEditingController usernameCtr = TextEditingController(text: 'admin');
  String get username => usernameCtr.value.text;

  TextEditingController passwordCtr = TextEditingController(text: '');
  String get password => passwordCtr.value.text;

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

  Future<void> onSignIn() async {
    result = {};
    error = '';
    progress = true;

    Map<String, dynamic> login = await app.serviceData(apiType, 'userLogin', [
      {'username': username, 'password': password, 'database': database}
    ]);

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
