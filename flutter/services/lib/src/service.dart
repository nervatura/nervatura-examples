/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

abstract class ServiceClient {
  Future<Map<String, dynamic>> databaseCreate(
      String apiKey, Map<String, dynamic> options);
  Future<Map<String, dynamic>> userLogin(Map<String, dynamic> options);
  Future<Map<String, dynamic>> tokenLogin(String token);
  Future<Map<String, dynamic>> tokenRefresh(String token);
  Future<Map<String, dynamic>> tokenDecode(String token);
  Future<Map<String, dynamic>> userPassword(
      String token, Map<String, dynamic> options);
  Future<Map<String, dynamic>> report(
      String token, Map<String, dynamic> options);
  Future<Map<String, dynamic>> reportList(
      String token, Map<String, dynamic> options);
  Future<Map<String, dynamic>> reportDelete(
      String token, Map<String, dynamic> options);
  Future<Map<String, dynamic>> reportInstall(
      String token, Map<String, dynamic> options);
  Future<Map<String, dynamic>> function(
      String token, Map<String, dynamic> options);
  Future<Map<String, dynamic>> view(String token, Map<String, dynamic> options);
  Future<Map<String, dynamic>> get(String token, Map<String, dynamic> options);
  Future<Map<String, dynamic>> update(
      String token, Map<String, dynamic> options);
  Future<Map<String, dynamic>> delete(
      String token, Map<String, dynamic> options);
  Future<void> close();
}

Map<String, Function> serviceFunctions = {
  'databaseCreate': (ServiceClient client) {
    return client.databaseCreate;
  },
  'userLogin': (ServiceClient client) {
    return client.userLogin;
  },
  'tokenLogin': (ServiceClient client) {
    return client.tokenLogin;
  },
  'tokenRefresh': (ServiceClient client) {
    return client.tokenLogin;
  },
  'tokenDecode': (ServiceClient client) {
    return client.tokenLogin;
  },
  'userPassword': (ServiceClient client) {
    return client.userPassword;
  },
  'report': (ServiceClient client) {
    return client.report;
  },
  'reportList': (ServiceClient client) {
    return client.reportList;
  },
  'reportDelete': (ServiceClient client) {
    return client.reportDelete;
  },
  'reportInstall': (ServiceClient client) {
    return client.reportInstall;
  },
  'function': (ServiceClient client) {
    return client.function;
  },
  'view': (ServiceClient client) {
    return client.view;
  },
  'get': (ServiceClient client) {
    return client.get;
  },
  'update': (ServiceClient client) {
    return client.update;
  },
  'delete': (ServiceClient client) {
    return client.delete;
  },
  'close': (ServiceClient client) {
    return client.close;
  },
};
