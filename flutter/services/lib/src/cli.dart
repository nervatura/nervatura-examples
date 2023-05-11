/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'dart:convert';
import 'dart:io';

import 'service.dart';

class CliClient implements ServiceClient {
  final String _servicePath;
  final Map<String, String> _config;

  CliClient(this._servicePath, this._config) {}

  Future<Map<String, dynamic>> _connect(List<String> _arg) async {
    List<String> arg = _arg;
    ;
    if (_servicePath == 'docker') {
      arg = List.from(['exec', '-i', 'nervatura', '/nervatura'])..addAll(arg);
    } else {
      if (!File(_servicePath).existsSync()) {
        return {'error': 'Invalid service file'};
      }
    }
    final result = await Process.run(_servicePath, arg,
        environment: _config, includeParentEnvironment: true);
    if (result.stderr != '') {
      return {'error': result.stderr};
    }
    final resultArr = LineSplitter().convert(result.stdout.toString());
    if (resultArr[resultArr.length - 1].startsWith('ERROR')) {
      return {'error': resultArr[resultArr.length - 1]};
    }
    final resultMap = jsonDecode(resultArr[resultArr.length - 1]);
    if (resultMap is Map<String, dynamic>) {
      if (resultMap.containsKey('code')) {
        if ((resultMap['code'] != 200) && (resultMap['code'] != 204)) {
          return {'error': resultMap['message'].toString()};
        }
      }
    }
    return {'result': resultMap};
  }

  @override
  Future<void> close() async {
    return;
  }

  @override
  Future<Map<String, dynamic>> databaseCreate(
      String apiKey, Map<String, dynamic> options) {
    String data = jsonEncode(options);
    return _connect(['-c', 'DatabaseCreate', '-o', data, '-k', apiKey]);
  }

  @override
  Future<Map<String, dynamic>> userLogin(Map<String, dynamic> options) {
    String data = jsonEncode(options);
    return _connect(['-c', 'UserLogin', '-o', data]);
  }

  @override
  Future<Map<String, dynamic>> tokenLogin(String token) {
    return _connect(['-c', 'TokenLogin', '-t', token]);
  }

  @override
  Future<Map<String, dynamic>> tokenDecode(String token) {
    return _connect(['-c', 'TokenDecode', '-t', token]);
  }

  @override
  Future<Map<String, dynamic>> tokenRefresh(String token) {
    return _connect(['-c', 'TokenRefresh', '-t', token]);
  }

  @override
  Future<Map<String, dynamic>> userPassword(
      String token, Map<String, dynamic> options) {
    String data = jsonEncode(options);
    return _connect(['-c', 'UserPassword', '-o', data, '-t', token]);
  }

  @override
  Future<Map<String, dynamic>> report(
      String token, Map<String, dynamic> options) {
    String data = jsonEncode(options);
    return _connect(['-c', 'Report', '-o', data, '-t', token]);
  }

  @override
  Future<Map<String, dynamic>> reportList(
      String token, Map<String, dynamic> options) {
    String data = jsonEncode(options);
    return _connect(['-c', 'ReportList', '-o', data, '-t', token]);
  }

  @override
  Future<Map<String, dynamic>> reportDelete(
      String token, Map<String, dynamic> options) {
    String data = jsonEncode(options);
    return _connect(['-c', 'ReportDelete', '-o', data, '-t', token]);
  }

  @override
  Future<Map<String, dynamic>> reportInstall(
      String token, Map<String, dynamic> options) {
    String data = jsonEncode(options);
    return _connect(['-c', 'ReportInstall', '-o', data, '-t', token]);
  }

  @override
  Future<Map<String, dynamic>> function(
      String token, Map<String, dynamic> options) {
    String data = jsonEncode(options);
    return _connect(['-c', 'Function', '-o', data, '-t', token]);
  }

  @override
  Future<Map<String, dynamic>> view(
      String token, Map<String, dynamic> options) {
    String jdata = jsonEncode(options['data']);
    return _connect(['-c', 'View', '-d', jdata, '-t', token]);
  }

  @override
  Future<Map<String, dynamic>> get(String token, Map<String, dynamic> options) {
    String data = jsonEncode(options);
    return _connect(['-c', 'Get', '-o', data, '-t', token]);
  }

  @override
  Future<Map<String, dynamic>> update(
      String token, Map<String, dynamic> options) {
    String data = jsonEncode(options['data']);
    return _connect([
      '-c',
      'Update',
      '-nt',
      options['nervatype'].toString(),
      '-d',
      data,
      '-t',
      token
    ]);
  }

  @override
  Future<Map<String, dynamic>> delete(
      String token, Map<String, dynamic> options) {
    String data = jsonEncode(options);
    return _connect(['-c', 'Delete', '-o', data, '-t', token]);
  }
}
