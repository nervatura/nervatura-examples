/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'dart:convert';

import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import '../../nervatura/api.pbgrpc.dart';
import 'service.dart';

class RpcClient implements ServiceClient {
  final String _host;
  final int _port;

  late ClientChannel _channel;
  final int _timeout = 30;

  RpcClient(this._host, this._port) {
    _channel = ClientChannel(_host,
        port: _port,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
  }

  Map<String, dynamic> _decodeValue(Map<String, Value> values) {
    Map<String, dynamic> item = {};
    for (var v in values.entries) {
      if (v.value.hasBoolean()) {
        item[v.key] = v.value.boolean;
      } else if (v.value.hasNumber()) {
        item[v.key] = v.value.number;
      } else {
        if (v.value.text == 'null') {
          item[v.key] = '';
        } else {
          item[v.key] = v.value.text;
        }
      }
    }
    return item;
  }

  Value _encodeValue(dynamic value) {
    Value rpcValue = Value();
    switch (value.runtimeType) {
      case bool:
        rpcValue.boolean = value;
        break;

      case int:
        rpcValue.number = (value as int).toDouble();
        break;

      case double:
        rpcValue.number = value;
        break;

      case List<String>:
      case List<dynamic>:
        rpcValue.text = value.join(',');
        break;

      default:
        rpcValue.text = value.toString();
    }
    return rpcValue;
  }

  Map<String, Value>? _mapValue(Map<String, dynamic> values) {
    Map<String, Value>? valueMap = {};
    for (var key in values.keys.toList()) {
      valueMap[key] = _encodeValue(values[key]);
    }
    return valueMap;
  }

  Map<String, DataType> _dataType = {
    'address': DataType.address,
    'barcode': DataType.barcode,
    'contact': DataType.contact,
    'currency': DataType.currency,
    'customer': DataType.customer,
    'deffield': DataType.deffield,
    'employee': DataType.employee,
    'event': DataType.event,
    'fieldvalue': DataType.fieldvalue,
    'groups': DataType.groups,
    'item': DataType.item,
    'link': DataType.link,
    'log': DataType.log,
    'movement': DataType.movement,
    'numberdef': DataType.numberdef,
    'pattern': DataType.pattern,
    'payment': DataType.payment,
    'place': DataType.place,
    'price': DataType.price,
    'product': DataType.product,
    'project': DataType.project,
    'rate': DataType.rate,
    'tax': DataType.tax,
    'tool': DataType.tool,
    'trans': DataType.trans,
    'ui_audit': DataType.ui_audit,
    'ui_menu': DataType.ui_menu,
    'ui_menufields': DataType.ui_menufields,
    'ui_message': DataType.ui_message,
    'ui_printqueue': DataType.ui_printqueue,
    'ui_report': DataType.ui_report,
    'ui_userconfig': DataType.ui_userconfig,
  };

  @override
  Future<void> close() async {
    await _channel.shutdown();
  }

  @override
  Future<Map<String, dynamic>> databaseCreate(
      String apiKey, Map<String, dynamic> options) async {
    Map<String, dynamic> result = {'result': []};
    try {
      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'x-api-key': apiKey}));
      ResponseDatabaseCreate response = await stub.databaseCreate(
          RequestDatabaseCreate(
              alias: options.containsKey('database')
                  ? options['database'].toString()
                  : '',
              demo: (options['demo'] == true || options['demo'] == 'true')
                  ? true
                  : false));
      for (var item in response.details.items) {
        result['result'].add(_decodeValue(item.values));
      }
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> userLogin(Map<String, dynamic> options) async {
    Map<String, dynamic> result = {};
    try {
      APIClient stub = APIClient(_channel,
          options: CallOptions(timeout: Duration(seconds: _timeout)));
      ResponseUserLogin response = await stub.userLogin(RequestUserLogin(
        username: options.containsKey('username')
            ? options['username'].toString()
            : '',
        password: options.containsKey('password')
            ? options['password'].toString()
            : '',
        database: options.containsKey('database')
            ? options['database'].toString()
            : '',
      ));
      result['result'] = response.toProto3Json() as Map<String, dynamic>;
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> tokenLogin(String token) async {
    Map<String, dynamic> result = {};
    try {
      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      ResponseTokenLogin response = await stub.tokenLogin(RequestEmpty());
      result['result'] = response.toProto3Json() as Map<String, dynamic>;
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> tokenDecode(String token) async {
    Map<String, dynamic> result = {};
    try {
      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      ResponseTokenDecode response =
          await stub.tokenDecode(RequestTokenDecode(value: token));
      result['result'] = response.toProto3Json() as Map<String, dynamic>;
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> tokenRefresh(String token) async {
    Map<String, dynamic> result = {};
    try {
      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      ResponseTokenRefresh response = await stub.tokenRefresh(RequestEmpty());
      result['result'] = {'token': response.value};
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> userPassword(
      String token, Map<String, dynamic> options) async {
    Map<String, dynamic> result = {};
    try {
      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      await stub.userPassword(RequestUserPassword(
        username: options.containsKey('username')
            ? options['username'].toString()
            : '',
        password: options.containsKey('password')
            ? options['password'].toString()
            : '',
        confirm:
            options.containsKey('confirm') ? options['confirm'].toString() : '',
        custnumber: options.containsKey('custnumber')
            ? options['custnumber'].toString()
            : '',
      ));
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> report(
      String token, Map<String, dynamic> options) async {
    Map<String, dynamic> result = {};
    Map<String, ReportOrientation> orientation = {
      'portrait': ReportOrientation.portrait,
      'landscape': ReportOrientation.landscape,
    };
    Map<String, ReportSize> size = {
      'a3': ReportSize.a3,
      'a4': ReportSize.a4,
      'a5': ReportSize.a5,
      'letter': ReportSize.letter,
      'legal': ReportSize.legal,
    };
    Map<String, ReportOutput> output = {
      'auto': ReportOutput.base64,
      'xml': ReportOutput.xml,
      'data': ReportOutput.data,
      'base64': ReportOutput.base64,
      'print': ReportOutput.base64,
      'pdf': ReportOutput.base64,
    };
    Map<String, ReportType> reportType = {
      'customer': ReportType.report_customer,
      'employee': ReportType.report_employee,
      'event': ReportType.report_event,
      'place': ReportType.report_place,
      'product': ReportType.report_product,
      'project': ReportType.report_project,
      'tool': ReportType.report_tool,
      'trans': ReportType.report_trans,
    };
    try {
      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      ResponseReport response = await stub.report(RequestReport(
          reportkey: options.containsKey('reportkey')
              ? options['reportkey'].toString()
              : '',
          orientation: orientation[options['orientation'].toString()],
          size: size[options['size'].toString()],
          output: output[options['output'].toString()],
          type: reportType[options['nervatype'].toString()],
          refnumber: options.containsKey('refnumber')
              ? options['refnumber'].toString()
              : '',
          template: options.containsKey('template')
              ? options['template'].toString()
              : '',
          filters: options.containsKey('filters')
              ? _mapValue(options['filters'])
              : {}));
      final value = response.toProto3Json() as Map<String, dynamic>;
      result['result'] = value['value'];
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> reportList(
      String token, Map<String, dynamic> options) async {
    Map<String, dynamic> result = {};
    try {
      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      ResponseReportList response = await stub.reportList(RequestReportList(
        label: options.containsKey('label') ? options['label'].toString() : '',
      ));
      final items = response.toProto3Json() as Map<String, dynamic>;
      result['result'] = items['items'];
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> reportDelete(
      String token, Map<String, dynamic> options) async {
    Map<String, dynamic> result = {};
    try {
      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      await stub.reportDelete(RequestReportDelete(
        reportkey: options.containsKey('reportkey')
            ? options['reportkey'].toString()
            : '',
      ));
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> reportInstall(
      String token, Map<String, dynamic> options) async {
    Map<String, dynamic> result = {};
    try {
      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      ResponseReportInstall response =
          await stub.reportInstall(RequestReportInstall(
        reportkey: options.containsKey('reportkey')
            ? options['reportkey'].toString()
            : '',
      ));
      result['result'] = response.id.toInt();
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> function(
      String token, Map<String, dynamic> options) async {
    Map<String, dynamic> result = {};
    bool _checkValue(Map<String, dynamic> values) {
      for (var value in values.values.toList()) {
        switch (value.runtimeType) {
          case bool:
          case int:
          case double:
          case String:
          case List<String>:
            break;

          default:
            return false;
        }
      }
      return true;
    }

    try {
      List<int> value = [];
      Map<String, Value>? values = {};
      if (options.containsKey('values')) {
        if (_checkValue(options['values'])) {
          values = _mapValue(options['values']);
        } else {
          value = jsonDecode(options['values']).cast<int>();
        }
      }
      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      ResponseFunction response = await stub.function(RequestFunction(
          key: options.containsKey('key') ? options['key'].toString() : '',
          values: values,
          value: value));
      final resValue = jsonDecode(new String.fromCharCodes(response.value));
      result['result'] = resValue;
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> view(
      String token, Map<String, dynamic> options) async {
    Map<String, dynamic> result = {};
    try {
      List<RequestView_Query> rpcOptions = [];
      for (var item in options['data']) {
        List<Value> values = [];
        if (item.containsKey('values')) {
          values.add(_encodeValue(item['values']));
        }
        rpcOptions.add(RequestView_Query(
          key: item.containsKey('key') ? item['key'].toString() : '',
          text: item.containsKey('text') ? item['text'].toString() : '',
          values: values,
        ));
      }

      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      ResponseView response = await stub.view(RequestView(options: rpcOptions));
      result['result'] = {};
      for (var row in response.values.entries) {
        List<Map<String, dynamic>> items = [];
        for (var item in row.value.items) {
          items.add(_decodeValue(item.values));
        }
        result['result'][row.key] = items;
      }
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> get(
      String token, Map<String, dynamic> options) async {
    Map<String, dynamic> result = {};
    try {
      Iterable<Int64>? ids;
      if (options.containsKey('ids') &&
          (options['ids'].runtimeType == String)) {
        List<Int64> _ids = [];
        for (var id in options['ids'].split(',')) {
          _ids.add(Int64(int.parse(id as String)));
        }
        ids = _ids;
      }
      Iterable<String>? filter;
      if (options.containsKey('filter') &&
          (options['filter'].runtimeType == String)) {
        filter = options['filter'].split('|');
      }
      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      ResponseGet response = await stub.get(RequestGet(
          nervatype: _dataType[options['nervatype'].toString()],
          metadata:
              (options['metadata'] == true || options['metadata'] == 'true')
                  ? true
                  : false,
          ids: ids,
          filter: filter));
      final items = response.toProto3Json() as Map<String, dynamic>;
      result['result'] = items['values'];
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> update(
      String token, Map<String, dynamic> options) async {
    Map<String, dynamic> result = {};
    try {
      Iterable<RequestUpdate_Item>? items;
      List<RequestUpdate_Item> _items = [];
      if ((options['data'].runtimeType == List<Map<String, Object>>) ||
          (options['data'].runtimeType == List<Map<String, dynamic>>) ||
          (options['data'].runtimeType == List<dynamic>)) {
        for (var row in options['data']) {
          Map<String, Value> keys = {};
          Map<String, Value> values = {};
          for (var field in row.entries) {
            if (field.key == 'keys' &&
                ((field.runtimeType == MapEntry<String, Object>) ||
                    field.runtimeType == MapEntry<String, dynamic>)) {
              keys = ((field.value != null) ? _mapValue(field.value) : {})!;
            } else {
              values[field.key] = _encodeValue(field.value);
            }
          }
          _items.add(RequestUpdate_Item(keys: keys, values: values));
        }
        items = _items;
      }

      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      ResponseUpdate response = await stub.update(RequestUpdate(
          nervatype: _dataType[options['nervatype'].toString()], items: items));
      final values = response.toProto3Json() as Map<String, dynamic>;
      result['result'] = values['values'];
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> delete(
      String token, Map<String, dynamic> options) async {
    Map<String, dynamic> result = {};
    try {
      APIClient stub = APIClient(_channel,
          options: CallOptions(
              timeout: Duration(seconds: _timeout),
              metadata: {'authorization': 'Bearer $token'}));
      await stub.delete(RequestDelete(
          nervatype: _dataType[options['nervatype'].toString()],
          id: (options.containsKey('id')
              ? Int64(int.parse(options['id'].toString()))
              : Int64(0)),
          key: options.containsKey('key') ? options['key'].toString() : ''));
    } on GrpcError catch (err) {
      result['error'] = err.message;
    }
    return result;
  }
}
