/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

import 'service.dart';

typedef DatabaseCreateNative = Pointer<Utf8> Function(
    Pointer<Utf8> key, Pointer<Utf8> options);
typedef DatabaseCreate = Pointer<Utf8> Function(
    Pointer<Utf8> key, Pointer<Utf8> options);

typedef UserLoginNative = Pointer<Utf8> Function(Pointer<Utf8> options);
typedef UserLogin = Pointer<Utf8> Function(Pointer<Utf8> options);

typedef TokenLoginNative = Pointer<Utf8> Function(Pointer<Utf8> token);
typedef TokenLogin = Pointer<Utf8> Function(Pointer<Utf8> token);

typedef TokenRefreshNative = Pointer<Utf8> Function(Pointer<Utf8> token);
typedef TokenRefresh = Pointer<Utf8> Function(Pointer<Utf8> token);

typedef TokenDecodeNative = Pointer<Utf8> Function(Pointer<Utf8> token);
typedef TokenDecode = Pointer<Utf8> Function(Pointer<Utf8> token);

typedef UserPasswordNative = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);
typedef UserPassword = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);

typedef ReportNative = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);
typedef Report = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);

typedef ReportListNative = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);
typedef ReportList = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);

typedef ReportDeleteNative = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);
typedef ReportDelete = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);

typedef ReportInstallNative = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);
typedef ReportInstall = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);

typedef FunctionNative = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);
typedef FunctionDart = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);

typedef ViewNative = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> data);
typedef View = Pointer<Utf8> Function(Pointer<Utf8> token, Pointer<Utf8> data);

typedef GetNative = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);
typedef Get = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);

typedef UpdateNative = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> nervatype, Pointer<Utf8> data);
typedef Update = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> nervatype, Pointer<Utf8> data);

typedef DeleteNative = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);
typedef Delete = Pointer<Utf8> Function(
    Pointer<Utf8> token, Pointer<Utf8> options);

class CgoClient implements ServiceClient {
  final String _libraryPath;

  CgoClient(this._libraryPath);

  dynamic _open() {
    if (File(_libraryPath).existsSync()) {
      return DynamicLibrary.open(_libraryPath);
    }
    return 'Invalid service file';
  }

  @override
  Future<void> close() async {
    return;
  }

  Future<Map<String, dynamic>> _decodeResult(String result) async {
    final resultMap = jsonDecode(result);
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
  Future<Map<String, dynamic>> databaseCreate(
      String apiKey, Map<String, dynamic> options) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final databaseCreate = (ntura as DynamicLibrary)
        .lookupFunction<DatabaseCreateNative, DatabaseCreate>('DatabaseCreate');
    final keyUtf8 = apiKey.toNativeUtf8();
    final optionsUtf8 = jsonEncode(options).toNativeUtf8();
    String result = '{}';
    try {
      result = databaseCreate(keyUtf8, optionsUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(keyUtf8);
    calloc.free(optionsUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> userLogin(Map<String, dynamic> options) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final userLogin = (ntura as DynamicLibrary)
        .lookupFunction<UserLoginNative, UserLogin>('UserLogin');
    final optionsUtf8 = jsonEncode(options).toNativeUtf8();
    String result = '{}';
    try {
      result = userLogin(optionsUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(optionsUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> tokenLogin(String token) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final tokenLogin = (ntura as DynamicLibrary)
        .lookupFunction<TokenLoginNative, TokenLogin>('TokenLogin');
    final tokenUtf8 = token.toNativeUtf8();
    String result = '{}';
    try {
      result = tokenLogin(tokenUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(tokenUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> tokenDecode(String token) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final tokenDecode = (ntura as DynamicLibrary)
        .lookupFunction<TokenDecodeNative, TokenDecode>('TokenDecode');
    final tokenUtf8 = token.toNativeUtf8();
    String result = '{}';
    try {
      result = tokenDecode(tokenUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(tokenUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> tokenRefresh(String token) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final tokenRefresh = (ntura as DynamicLibrary)
        .lookupFunction<TokenRefreshNative, TokenRefresh>('TokenRefresh');
    final tokenUtf8 = token.toNativeUtf8();
    String result = '{}';
    try {
      result = tokenRefresh(tokenUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(tokenUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> userPassword(
      String token, Map<String, dynamic> options) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final userPassword = (ntura as DynamicLibrary)
        .lookupFunction<UserPasswordNative, UserPassword>('UserPassword');
    final tokenUtf8 = token.toNativeUtf8();
    final optionsUtf8 = jsonEncode(options).toNativeUtf8();
    String result = '{}';
    try {
      result = userPassword(tokenUtf8, optionsUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }
    calloc.free(tokenUtf8);
    calloc.free(optionsUtf8);

    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> report(
      String token, Map<String, dynamic> options) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final report = (ntura as DynamicLibrary)
        .lookupFunction<ReportNative, Report>('Report');
    final tokenUtf8 = token.toNativeUtf8();
    final optionsUtf8 = jsonEncode(options).toNativeUtf8();
    String result = '{}';
    try {
      result = report(tokenUtf8, optionsUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(tokenUtf8);
    calloc.free(optionsUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> reportDelete(
      String token, Map<String, dynamic> options) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final reportDelete = (ntura as DynamicLibrary)
        .lookupFunction<ReportDeleteNative, ReportDelete>('ReportDelete');
    final tokenUtf8 = token.toNativeUtf8();
    final optionsUtf8 = jsonEncode(options).toNativeUtf8();
    String result = '{}';
    try {
      result = reportDelete(tokenUtf8, optionsUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(tokenUtf8);
    calloc.free(optionsUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> reportInstall(
      String token, Map<String, dynamic> options) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final reportInstall = (ntura as DynamicLibrary)
        .lookupFunction<ReportInstallNative, ReportInstall>('ReportInstall');
    final tokenUtf8 = token.toNativeUtf8();
    final optionsUtf8 = jsonEncode(options).toNativeUtf8();
    String result = '{}';
    try {
      result = reportInstall(tokenUtf8, optionsUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(tokenUtf8);
    calloc.free(optionsUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> reportList(
      String token, Map<String, dynamic> options) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final reportList = (ntura as DynamicLibrary)
        .lookupFunction<ReportListNative, ReportList>('ReportList');
    final tokenUtf8 = token.toNativeUtf8();
    final optionsUtf8 = jsonEncode(options).toNativeUtf8();
    String result = '{}';
    try {
      result = reportList(tokenUtf8, optionsUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(tokenUtf8);
    calloc.free(optionsUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> function(
      String token, Map<String, dynamic> options) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final function = (ntura as DynamicLibrary)
        .lookupFunction<FunctionNative, FunctionDart>('Function');
    final tokenUtf8 = token.toNativeUtf8();
    final optionsUtf8 = jsonEncode(options).toNativeUtf8();
    String result = '{}';
    try {
      result = function(tokenUtf8, optionsUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(tokenUtf8);
    calloc.free(optionsUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> view(
      String token, Map<String, dynamic> options) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final view =
        (ntura as DynamicLibrary).lookupFunction<ViewNative, View>('View');
    final tokenUtf8 = token.toNativeUtf8();
    final dataUtf8 = jsonEncode(options['data']).toNativeUtf8();
    String result = '{}';
    try {
      result = view(tokenUtf8, dataUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(tokenUtf8);
    calloc.free(dataUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> get(
      String token, Map<String, dynamic> options) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final get = (ntura as DynamicLibrary).lookupFunction<GetNative, Get>('Get');
    final tokenUtf8 = token.toNativeUtf8();
    final optionsUtf8 = jsonEncode(options).toNativeUtf8();
    String result = '{}';
    try {
      result = get(tokenUtf8, optionsUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(tokenUtf8);
    calloc.free(optionsUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> update(
      String token, Map<String, dynamic> options) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final update = (ntura as DynamicLibrary)
        .lookupFunction<UpdateNative, Update>('Update');
    final tokenUtf8 = token.toNativeUtf8();
    final nervatypeUtf8 = options['nervatype'].toString().toNativeUtf8();
    final dataUtf8 = jsonEncode(options['data']).toNativeUtf8();
    String result = '{}';
    try {
      result = update(tokenUtf8, nervatypeUtf8, dataUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(tokenUtf8);
    calloc.free(nervatypeUtf8);
    calloc.free(dataUtf8);
    return _decodeResult(result);
  }

  @override
  Future<Map<String, dynamic>> delete(
      String token, Map<String, dynamic> options) async {
    final ntura = _open();
    if (ntura is String) {
      return {'error': ntura};
    }

    final delete = (ntura as DynamicLibrary)
        .lookupFunction<DeleteNative, Delete>('Delete');
    final tokenUtf8 = token.toNativeUtf8();
    final optionsUtf8 = jsonEncode(options).toNativeUtf8();
    String result = '{}';
    try {
      result = delete(tokenUtf8, optionsUtf8).toDartString();
    } catch (e) {
      final err = e.toString();
      result = '{"error":"$err"}';
    }

    calloc.free(tokenUtf8);
    calloc.free(optionsUtf8);
    return _decodeResult(result);
  }
}
