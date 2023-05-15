/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:http/http.dart' as http;

import 'package:dotenv/dotenv.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

import 'package:services/services.dart'
    show clients, serviceFunctions, createToken;

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..post('/service/<api>/<func>', _serviceHandler)
  ..post('/token', _tokenHandler)
  ..get('/client_logout', _clientLogoutHandler)
  ..get('/server_shortcuts/homepage', _homepageHandler)
  ..post('/server_shortcuts/email', _emailHandler)
  ..get('/invoice/<api>/<database>/<username>/<id>', _invoiceHandler)
  ..get('/client_config', _clientConfigHandler)
  ..get('/code', _clientCodeHandler);

late DotEnv env;
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
String loginCode = '';
Map<String, String> codeMap = {};

String _host = InternetAddress.anyIPv4.host;
int _port = 8080;

Map<String, String> get conf => {
      'host': InternetAddress.anyIPv4.host,
      'rpcPort': env['NT_GRPC_PORT'].toString(),
      'httpPort': env['NT_HTTP_PORT'].toString(),
      'servLib': env['NT_EXAMPLE_SERVICE_LIB'].toString(),
      'servPath': env['NT_EXAMPLE_SERVICE_PATH'].toString(),
      'NT_API_KEY': env['NT_API_KEY'].toString(),
      'NT_TOKEN_PUBLIC_KID': env['NT_TOKEN_PUBLIC_KID'].toString(),
      'NT_TOKEN_PUBLIC_KEY': env['NT_TOKEN_PUBLIC_KEY'].toString()
    };

String get privateKey => (File(env['NT_EXAMPLE_TOKEN_PRIVATE_KEY'].toString())
        .existsSync())
    ? File(env['NT_EXAMPLE_TOKEN_PRIVATE_KEY'].toString()).readAsStringSync()
    : '';

Map<String, String> tokenParams(String database, String username) => {
      'username': username,
      'database': database,
      'issuer': env['NT_TOKEN_ISS'].toString(),
      'kid': env['NT_TOKEN_PUBLIC_KID'].toString(),
      'algorithm': env['NT_EXAMPLE_TOKEN_ALGORITHM'].toString(),
      'tokenExp': env['NT_EXAMPLE_TOKEN_EXP'].toString(),
      'privateKey': privateKey
    };

Future<Response> _rootHandler(Request req) async {
  Map<String, dynamic> result = {
    'loginCode': loginCode,
    'enabledService': {'cli': false, 'cgo': false, 'rpc': false, 'http': false},
    'env': {
      'NT_EXAMPLE_HOST': _host,
      'NT_EXAMPLE_PORT': _port,
      'NT_EXAMPLE_TOKEN_PRIVATE_KEY':
          env['NT_EXAMPLE_TOKEN_PRIVATE_KEY'].toString(),
      'NT_EXAMPLE_TOKEN_EXP': env['NT_EXAMPLE_TOKEN_EXP'].toString(),
      'NT_EXAMPLE_TOKEN_ALGORITHM':
          env['NT_EXAMPLE_TOKEN_ALGORITHM'].toString(),
      'NT_HTTP_PORT': env['NT_HTTP_PORT'].toString(),
      'NT_API_KEY': env['NT_API_KEY'].toString(),
      'NT_PASSWORD_LOGIN': env['NT_PASSWORD_LOGIN'].toString(),
      'NT_TOKEN_ISS': env['NT_TOKEN_ISS'].toString(),
      'NT_TOKEN_PUBLIC_KID': env['NT_TOKEN_PUBLIC_KID'].toString(),
      'NT_TOKEN_PUBLIC_KEY': env['NT_TOKEN_PUBLIC_KEY'].toString(),
      'NT_TOKEN_PUBLIC_KEY_URL': env['NT_TOKEN_PUBLIC_KEY_URL'].toString(),
      'NT_ALIAS_DEMO': env['NT_ALIAS_DEMO'].toString(),
      'NT_CLIENT_CONFIG': env['NT_CLIENT_CONFIG'].toString(),
      'NT_SMTP_HOST': env['NT_SMTP_HOST'].toString(),
      'NT_SMTP_PORT': env['NT_SMTP_PORT'].toString(),
      'NT_SMTP_USER': env['NT_SMTP_USER'].toString(),
      'NT_SMTP_PASSWORD': env['NT_SMTP_PASSWORD'].toString(),
    }
  };
  if (env['NT_EXAMPLE_SERVICE_PATH'] == 'docker') {
    result['enabledService']['cli'] = true;
  } else {
    result['enabledService']['cgo'] =
        File(env['NT_EXAMPLE_SERVICE_LIB'].toString()).existsSync();
    result['enabledService']['cli'] =
        File(env['NT_EXAMPLE_SERVICE_PATH'].toString()).existsSync();
  }
  result['demoDb'] = File('data/demo.db').existsSync();

  String host = InternetAddress.anyIPv4.host;
  String port = env['NT_HTTP_PORT'].toString();
  try {
    final response = await http.get(Uri.parse('http://$host:$port/api/config'));
    if (response.statusCode == 200) {
      result['enabledService']['http'] = true;
      result['enabledService']['rpc'] = true;
    }
  } catch (e) {
    result['enabledService']['http'] = false;
    result['enabledService']['rpc'] = false;
  }
  return Response.ok(json.encode(result));
}

Future<Response> _invoiceHandler(Request request) async {
  final api = request.params['api'].toString();
  final database = request.params['database'].toString();
  final username = request.params['username'].toString();
  final transId = request.params['id'].toString();

  final token = createToken(tokenParams(database, username));

  final params = {
    'reportkey': 'ntr_invoice_en',
    'orientation': 'portrait',
    'size': 'a4',
    'output': 'base64',
    'nervatype': 'trans',
    'filters': {'@id': int.parse(transId)},
  };

  final client = clients[api]!(conf);
  final clientFunc = serviceFunctions['report']!(client);
  Map<String, dynamic> result = await clientFunc(token, params);
  await client.close();

  if (result.containsKey('error')) {
    return Response.ok(result['error']);
  }

  String contentStr = '';
  if (api == 'http') {
    contentStr = result['result'].toString().split(',')[1];
  } else if (api == 'rpc') {
    contentStr = json
        .decode(
            utf8.decode(base64Decode(result['result'].toString())))['template']
        .split(',')[1];
  } else {
    contentStr = result['result']['template'].split(',')[1];
  }
  final content = base64Decode(contentStr);
  return Response.ok(content, headers: {
    'Content-Type': 'application/pdf',
    'Content-Disposition': 'attachment; filename=Invoice_$transId.pdf'
  });
}

Future<Response> _serviceHandler(Request request) async {
  final api = request.params['api'];
  final func = request.params['func'];
  final args = json.decode(await request.readAsString());

  final client = clients[api]!(conf);
  final clientFunc = serviceFunctions[func]!(client);
  Map<String, dynamic> result = (args.length == 1)
      ? await clientFunc(args[0])
      : await clientFunc(args[0], args[1]);
  await client.close();
  return Response.ok(json.encode(result));
}

Future<Response> _tokenHandler(Request request) async {
  final data = json.decode(await request.readAsString());
  final code = data['code'].toString();
  if (codeMap.containsKey(code)) {
    final port = env['NT_EXAMPLE_PORT'] ?? '8080';
    return Response.ok(json.encode({
      'access_token': codeMap[code],
      'token_type': 'bearer',
      'expires_in': env['NT_EXAMPLE_TOKEN_EXP'].toString(),
      'callback': 'http://$_host:$port/client_logout'
    }));
  } else if (code == loginCode) {
    final database = data['database'].toString();
    final username = data['username'].toString();

    final token = createToken(tokenParams(database, username));
    final tokenCode = String.fromCharCodes(Iterable.generate(
        15, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));
    codeMap[tokenCode] = token;
    return Response.ok(json.encode({
      'access_token': token,
      'code': tokenCode,
    }));
  }

  return Response.badRequest(
      body: json.encode({
    'code': 400,
    'error': {'message': 'Missing or invalid code'}
  }));
}

Future<Response> _clientLogoutHandler(Request request) async {
  if (request.requestedUri.queryParameters['error'] != null) {
    final msg =
        base64Decode(request.requestedUri.queryParameters['error'].toString());
    return Response.ok(msg);
  }
  return Response.ok('The logout was successful!');
}

Future<Response> _clientCodeHandler(Request request) async {
  return Response.ok(loginCode);
}

Future<Response> _clientConfigHandler(Request request) async {
  String resultHtml = '''
<div style="display: flex; flex-wrap: wrap; gap: 5px; padding: 10px; background-color: #fdf5e6; border: 1px solid #ccc;">
  <div style="display: flex; gap: 5px;">
    <div style="padding: 4px 8px; background-color: gainsboro; border: 1px solid #ccc;"><b>NT_CLIENT_CONFIG</b></div>
    <div style="padding: 4px 8px; background-color: white; border: 1px solid #ccc;">${env['NT_CLIENT_CONFIG'].toString()}</div>
  </div>
  <div style="display: flex; gap: 5px;">
    <div style="padding: 4px 8px; background-color: gainsboro; border: 1px solid #ccc;"><b>NT_ALIAS_DEMO</b></div>
    <div style="padding: 4px 8px; background-color: white; border: 1px solid #ccc;">${env['NT_ALIAS_DEMO'].toString()}</div>
  </div>
</div>
<div style="display: flex; flex-wrap: wrap; gap: 5px; height: 90%; width: 99%; margin-top: 8px;">
  <div style="flex: 400px; height: 100%;">
    <iframe src = "http://$_host:${env['NT_HTTP_PORT'].toString()}/client" style="height: 100%; width: 100%; border: none" frameborder="0">
      Sorry your browser does not support inline frames.
    </iframe>
  </div>
  <div style="flex: 400px; height: 100%;">
    <iframe src = "http://$_host:${env['NT_HTTP_PORT'].toString()}/locales" style="height: 100%; width: 100%; border: none" frameborder="0">
      Sorry your browser does not support inline frames.
    </iframe>
  </div>
</div>
''';
  return Response.ok(resultHtml, headers: {'Content-Type': 'text/html'});
}

Future<Response> _homepageHandler(Request request) async {
  return Response.ok(json.encode(request.requestedUri.queryParameters));
}

Future<Response> _emailHandler(Request request) async {
  final data = json.decode(await request.readAsString());
  if ((!data['values'].containsKey('email_from')) ||
      (!data['values']['email_from'].toString().contains('@'))) {
    return Response.badRequest(
        body: json.encode({
      'code': 400,
      'error': {'message': 'Invalid sender address'}
    }));
  }

  if ((!data['values'].containsKey('email_to')) ||
      (!data['values']['email_to'].toString().contains('@'))) {
    return Response.badRequest(
        body: json.encode({
      'code': 400,
      'error': {'message': 'Invalid email address'}
    }));
  }

  if ((env['NT_SMTP_HOST'] == 'EXAMPLE_SMTP_HOST') ||
      (env['NT_SMTP_USER'] == 'EXAMPLE_SMTP_USER') ||
      (env['NT_SMTP_PASSWORD'] == 'EXAMPLE_SMTP_PASSWORD')) {
    return Response.badRequest(
        body: json.encode({
      'code': 400,
      'error': {'message': 'Invalid SMTP settings'}
    }));
  }

  Map<String, dynamic> params = {
    'key': 'sendEmail',
    'values': {
      'provider': 'smtp',
      'email': {
        'from': data['values']['email_from'].toString(),
        'recipients': [
          {'email': data['values']['email_to'].toString()},
        ],
        'subject': 'Thank you for your order',
        'html': '<p>Thank you for your order!</p><b>Please</b> note: ...',
        'attachments': [
          {
            'reportkey': 'ntr_invoice_en',
            'nervatype': 'trans',
            'refnumber': 'DMINV/00001'
          }
        ]
      }
    }
  };
  final token = createToken(tokenParams('demo', 'admin'));
  final client = clients['http']!(conf);
  final clientFunc = serviceFunctions['function']!(client);
  Map<String, dynamic> result = await clientFunc(token, params);
  await client.close();

  if (result.containsKey('error')) {
    return Response.badRequest(
        body: json.encode({
      'code': 400,
      'error': {'message': result['error']}
    }));
  }

  return Response.ok('The message was successfully sent');
}

void main(List<String> args) async {
  String envFile = (File('.env').existsSync()) ? '.env' : '.env.example';
  env = DotEnv(includePlatformEnvironment: false)
    ..load([envFile])
    ..addAll(Platform.environment);

  _host = (env['NT_EXAMPLE_HOST'].toString() != '')
      ? env['NT_EXAMPLE_HOST'].toString()
      : _host;
  _port = (env['NT_EXAMPLE_PORT'].toString() != '')
      ? int.parse(env['NT_EXAMPLE_PORT'].toString())
      : _port;

  loginCode = String.fromCharCodes(Iterable.generate(
      15, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(_router);

  final server = await serve(handler, _host, _port);
  print('Server listening on port ${server.port}');
}
