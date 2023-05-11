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
import 'package:url_launcher/url_launcher.dart';

import '../app.dart';

class ClientLoginController with ChangeNotifier {
  final BuildContext context;

  ClientLoginController(this.context) {
    loc = AppLocalizations.of(context)!;
    app = context.watch<AppState>();
    logoutCtr.text = 'http://${app.serverHost}:${app.serverPort}/client_logout';
    tokenCtr.text = 'http://${app.serverHost}:${app.serverPort}/token';
  }
  late AppLocalizations loc;
  late AppState app;

  String labels(String key) {
    Map<String, String> labels = {
      'appTitle': loc.appTitle,
      'clientLogin': loc.clientLogin,
      'clientLoginTitle': loc.clientLoginTitle,
      'username': loc.username,
      'database': loc.database,
      'login': loc.login,
      'authorization': loc.authorization,
      'implicit': loc.implicit,
      "responseType": loc.responseType,
      'ntura': loc.ntura,
      'backend': loc.backend,
      'clientLogout': loc.clientLogout,
      'clientToken': loc.clientToken
    };
    return labels[key].toString();
  }

  String error = '';

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

  TextEditingController logoutCtr = TextEditingController(text: '');
  String get logout => logoutCtr.value.text;

  TextEditingController tokenCtr = TextEditingController(text: '');
  String get token => tokenCtr.value.text;

  String _responseType = 'implicit';
  String get responseType => _responseType;
  set apiType(String value) {
    _responseType = value;
    notifyListeners();
  }

  List<String> get response => ['authorization', 'implicit'];

  Future<void> onLogin() async {
    error = '';

    String url =
        'http://${app.serverHost}:${app.env['NT_HTTP_PORT'].toString()}/client';
    String logout = (logoutCtr.text != '') ? '&callback=${logoutCtr.text}' : '';

    if (_responseType == 'implicit') {
      final token = await app.getToken(username, database, false);
      url += '?#access_token=$token$logout';
    } else {
      final code = await app.getToken(username, database, true);
      url += '#code=$code&callback=${tokenCtr.text}&error=${logoutCtr.text}';
    }
    try {
      Uri uri = Uri.parse(url);
      if (!await launchUrl(uri)) {
        error = 'Could not launch $url';
      }
    } catch (err) {
      error = err.toString();
    }
    notifyListeners();
  }
}
