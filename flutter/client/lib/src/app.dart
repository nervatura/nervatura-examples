/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:services/services.dart'
    show clients, serviceFunctions, createToken;

import 'controllers/all_api.dart';
import 'controllers/client_login.dart';
import 'controllers/create_database.dart';
import 'controllers/create_invoice.dart';
import 'controllers/home.dart';
import 'controllers/password_login.dart';
import 'controllers/token_login.dart';
import 'widgets/all_api.dart';
import 'widgets/client_login.dart';
import 'widgets/create_database.dart';
import 'widgets/create_invoice.dart';
import 'widgets/home.dart';
import 'widgets/password_login.dart';
import 'widgets/token_login.dart';

class AppState with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final bool desktop;

  static const _host =
      String.fromEnvironment('NT_EXAMPLE_HOST', defaultValue: 'localhost');
  static const _port =
      String.fromEnvironment('NT_EXAMPLE_PORT', defaultValue: '8080');
  static const demoAlias = String.fromEnvironment('NT_ALIAS_DEMO');
  static const privateKey =
      String.fromEnvironment('NT_EXAMPLE_TOKEN_PRIVATE_KEY');
  static const publicKey = String.fromEnvironment('NT_TOKEN_PUBLIC_KEY');

  Map<String, String> env = {};
  final Map<String, bool> enabledService = {
    'cli': false,
    'cgo': false,
    'rpc': false,
    'http': false
  };

  final Map<String, bool> serverReady = {
    'ntura': false,
    'backend': false,
  };

  bool demoDb = false;

  String get serverHost => _host;
  String get serverPort => _port;

  AppState(this.desktop) {
    settingInit();
    if (desktop) {
      desktopConfig();
    } else {
      serverConfig(false);
    }
  }
  final Map<String, dynamic> _state = {
    'theme': 'light',
  };
  Map<String, dynamic> get state => _state;
  void setState(String key, dynamic value) {
    _state[key] = value;
    notifyListeners();
  }

  Future<void> setSetting(String key, dynamic value) async {
    final prefs = await _prefs;
    switch (dynamic.runtimeType) {
      case bool:
        prefs.setBool(key, value);
        break;
      case double:
        prefs.setDouble(key, value);
        break;
      case int:
        prefs.setInt(key, value);
        break;
      case List<String>:
        prefs.setStringList(key, value);
        break;
      default:
        prefs.setString(key, value.toString());
    }
  }

  dynamic getSetting(String key) async {
    final prefs = await _prefs;
    return prefs.get(key);
  }

  void settingInit() async {
    final prefs = await _prefs;
    _state['theme'] = (prefs.getString('theme') == null)
        ? _state['theme']
        : prefs.getString('theme').toString();
    notifyListeners();
  }

  void desktopConfig() async {
    env = Platform.environment;
    String envFile =
        (File('../.env').existsSync()) ? '../.env' : '../.env.example';
    await dotenv.load(fileName: File(envFile).absolute.path);
    env = dotenv.env;
    env.addAll(Platform.environment);

    env['NT_ALIAS_DEMO'] = demoAlias;
    env['NT_EXAMPLE_TOKEN_PRIVATE_KEY'] = privateKey;
    env['NT_TOKEN_PUBLIC_KEY'] = publicKey;

    if (env['NT_EXAMPLE_SERVICE_PATH'] == 'docker') {
      enabledService['cli'] = true;
    } else {
      enabledService['cgo'] =
          (Platform.environment['NT_TOKEN_PUBLIC_KEY'] != null) &&
              File(env['NT_EXAMPLE_SERVICE_LIB'].toString()).existsSync();
      enabledService['cli'] =
          File(env['NT_EXAMPLE_SERVICE_PATH'].toString()).existsSync();
    }
    String httpPort = env['NT_HTTP_PORT'].toString();
    try {
      final response =
          await http.get(Uri.parse('http://$_host:$httpPort/api/config'));
      if (response.statusCode == 200) {
        enabledService['http'] = true;
        enabledService['rpc'] = true;
        serverReady['ntura'] = true;
      }
    } catch (e) {
      enabledService['http'] = false;
      enabledService['rpc'] = false;
    }

    demoDb = File('../data/demo.db').existsSync();
    serverConfig(true);
    notifyListeners();
  }

  void serverConfig(bool isReady) async {
    final headers = {'Content-Type': 'application/json; charset=UTF-8'};
    String serviceUrl = 'http://$_host:$_port';
    try {
      final response = await http.get(Uri.parse(serviceUrl), headers: headers);
      if (response.statusCode == 200) {
        serverReady['backend'] = true;
        final result = jsonDecode(response.body);
        _state['loginCode'] = result['loginCode'];
        if (!isReady) {
          for (var ekey in result['env'].keys.toList()) {
            env[ekey] = result['env'][ekey].toString();
          }
          for (var skey in result['enabledService'].keys.toList()) {
            enabledService[skey] = result['enabledService'][skey];
          }
          demoDb = result['demoDb'];
          serverReady['backend'] = true;
          serverReady['ntura'] = result['enabledService']['http'];
        }
      }
    } catch (e) {
      //print(e);
    }
    notifyListeners();
  }

  Future<Map<String, dynamic>> serviceData(
      String apiType, String functionName, List<dynamic> args) async {
    if (!enabledService[apiType]!) {
      return {'error': 'disabled'};
    }

    Map<String, dynamic> result = {};

    if (!desktop) {
      try {
        final headers = {'Content-Type': 'application/json; charset=UTF-8'};
        String serviceUrl =
            'http://$_host:$_port/service/$apiType/$functionName';
        final response = await http.post(Uri.parse(serviceUrl),
            headers: headers, body: jsonEncode(args));
        if (response.statusCode == 200) {
          result = jsonDecode(response.body);
        } else {
          result = {'error': response.reasonPhrase.toString()};
        }
      } catch (err) {
        result = {'error': err};
      }
    } else {
      Map<String, String> conf = {
        'host': _host,
        'rpcPort': env['NT_GRPC_PORT'].toString(),
        'httpPort': env['NT_HTTP_PORT'].toString(),
        'servLib': env['NT_EXAMPLE_SERVICE_LIB'].toString(),
        'servPath': env['NT_EXAMPLE_SERVICE_PATH'].toString(),
        "NT_API_KEY": env['NT_API_KEY'].toString(),
        "NT_TOKEN_PUBLIC_KID": env['NT_TOKEN_PUBLIC_KID'].toString(),
        "NT_TOKEN_PUBLIC_KEY": env['NT_TOKEN_PUBLIC_KEY'].toString(),
        "NT_ALIAS_DEMO": env['NT_ALIAS_DEMO'].toString(),
      };
      final client = clients[apiType]!(conf);
      final clientFunc = serviceFunctions[functionName]!(client);
      result = (args.length == 1)
          ? await clientFunc(args[0])
          : await clientFunc(args[0], args[1]);
      await client.close();
    }

    return result;
  }

  Future<String> getToken(
      String username, String database, bool tokenCode) async {
    String token = '';
    if (desktop && !tokenCode) {
      String privateKey = '';
      if (File(env['NT_EXAMPLE_TOKEN_PRIVATE_KEY'].toString()).existsSync()) {
        privateKey = File(env['NT_EXAMPLE_TOKEN_PRIVATE_KEY'].toString())
            .readAsStringSync();
      }

      Map<String, String> params = {
        'username': username,
        'database': database,
        'issuer': env['NT_TOKEN_ISS'].toString(),
        'kid': env['NT_TOKEN_PUBLIC_KID'].toString(),
        'algorithm': env['NT_EXAMPLE_TOKEN_ALGORITHM'].toString(),
        'tokenExp': env['NT_EXAMPLE_TOKEN_EXP'].toString(),
        'privateKey': privateKey
      };
      token = createToken(params);
    } else {
      String serviceUrl = 'http://$_host:$_port/token';
      try {
        final response = await http.post(Uri.parse(serviceUrl),
            body: jsonEncode({
              'code': _state['loginCode'].toString(),
              'database': database,
              'username': username
            }));
        if (response.statusCode == 200) {
          final result = jsonDecode(response.body);
          token = (tokenCode) ? result['code'] : result['access_token'];
        }
      } catch (e) {
        /// print(e);
      }
    }
    return token;
  }
}

/// The Widget that configures your application.
class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    String theme = appState.state['theme'].toString();
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: (theme == 'dark') ? ThemeMode.dark : ThemeMode.light,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case CreateDatabaseWidget.routeName:
                return ChangeNotifierProvider(
                  create: (_) => CreateDatabaseController(context),
                  child: const CreateDatabaseWidget(),
                );
              case PasswordLoginWidget.routeName:
                return ChangeNotifierProvider(
                  create: (_) => PasswordLoginController(context),
                  child: const PasswordLoginWidget(),
                );
              case TokenLoginWidget.routeName:
                return ChangeNotifierProvider(
                  create: (_) => TokenLoginController(context),
                  child: const TokenLoginWidget(),
                );
              case ClientLoginWidget.routeName:
                return ChangeNotifierProvider(
                  create: (_) => ClientLoginController(context),
                  child: const ClientLoginWidget(),
                );
              case AllApiWidget.routeName:
                return ChangeNotifierProvider(
                  create: (_) => AllApiController(context),
                  child: const AllApiWidget(),
                );
              case CreateInvoiceWidget.routeName:
                return ChangeNotifierProvider(
                  create: (_) => CreateInvoiceController(context),
                  child: const CreateInvoiceWidget(),
                );
              case HomeWidget.routeName:
              default:
                return ChangeNotifierProvider(
                  create: (_) => HomeController(context),
                  child: const HomeWidget(),
                );
            }
          },
        );
      },
    );
  }
}
