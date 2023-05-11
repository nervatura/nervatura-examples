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

class CreateDatabaseController with ChangeNotifier {
  final BuildContext context;

  CreateDatabaseController(this.context) {
    loc = AppLocalizations.of(context)!;
    app = context.watch<AppState>();
    _apiType = app.enabledService.keys.toList()[0];
  }

  late AppState app;
  late AppLocalizations loc;

  String labels(String key) {
    Map<String, String> labels = {
      'appTitle': loc.appTitle,
      'createDatabase': loc.createDatabase,
      'createDatabaseTitle': loc.createDatabaseTitle,
      'alias': loc.alias,
      'apiKey': loc.apiKey,
      'demo': loc.demo,
      'create': loc.create,
      'apiType': loc.apiType,
      'stamp': loc.stamp,
      'info': loc.info,
      'result': loc.result,
      'cli': 'CLI',
      'cgo': 'CGO',
      'rpc': 'GRPC',
      'http': 'HTTP'
    };
    return labels[key].toString();
  }

  String error = '';
  List<Map<String, dynamic>> result = [];

  Map<String, String> get env => (app.env.isNotEmpty)
      ? {
          'NT_API_KEY': app.env['NT_API_KEY'].toString(),
          'NT_ALIAS_DEMO': app.env['NT_ALIAS_DEMO'].toString(),
        }
      : {};

  TextEditingController apiKeyCtr =
      TextEditingController(text: 'EXAMPLE_API_KEY');
  String get apiKey => apiKeyCtr.value.text;

  TextEditingController aliasCtr = TextEditingController(text: 'demo');
  String get alias => aliasCtr.value.text;

  bool _demo = true;
  bool get demo => _demo;
  set demo(bool value) {
    _demo = value;
    notifyListeners();
  }

  bool _progress = false;
  bool get progress => _progress;
  set progress(bool value) {
    _progress = value;
    notifyListeners();
  }

  late String _apiType;
  String get apiType => _apiType;
  set apiType(String value) {
    _apiType = value;
    notifyListeners();
  }

  Future<void> onCreate() async {
    result = [];
    error = '';
    progress = true;

    Map<String, dynamic> data =
        await app.serviceData(apiType, 'databaseCreate', [
      apiKey,
      {'database': alias, 'alias': alias, 'demo': demo}
    ]);

    if (data.containsKey('error')) {
      error = (data['error'] == 'disabled')
          ? loc.disabledService
          : data['error'].toString();
    } else {
      for (var row in data['result']) {
        result.add({
          'stamp': row['stamp'],
          'info': row.containsKey('datatype')
              ? row['datatype']
              : row.containsKey('section')
                  ? row['section']
                  : row['state'],
          'result': row.containsKey('result')
              ? row['result'].toString().replaceAll(',', ', ')
              : row['message'],
        });
      }
    }
    notifyListeners();
    progress = false;
  }
}
