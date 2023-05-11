/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'src/app.dart';

void main() async {
  bool desktop = !kIsWeb;
  if (desktop) {
    desktop = Platform.isLinux || Platform.isWindows;
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(desktop),
      child: const App(),
    ),
  );
}
