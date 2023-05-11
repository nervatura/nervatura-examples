/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'service.dart';

class HttpClient implements ServiceClient {
  final String _host;
  final int _port;

  HttpClient(this._host, this._port);

  Future<Map<String, dynamic>> _request(
      String method, path, token, apiKey, dynamic options) async {
    ;
    http.Response response;
    String serviceUrl = 'http://$_host:$_port/api/$path';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    if (token != '') {
      headers['Authorization'] = 'Bearer $token';
    }
    if (apiKey != '') {
      headers['X-API-Key'] = apiKey;
    }

    try {
      if (method == 'GET') {
        response = await http.get(Uri.parse(serviceUrl), headers: headers);
      } else if (method == 'DELETE') {
        response = await http.delete(Uri.parse(serviceUrl), headers: headers);
      } else {
        response = await http.post(Uri.parse(serviceUrl),
            headers: headers, body: jsonEncode(options));
      }
    } catch (err) {
      return {'error': err};
    }

    if (response.headers['content-type'] == 'application/pdf') {
      return {'result': response.body};
    }

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result is Map<String, dynamic>) {
        if (result.containsKey('code')) {
          if ((result['code'] != 200) && (result['code'] != 204)) {
            return {'error': result['message'].toString()};
          }
        }
      }
      return {'result': result};
    }

    if (response.statusCode != 204) {
      return {'error': response.reasonPhrase.toString()};
    }
    return {};
  }

  @override
  Future<void> close() async {
    return;
  }

  @override
  Future<Map<String, dynamic>> databaseCreate(
      String apiKey, Map<String, dynamic> options) {
    String path =
        'database?alias=${options['database']}&demo=${options['demo']}';
    return _request('POST', path, '', apiKey, {});
  }

  @override
  Future<Map<String, dynamic>> userLogin(Map<String, dynamic> options) {
    return _request('POST', 'auth/login', '', '', options);
  }

  @override
  Future<Map<String, dynamic>> tokenLogin(String token) {
    return _request('GET', 'auth/validate', token, '', {});
  }

  @override
  Future<Map<String, dynamic>> tokenDecode(String token) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> tokenRefresh(String token) {
    return _request('GET', 'auth/refresh', token, '', {});
  }

  @override
  Future<Map<String, dynamic>> userPassword(
      String token, Map<String, dynamic> options) {
    return _request('POST', 'auth/password', token, '', options);
  }

  @override
  Future<Map<String, dynamic>> report(
      String token, Map<String, dynamic> options) {
    String path = 'report?filters[@id]=' + options['filters']['@id'].toString();
    path += '&reportkey=' + options['reportkey'].toString();
    path += '&orientation=' + options['orientation'].toString();
    path += '&size=' + options['size'].toString();
    path += '&output=' + options['output'].toString();
    if (options.containsKey('nervatype')) {
      path += '&nervatype=' + options['nervatype'].toString();
    }
    return _request('GET', path, token, '', {});
  }

  @override
  Future<Map<String, dynamic>> reportList(
      String token, Map<String, dynamic> options) {
    String path = 'report/list';
    if (options.containsKey('label')) {
      path += '?label=' + options['label'].toString();
    }
    return _request('GET', path, token, '', {});
  }

  @override
  Future<Map<String, dynamic>> reportDelete(
      String token, Map<String, dynamic> options) {
    String path = 'report/delete';
    if (options.containsKey('reportkey')) {
      path += '?reportkey=' + options['reportkey'].toString();
    }
    return _request('DELETE', path, token, '', {});
  }

  @override
  Future<Map<String, dynamic>> reportInstall(
      String token, Map<String, dynamic> options) {
    String path = 'report/install';
    if (options.containsKey('reportkey')) {
      path += '?reportkey=' + options['reportkey'].toString();
    }
    return _request('POST', path, token, '', {});
  }

  @override
  Future<Map<String, dynamic>> function(
      String token, Map<String, dynamic> options) {
    return _request('POST', 'function', token, '', options);
  }

  @override
  Future<Map<String, dynamic>> view(
      String token, Map<String, dynamic> options) {
    return _request('POST', 'view', token, '', options['data']);
  }

  @override
  Future<Map<String, dynamic>> get(String token, Map<String, dynamic> options) {
    String path = options['nervatype'].toString();
    if (options.containsKey('ids') &&
        (options['ids'].runtimeType == List<int>)) {
      path += '/' + (options['ids'] as List<int>).join(',');
    } else if (options.containsKey('ids')) {
      path += '/' + options['ids'].toString();
    } else {
      if (options.containsKey('metadata') && (options['metadata'] == true)) {
        path += '?metadata=true';
      } else {
        path += '?metadata=false';
      }
      if (options.containsKey('filter')) {
        path += '&filter=' + options['filter'].toString();
      }
    }

    return _request('GET', path, token, '', {});
  }

  @override
  Future<Map<String, dynamic>> update(
      String token, Map<String, dynamic> options) {
    return _request(
        'POST', options['nervatype'].toString(), token, '', options['data']);
  }

  @override
  Future<Map<String, dynamic>> delete(
      String token, Map<String, dynamic> options) {
    String path = options['nervatype'].toString();
    if (options.containsKey('id')) {
      path += '?id=' + options['id'].toString();
    } else if (options.containsKey('key')) {
      path += '?key=' + options['key'].toString();
    }
    return _request('DELETE', path, token, '', {});
  }
}
