/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'service.dart';

class CgoClient implements ServiceClient {
  final String _libraryPath;

  CgoClient(this._libraryPath);

  @override
  Future<void> close() {
    if (_libraryPath == '') {}
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> databaseCreate(
      String apiKey, Map<String, dynamic> options) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> userLogin(Map<String, dynamic> options) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> tokenLogin(String token) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> tokenDecode(String token) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> tokenRefresh(String token) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> userPassword(
      String token, Map<String, dynamic> options) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> report(
      String token, Map<String, dynamic> options) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> reportDelete(
      String token, Map<String, dynamic> options) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> reportInstall(
      String token, Map<String, dynamic> options) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> reportList(
      String token, Map<String, dynamic> options) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> function(
      String token, Map<String, dynamic> options) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> view(
      String token, Map<String, dynamic> options) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> get(String token, Map<String, dynamic> options) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> update(
      String token, Map<String, dynamic> options) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> delete(
      String token, Map<String, dynamic> options) {
    throw UnimplementedError();
  }
}
