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

class HomeController with ChangeNotifier {
  final BuildContext context;

  HomeController(this.context) {
    loc = AppLocalizations.of(context)!;
    app = context.watch<AppState>();
  }

  late AppState app;
  late AppLocalizations loc;

  final List<Map<String, String>> items = [
    {
      'id': 'create_database',
      'title': 'createDatabase',
      'subtitle': 'missingDemo',
    },
    {'id': 'password_login', 'title': 'passwordLogin'},
    {'id': 'token_login', 'title': 'tokenLogin'},
    {'id': 'client_login', 'title': 'clientLogin'},
    {'id': 'external_token', 'title': 'externalToken'},
    {'id': 'client_config', 'title': 'clientConfig', 'enabled': 'backend'},
    {'id': 'create_invoice', 'title': 'createInvoice'},
    {'id': 'server_shortcuts', 'title': 'serverShortcuts'},
    {'id': 'csv_report', 'title': 'csvReport'},
    {'id': 'all_api', 'title': 'allApi'},
  ];

  String get theme => app.state['theme'].toString();
  Icon get themeIcon =>
      Icon((theme == 'light') ? Icons.shield_moon_outlined : Icons.sunny);

  String labels(String key) {
    Map<String, String> labels = {
      'appTitle': loc.appTitle,
      'createDatabase': loc.createDatabase,
      'missingDemo': app.demoDb ? '' : loc.missingDemo,
      'passwordLogin': loc.passwordLogin,
      'tokenLogin': loc.tokenLogin,
      'allApi': loc.allApi,
      'clientLogin': loc.clientLogin,
      'createInvoice': loc.createInvoice,
      'serverShortcuts': loc.serverShortcuts,
      'csvReport': loc.csvReport,
      'externalToken': loc.externalToken,
      'clientConfig': loc.clientConfig,
      'ntura': loc.ntura,
      'backend': loc.backend,
      'cli': 'CLI',
      'cgo': 'CGO',
      'rpc': 'GRPC',
      'http': 'HTTP'
    };
    return labels[key].toString();
  }

  bool itemEnabled(String id) {
    final item = items.where((element) => element['id'] == id).first;
    if (item.containsKey('enabled')) {
      return app.serverReady[item['enabled'].toString()] == true;
    }
    return true;
  }

  void onTheme() {
    if (theme == 'light') {
      app.setSetting('theme', 'dark');
      app.setState('theme', 'dark');
    } else {
      app.setSetting('theme', 'light');
      app.setState('theme', 'light');
    }
  }

  void onList(Map<String, String> item) {
    if (itemEnabled(item['id'].toString())) {
      if (item['id'] == 'client_config') {
        final url = 'http://${app.serverHost}:${app.serverPort}/client_config';
        app.showUrl(url);
      } else {
        Navigator.restorablePushNamed(
          context,
          item['id'].toString(),
        );
      }
    }
  }
}
