///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use dataTypeDescriptor instead')
const DataType$json = const {
  '1': 'DataType',
  '2': const [
    const {'1': 'address', '2': 0},
    const {'1': 'barcode', '2': 1},
    const {'1': 'contact', '2': 2},
    const {'1': 'currency', '2': 3},
    const {'1': 'customer', '2': 4},
    const {'1': 'deffield', '2': 5},
    const {'1': 'employee', '2': 6},
    const {'1': 'event', '2': 7},
    const {'1': 'fieldvalue', '2': 8},
    const {'1': 'groups', '2': 9},
    const {'1': 'item', '2': 10},
    const {'1': 'link', '2': 11},
    const {'1': 'log', '2': 12},
    const {'1': 'movement', '2': 13},
    const {'1': 'numberdef', '2': 14},
    const {'1': 'pattern', '2': 15},
    const {'1': 'payment', '2': 16},
    const {'1': 'place', '2': 17},
    const {'1': 'price', '2': 18},
    const {'1': 'product', '2': 19},
    const {'1': 'project', '2': 20},
    const {'1': 'rate', '2': 21},
    const {'1': 'tax', '2': 22},
    const {'1': 'tool', '2': 23},
    const {'1': 'trans', '2': 24},
    const {'1': 'ui_audit', '2': 25},
    const {'1': 'ui_menu', '2': 26},
    const {'1': 'ui_menufields', '2': 27},
    const {'1': 'ui_message', '2': 28},
    const {'1': 'ui_printqueue', '2': 29},
    const {'1': 'ui_report', '2': 30},
    const {'1': 'ui_userconfig', '2': 31},
  ],
};

/// Descriptor for `DataType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dataTypeDescriptor = $convert.base64Decode('CghEYXRhVHlwZRILCgdhZGRyZXNzEAASCwoHYmFyY29kZRABEgsKB2NvbnRhY3QQAhIMCghjdXJyZW5jeRADEgwKCGN1c3RvbWVyEAQSDAoIZGVmZmllbGQQBRIMCghlbXBsb3llZRAGEgkKBWV2ZW50EAcSDgoKZmllbGR2YWx1ZRAIEgoKBmdyb3VwcxAJEggKBGl0ZW0QChIICgRsaW5rEAsSBwoDbG9nEAwSDAoIbW92ZW1lbnQQDRINCgludW1iZXJkZWYQDhILCgdwYXR0ZXJuEA8SCwoHcGF5bWVudBAQEgkKBXBsYWNlEBESCQoFcHJpY2UQEhILCgdwcm9kdWN0EBMSCwoHcHJvamVjdBAUEggKBHJhdGUQFRIHCgN0YXgQFhIICgR0b29sEBcSCQoFdHJhbnMQGBIMCgh1aV9hdWRpdBAZEgsKB3VpX21lbnUQGhIRCg11aV9tZW51ZmllbGRzEBsSDgoKdWlfbWVzc2FnZRAcEhEKDXVpX3ByaW50cXVldWUQHRINCgl1aV9yZXBvcnQQHhIRCg11aV91c2VyY29uZmlnEB8=');
@$core.Deprecated('Use reportOrientationDescriptor instead')
const ReportOrientation$json = const {
  '1': 'ReportOrientation',
  '2': const [
    const {'1': 'portrait', '2': 0},
    const {'1': 'landscape', '2': 1},
  ],
};

/// Descriptor for `ReportOrientation`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List reportOrientationDescriptor = $convert.base64Decode('ChFSZXBvcnRPcmllbnRhdGlvbhIMCghwb3J0cmFpdBAAEg0KCWxhbmRzY2FwZRAB');
@$core.Deprecated('Use reportSizeDescriptor instead')
const ReportSize$json = const {
  '1': 'ReportSize',
  '2': const [
    const {'1': 'a3', '2': 0},
    const {'1': 'a4', '2': 1},
    const {'1': 'a5', '2': 2},
    const {'1': 'letter', '2': 3},
    const {'1': 'legal', '2': 4},
  ],
};

/// Descriptor for `ReportSize`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List reportSizeDescriptor = $convert.base64Decode('CgpSZXBvcnRTaXplEgYKAmEzEAASBgoCYTQQARIGCgJhNRACEgoKBmxldHRlchADEgkKBWxlZ2FsEAQ=');
@$core.Deprecated('Use reportOutputDescriptor instead')
const ReportOutput$json = const {
  '1': 'ReportOutput',
  '2': const [
    const {'1': 'auto', '2': 0},
    const {'1': 'xml', '2': 1},
    const {'1': 'data', '2': 2},
    const {'1': 'base64', '2': 3},
  ],
};

/// Descriptor for `ReportOutput`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List reportOutputDescriptor = $convert.base64Decode('CgxSZXBvcnRPdXRwdXQSCAoEYXV0bxAAEgcKA3htbBABEggKBGRhdGEQAhIKCgZiYXNlNjQQAw==');
@$core.Deprecated('Use reportTypeDescriptor instead')
const ReportType$json = const {
  '1': 'ReportType',
  '2': const [
    const {'1': 'report_none', '2': 0},
    const {'1': 'report_customer', '2': 1},
    const {'1': 'report_employee', '2': 2},
    const {'1': 'report_event', '2': 3},
    const {'1': 'report_place', '2': 4},
    const {'1': 'report_product', '2': 5},
    const {'1': 'report_project', '2': 6},
    const {'1': 'report_tool', '2': 7},
    const {'1': 'report_trans', '2': 8},
  ],
};

/// Descriptor for `ReportType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List reportTypeDescriptor = $convert.base64Decode('CgpSZXBvcnRUeXBlEg8KC3JlcG9ydF9ub25lEAASEwoPcmVwb3J0X2N1c3RvbWVyEAESEwoPcmVwb3J0X2VtcGxveWVlEAISEAoMcmVwb3J0X2V2ZW50EAMSEAoMcmVwb3J0X3BsYWNlEAQSEgoOcmVwb3J0X3Byb2R1Y3QQBRISCg5yZXBvcnRfcHJvamVjdBAGEg8KC3JlcG9ydF90b29sEAcSEAoMcmVwb3J0X3RyYW5zEAg=');
@$core.Deprecated('Use valueDescriptor instead')
const Value$json = const {
  '1': 'Value',
  '2': const [
    const {'1': 'boolean', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'boolean'},
    const {'1': 'number', '3': 2, '4': 1, '5': 1, '9': 0, '10': 'number'},
    const {'1': 'text', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'text'},
  ],
  '8': const [
    const {'1': 'value'},
  ],
};

/// Descriptor for `Value`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List valueDescriptor = $convert.base64Decode('CgVWYWx1ZRIaCgdib29sZWFuGAEgASgISABSB2Jvb2xlYW4SGAoGbnVtYmVyGAIgASgBSABSBm51bWJlchIUCgR0ZXh0GAMgASgJSABSBHRleHRCBwoFdmFsdWU=');
@$core.Deprecated('Use responseRowsDescriptor instead')
const ResponseRows$json = const {
  '1': 'ResponseRows',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.nervatura.ResponseRows.Item', '10': 'items'},
  ],
  '3': const [ResponseRows_Item$json],
};

@$core.Deprecated('Use responseRowsDescriptor instead')
const ResponseRows_Item$json = const {
  '1': 'Item',
  '2': const [
    const {'1': 'values', '3': 1, '4': 3, '5': 11, '6': '.nervatura.ResponseRows.Item.ValuesEntry', '10': 'values'},
  ],
  '3': const [ResponseRows_Item_ValuesEntry$json],
};

@$core.Deprecated('Use responseRowsDescriptor instead')
const ResponseRows_Item_ValuesEntry$json = const {
  '1': 'ValuesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.nervatura.Value', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `ResponseRows`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseRowsDescriptor = $convert.base64Decode('CgxSZXNwb25zZVJvd3MSMgoFaXRlbXMYASADKAsyHC5uZXJ2YXR1cmEuUmVzcG9uc2VSb3dzLkl0ZW1SBWl0ZW1zGpUBCgRJdGVtEkAKBnZhbHVlcxgBIAMoCzIoLm5lcnZhdHVyYS5SZXNwb25zZVJvd3MuSXRlbS5WYWx1ZXNFbnRyeVIGdmFsdWVzGksKC1ZhbHVlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EiYKBXZhbHVlGAIgASgLMhAubmVydmF0dXJhLlZhbHVlUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use requestEmptyDescriptor instead')
const RequestEmpty$json = const {
  '1': 'RequestEmpty',
};

/// Descriptor for `RequestEmpty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestEmptyDescriptor = $convert.base64Decode('CgxSZXF1ZXN0RW1wdHk=');
@$core.Deprecated('Use responseEmptyDescriptor instead')
const ResponseEmpty$json = const {
  '1': 'ResponseEmpty',
};

/// Descriptor for `ResponseEmpty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseEmptyDescriptor = $convert.base64Decode('Cg1SZXNwb25zZUVtcHR5');
@$core.Deprecated('Use requestUserLoginDescriptor instead')
const RequestUserLogin$json = const {
  '1': 'RequestUserLogin',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'database', '3': 3, '4': 1, '5': 9, '10': 'database'},
  ],
};

/// Descriptor for `RequestUserLogin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestUserLoginDescriptor = $convert.base64Decode('ChBSZXF1ZXN0VXNlckxvZ2luEhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQSGgoIZGF0YWJhc2UYAyABKAlSCGRhdGFiYXNl');
@$core.Deprecated('Use responseUserLoginDescriptor instead')
const ResponseUserLogin$json = const {
  '1': 'ResponseUserLogin',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'engine', '3': 2, '4': 1, '5': 9, '10': 'engine'},
    const {'1': 'version', '3': 3, '4': 1, '5': 9, '10': 'version'},
  ],
};

/// Descriptor for `ResponseUserLogin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseUserLoginDescriptor = $convert.base64Decode('ChFSZXNwb25zZVVzZXJMb2dpbhIUCgV0b2tlbhgBIAEoCVIFdG9rZW4SFgoGZW5naW5lGAIgASgJUgZlbmdpbmUSGAoHdmVyc2lvbhgDIAEoCVIHdmVyc2lvbg==');
@$core.Deprecated('Use requestTokenDecodeDescriptor instead')
const RequestTokenDecode$json = const {
  '1': 'RequestTokenDecode',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `RequestTokenDecode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestTokenDecodeDescriptor = $convert.base64Decode('ChJSZXF1ZXN0VG9rZW5EZWNvZGUSFAoFdmFsdWUYASABKAlSBXZhbHVl');
@$core.Deprecated('Use responseTokenDecodeDescriptor instead')
const ResponseTokenDecode$json = const {
  '1': 'ResponseTokenDecode',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'database', '3': 2, '4': 1, '5': 9, '10': 'database'},
    const {'1': 'exp', '3': 3, '4': 1, '5': 1, '10': 'exp'},
    const {'1': 'iss', '3': 4, '4': 1, '5': 9, '10': 'iss'},
  ],
};

/// Descriptor for `ResponseTokenDecode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseTokenDecodeDescriptor = $convert.base64Decode('ChNSZXNwb25zZVRva2VuRGVjb2RlEhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIaCghkYXRhYmFzZRgCIAEoCVIIZGF0YWJhc2USEAoDZXhwGAMgASgBUgNleHASEAoDaXNzGAQgASgJUgNpc3M=');
@$core.Deprecated('Use responseTokenRefreshDescriptor instead')
const ResponseTokenRefresh$json = const {
  '1': 'ResponseTokenRefresh',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `ResponseTokenRefresh`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseTokenRefreshDescriptor = $convert.base64Decode('ChRSZXNwb25zZVRva2VuUmVmcmVzaBIUCgV2YWx1ZRgBIAEoCVIFdmFsdWU=');
@$core.Deprecated('Use responseTokenLoginDescriptor instead')
const ResponseTokenLogin$json = const {
  '1': 'ResponseTokenLogin',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'empnumber', '3': 3, '4': 1, '5': 9, '10': 'empnumber'},
    const {'1': 'usergroup', '3': 4, '4': 1, '5': 3, '10': 'usergroup'},
    const {'1': 'scope', '3': 5, '4': 1, '5': 9, '10': 'scope'},
    const {'1': 'department', '3': 6, '4': 1, '5': 9, '10': 'department'},
  ],
};

/// Descriptor for `ResponseTokenLogin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseTokenLoginDescriptor = $convert.base64Decode('ChJSZXNwb25zZVRva2VuTG9naW4SDgoCaWQYASABKANSAmlkEhoKCHVzZXJuYW1lGAIgASgJUgh1c2VybmFtZRIcCgllbXBudW1iZXIYAyABKAlSCWVtcG51bWJlchIcCgl1c2VyZ3JvdXAYBCABKANSCXVzZXJncm91cBIUCgVzY29wZRgFIAEoCVIFc2NvcGUSHgoKZGVwYXJ0bWVudBgGIAEoCVIKZGVwYXJ0bWVudA==');
@$core.Deprecated('Use requestUserPasswordDescriptor instead')
const RequestUserPassword$json = const {
  '1': 'RequestUserPassword',
  '2': const [
    const {'1': 'password', '3': 1, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'confirm', '3': 2, '4': 1, '5': 9, '10': 'confirm'},
    const {'1': 'username', '3': 3, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'custnumber', '3': 4, '4': 1, '5': 9, '10': 'custnumber'},
  ],
};

/// Descriptor for `RequestUserPassword`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestUserPasswordDescriptor = $convert.base64Decode('ChNSZXF1ZXN0VXNlclBhc3N3b3JkEhoKCHBhc3N3b3JkGAEgASgJUghwYXNzd29yZBIYCgdjb25maXJtGAIgASgJUgdjb25maXJtEhoKCHVzZXJuYW1lGAMgASgJUgh1c2VybmFtZRIeCgpjdXN0bnVtYmVyGAQgASgJUgpjdXN0bnVtYmVy');
@$core.Deprecated('Use requestDatabaseCreateDescriptor instead')
const RequestDatabaseCreate$json = const {
  '1': 'RequestDatabaseCreate',
  '2': const [
    const {'1': 'alias', '3': 1, '4': 1, '5': 9, '10': 'alias'},
    const {'1': 'demo', '3': 2, '4': 1, '5': 8, '10': 'demo'},
  ],
};

/// Descriptor for `RequestDatabaseCreate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDatabaseCreateDescriptor = $convert.base64Decode('ChVSZXF1ZXN0RGF0YWJhc2VDcmVhdGUSFAoFYWxpYXMYASABKAlSBWFsaWFzEhIKBGRlbW8YAiABKAhSBGRlbW8=');
@$core.Deprecated('Use responseDatabaseCreateDescriptor instead')
const ResponseDatabaseCreate$json = const {
  '1': 'ResponseDatabaseCreate',
  '2': const [
    const {'1': 'details', '3': 1, '4': 1, '5': 11, '6': '.nervatura.ResponseRows', '10': 'details'},
  ],
};

/// Descriptor for `ResponseDatabaseCreate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDatabaseCreateDescriptor = $convert.base64Decode('ChZSZXNwb25zZURhdGFiYXNlQ3JlYXRlEjEKB2RldGFpbHMYASABKAsyFy5uZXJ2YXR1cmEuUmVzcG9uc2VSb3dzUgdkZXRhaWxz');
@$core.Deprecated('Use requestDeleteDescriptor instead')
const RequestDelete$json = const {
  '1': 'RequestDelete',
  '2': const [
    const {'1': 'nervatype', '3': 1, '4': 1, '5': 14, '6': '.nervatura.DataType', '10': 'nervatype'},
    const {'1': 'id', '3': 36, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'key', '3': 37, '4': 1, '5': 9, '10': 'key'},
  ],
};

/// Descriptor for `RequestDelete`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDeleteDescriptor = $convert.base64Decode('Cg1SZXF1ZXN0RGVsZXRlEjEKCW5lcnZhdHlwZRgBIAEoDjITLm5lcnZhdHVyYS5EYXRhVHlwZVIJbmVydmF0eXBlEg4KAmlkGCQgASgDUgJpZBIQCgNrZXkYJSABKAlSA2tleQ==');
@$core.Deprecated('Use requestViewDescriptor instead')
const RequestView$json = const {
  '1': 'RequestView',
  '2': const [
    const {'1': 'options', '3': 1, '4': 3, '5': 11, '6': '.nervatura.RequestView.Query', '10': 'options'},
  ],
  '3': const [RequestView_Query$json],
};

@$core.Deprecated('Use requestViewDescriptor instead')
const RequestView_Query$json = const {
  '1': 'Query',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'values', '3': 3, '4': 3, '5': 11, '6': '.nervatura.Value', '10': 'values'},
  ],
};

/// Descriptor for `RequestView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestViewDescriptor = $convert.base64Decode('CgtSZXF1ZXN0VmlldxI2CgdvcHRpb25zGAEgAygLMhwubmVydmF0dXJhLlJlcXVlc3RWaWV3LlF1ZXJ5UgdvcHRpb25zGlcKBVF1ZXJ5EhAKA2tleRgBIAEoCVIDa2V5EhIKBHRleHQYAiABKAlSBHRleHQSKAoGdmFsdWVzGAMgAygLMhAubmVydmF0dXJhLlZhbHVlUgZ2YWx1ZXM=');
@$core.Deprecated('Use responseViewDescriptor instead')
const ResponseView$json = const {
  '1': 'ResponseView',
  '2': const [
    const {'1': 'values', '3': 1, '4': 3, '5': 11, '6': '.nervatura.ResponseView.ValuesEntry', '10': 'values'},
  ],
  '3': const [ResponseView_ValuesEntry$json],
};

@$core.Deprecated('Use responseViewDescriptor instead')
const ResponseView_ValuesEntry$json = const {
  '1': 'ValuesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.nervatura.ResponseRows', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `ResponseView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseViewDescriptor = $convert.base64Decode('CgxSZXNwb25zZVZpZXcSOwoGdmFsdWVzGAEgAygLMiMubmVydmF0dXJhLlJlc3BvbnNlVmlldy5WYWx1ZXNFbnRyeVIGdmFsdWVzGlIKC1ZhbHVlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5Ei0KBXZhbHVlGAIgASgLMhcubmVydmF0dXJhLlJlc3BvbnNlUm93c1IFdmFsdWU6AjgB');
@$core.Deprecated('Use requestFunctionDescriptor instead')
const RequestFunction$json = const {
  '1': 'RequestFunction',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'values', '3': 2, '4': 3, '5': 11, '6': '.nervatura.RequestFunction.ValuesEntry', '10': 'values'},
    const {'1': 'value', '3': 3, '4': 1, '5': 12, '10': 'value'},
  ],
  '3': const [RequestFunction_ValuesEntry$json],
};

@$core.Deprecated('Use requestFunctionDescriptor instead')
const RequestFunction_ValuesEntry$json = const {
  '1': 'ValuesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.nervatura.Value', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `RequestFunction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestFunctionDescriptor = $convert.base64Decode('Cg9SZXF1ZXN0RnVuY3Rpb24SEAoDa2V5GAEgASgJUgNrZXkSPgoGdmFsdWVzGAIgAygLMiYubmVydmF0dXJhLlJlcXVlc3RGdW5jdGlvbi5WYWx1ZXNFbnRyeVIGdmFsdWVzEhQKBXZhbHVlGAMgASgMUgV2YWx1ZRpLCgtWYWx1ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRImCgV2YWx1ZRgCIAEoCzIQLm5lcnZhdHVyYS5WYWx1ZVIFdmFsdWU6AjgB');
@$core.Deprecated('Use responseFunctionDescriptor instead')
const ResponseFunction$json = const {
  '1': 'ResponseFunction',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `ResponseFunction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseFunctionDescriptor = $convert.base64Decode('ChBSZXNwb25zZUZ1bmN0aW9uEhQKBXZhbHVlGAEgASgMUgV2YWx1ZQ==');
@$core.Deprecated('Use requestReportListDescriptor instead')
const RequestReportList$json = const {
  '1': 'RequestReportList',
  '2': const [
    const {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
  ],
};

/// Descriptor for `RequestReportList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestReportListDescriptor = $convert.base64Decode('ChFSZXF1ZXN0UmVwb3J0TGlzdBIUCgVsYWJlbBgBIAEoCVIFbGFiZWw=');
@$core.Deprecated('Use responseReportListDescriptor instead')
const ResponseReportList$json = const {
  '1': 'ResponseReportList',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.nervatura.ResponseReportList.Info', '10': 'items'},
  ],
  '3': const [ResponseReportList_Info$json],
};

@$core.Deprecated('Use responseReportListDescriptor instead')
const ResponseReportList_Info$json = const {
  '1': 'Info',
  '2': const [
    const {'1': 'reportkey', '3': 1, '4': 1, '5': 9, '10': 'reportkey'},
    const {'1': 'repname', '3': 2, '4': 1, '5': 9, '10': 'repname'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'label', '3': 4, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'reptype', '3': 5, '4': 1, '5': 9, '10': 'reptype'},
    const {'1': 'filename', '3': 6, '4': 1, '5': 9, '10': 'filename'},
    const {'1': 'installed', '3': 7, '4': 1, '5': 8, '10': 'installed'},
  ],
};

/// Descriptor for `ResponseReportList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseReportListDescriptor = $convert.base64Decode('ChJSZXNwb25zZVJlcG9ydExpc3QSOAoFaXRlbXMYASADKAsyIi5uZXJ2YXR1cmEuUmVzcG9uc2VSZXBvcnRMaXN0LkluZm9SBWl0ZW1zGsoBCgRJbmZvEhwKCXJlcG9ydGtleRgBIAEoCVIJcmVwb3J0a2V5EhgKB3JlcG5hbWUYAiABKAlSB3JlcG5hbWUSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEhQKBWxhYmVsGAQgASgJUgVsYWJlbBIYCgdyZXB0eXBlGAUgASgJUgdyZXB0eXBlEhoKCGZpbGVuYW1lGAYgASgJUghmaWxlbmFtZRIcCglpbnN0YWxsZWQYByABKAhSCWluc3RhbGxlZA==');
@$core.Deprecated('Use requestReportInstallDescriptor instead')
const RequestReportInstall$json = const {
  '1': 'RequestReportInstall',
  '2': const [
    const {'1': 'reportkey', '3': 1, '4': 1, '5': 9, '10': 'reportkey'},
  ],
};

/// Descriptor for `RequestReportInstall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestReportInstallDescriptor = $convert.base64Decode('ChRSZXF1ZXN0UmVwb3J0SW5zdGFsbBIcCglyZXBvcnRrZXkYASABKAlSCXJlcG9ydGtleQ==');
@$core.Deprecated('Use responseReportInstallDescriptor instead')
const ResponseReportInstall$json = const {
  '1': 'ResponseReportInstall',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `ResponseReportInstall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseReportInstallDescriptor = $convert.base64Decode('ChVSZXNwb25zZVJlcG9ydEluc3RhbGwSDgoCaWQYASABKANSAmlk');
@$core.Deprecated('Use requestReportDeleteDescriptor instead')
const RequestReportDelete$json = const {
  '1': 'RequestReportDelete',
  '2': const [
    const {'1': 'reportkey', '3': 1, '4': 1, '5': 9, '10': 'reportkey'},
  ],
};

/// Descriptor for `RequestReportDelete`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestReportDeleteDescriptor = $convert.base64Decode('ChNSZXF1ZXN0UmVwb3J0RGVsZXRlEhwKCXJlcG9ydGtleRgBIAEoCVIJcmVwb3J0a2V5');
@$core.Deprecated('Use requestReportDescriptor instead')
const RequestReport$json = const {
  '1': 'RequestReport',
  '2': const [
    const {'1': 'reportkey', '3': 1, '4': 1, '5': 9, '10': 'reportkey'},
    const {'1': 'orientation', '3': 2, '4': 1, '5': 14, '6': '.nervatura.ReportOrientation', '10': 'orientation'},
    const {'1': 'size', '3': 3, '4': 1, '5': 14, '6': '.nervatura.ReportSize', '10': 'size'},
    const {'1': 'output', '3': 4, '4': 1, '5': 14, '6': '.nervatura.ReportOutput', '10': 'output'},
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.nervatura.ReportType', '10': 'type'},
    const {'1': 'refnumber', '3': 6, '4': 1, '5': 9, '10': 'refnumber'},
    const {'1': 'template', '3': 7, '4': 1, '5': 9, '10': 'template'},
    const {'1': 'filters', '3': 8, '4': 3, '5': 11, '6': '.nervatura.RequestReport.FiltersEntry', '10': 'filters'},
  ],
  '3': const [RequestReport_FiltersEntry$json],
};

@$core.Deprecated('Use requestReportDescriptor instead')
const RequestReport_FiltersEntry$json = const {
  '1': 'FiltersEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.nervatura.Value', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `RequestReport`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestReportDescriptor = $convert.base64Decode('Cg1SZXF1ZXN0UmVwb3J0EhwKCXJlcG9ydGtleRgBIAEoCVIJcmVwb3J0a2V5Ej4KC29yaWVudGF0aW9uGAIgASgOMhwubmVydmF0dXJhLlJlcG9ydE9yaWVudGF0aW9uUgtvcmllbnRhdGlvbhIpCgRzaXplGAMgASgOMhUubmVydmF0dXJhLlJlcG9ydFNpemVSBHNpemUSLwoGb3V0cHV0GAQgASgOMhcubmVydmF0dXJhLlJlcG9ydE91dHB1dFIGb3V0cHV0EikKBHR5cGUYBSABKA4yFS5uZXJ2YXR1cmEuUmVwb3J0VHlwZVIEdHlwZRIcCglyZWZudW1iZXIYBiABKAlSCXJlZm51bWJlchIaCgh0ZW1wbGF0ZRgHIAEoCVIIdGVtcGxhdGUSPwoHZmlsdGVycxgIIAMoCzIlLm5lcnZhdHVyYS5SZXF1ZXN0UmVwb3J0LkZpbHRlcnNFbnRyeVIHZmlsdGVycxpMCgxGaWx0ZXJzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSJgoFdmFsdWUYAiABKAsyEC5uZXJ2YXR1cmEuVmFsdWVSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use responseReportDescriptor instead')
const ResponseReport$json = const {
  '1': 'ResponseReport',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `ResponseReport`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseReportDescriptor = $convert.base64Decode('Cg5SZXNwb25zZVJlcG9ydBIUCgV2YWx1ZRgBIAEoDFIFdmFsdWU=');
@$core.Deprecated('Use requestUpdateDescriptor instead')
const RequestUpdate$json = const {
  '1': 'RequestUpdate',
  '2': const [
    const {'1': 'nervatype', '3': 1, '4': 1, '5': 14, '6': '.nervatura.DataType', '10': 'nervatype'},
    const {'1': 'items', '3': 2, '4': 3, '5': 11, '6': '.nervatura.RequestUpdate.Item', '10': 'items'},
  ],
  '3': const [RequestUpdate_Item$json],
};

@$core.Deprecated('Use requestUpdateDescriptor instead')
const RequestUpdate_Item$json = const {
  '1': 'Item',
  '2': const [
    const {'1': 'values', '3': 1, '4': 3, '5': 11, '6': '.nervatura.RequestUpdate.Item.ValuesEntry', '10': 'values'},
    const {'1': 'keys', '3': 2, '4': 3, '5': 11, '6': '.nervatura.RequestUpdate.Item.KeysEntry', '10': 'keys'},
  ],
  '3': const [RequestUpdate_Item_ValuesEntry$json, RequestUpdate_Item_KeysEntry$json],
};

@$core.Deprecated('Use requestUpdateDescriptor instead')
const RequestUpdate_Item_ValuesEntry$json = const {
  '1': 'ValuesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.nervatura.Value', '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use requestUpdateDescriptor instead')
const RequestUpdate_Item_KeysEntry$json = const {
  '1': 'KeysEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.nervatura.Value', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `RequestUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestUpdateDescriptor = $convert.base64Decode('Cg1SZXF1ZXN0VXBkYXRlEjEKCW5lcnZhdHlwZRgBIAEoDjITLm5lcnZhdHVyYS5EYXRhVHlwZVIJbmVydmF0eXBlEjMKBWl0ZW1zGAIgAygLMh0ubmVydmF0dXJhLlJlcXVlc3RVcGRhdGUuSXRlbVIFaXRlbXMangIKBEl0ZW0SQQoGdmFsdWVzGAEgAygLMikubmVydmF0dXJhLlJlcXVlc3RVcGRhdGUuSXRlbS5WYWx1ZXNFbnRyeVIGdmFsdWVzEjsKBGtleXMYAiADKAsyJy5uZXJ2YXR1cmEuUmVxdWVzdFVwZGF0ZS5JdGVtLktleXNFbnRyeVIEa2V5cxpLCgtWYWx1ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRImCgV2YWx1ZRgCIAEoCzIQLm5lcnZhdHVyYS5WYWx1ZVIFdmFsdWU6AjgBGkkKCUtleXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRImCgV2YWx1ZRgCIAEoCzIQLm5lcnZhdHVyYS5WYWx1ZVIFdmFsdWU6AjgB');
@$core.Deprecated('Use responseUpdateDescriptor instead')
const ResponseUpdate$json = const {
  '1': 'ResponseUpdate',
  '2': const [
    const {'1': 'values', '3': 1, '4': 3, '5': 3, '10': 'values'},
  ],
};

/// Descriptor for `ResponseUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseUpdateDescriptor = $convert.base64Decode('Cg5SZXNwb25zZVVwZGF0ZRIWCgZ2YWx1ZXMYASADKANSBnZhbHVlcw==');
@$core.Deprecated('Use requestGetDescriptor instead')
const RequestGet$json = const {
  '1': 'RequestGet',
  '2': const [
    const {'1': 'nervatype', '3': 1, '4': 1, '5': 14, '6': '.nervatura.DataType', '10': 'nervatype'},
    const {'1': 'metadata', '3': 2, '4': 1, '5': 8, '10': 'metadata'},
    const {'1': 'ids', '3': 3, '4': 3, '5': 3, '10': 'ids'},
    const {'1': 'filter', '3': 7, '4': 3, '5': 9, '10': 'filter'},
  ],
};

/// Descriptor for `RequestGet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestGetDescriptor = $convert.base64Decode('CgpSZXF1ZXN0R2V0EjEKCW5lcnZhdHlwZRgBIAEoDjITLm5lcnZhdHVyYS5EYXRhVHlwZVIJbmVydmF0eXBlEhoKCG1ldGFkYXRhGAIgASgIUghtZXRhZGF0YRIQCgNpZHMYAyADKANSA2lkcxIWCgZmaWx0ZXIYByADKAlSBmZpbHRlcg==');
@$core.Deprecated('Use responseGetDescriptor instead')
const ResponseGet$json = const {
  '1': 'ResponseGet',
  '2': const [
    const {'1': 'values', '3': 1, '4': 3, '5': 11, '6': '.nervatura.ResponseGet.Value', '10': 'values'},
  ],
  '3': const [ResponseGet_Value$json],
};

@$core.Deprecated('Use responseGetDescriptor instead')
const ResponseGet_Value$json = const {
  '1': 'Value',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 11, '6': '.nervatura.Address', '9': 0, '10': 'address'},
    const {'1': 'barcode', '3': 2, '4': 1, '5': 11, '6': '.nervatura.Barcode', '9': 0, '10': 'barcode'},
    const {'1': 'contact', '3': 3, '4': 1, '5': 11, '6': '.nervatura.Contact', '9': 0, '10': 'contact'},
    const {'1': 'currency', '3': 4, '4': 1, '5': 11, '6': '.nervatura.Currency', '9': 0, '10': 'currency'},
    const {'1': 'customer', '3': 5, '4': 1, '5': 11, '6': '.nervatura.Customer', '9': 0, '10': 'customer'},
    const {'1': 'deffield', '3': 6, '4': 1, '5': 11, '6': '.nervatura.Deffield', '9': 0, '10': 'deffield'},
    const {'1': 'employee', '3': 7, '4': 1, '5': 11, '6': '.nervatura.Employee', '9': 0, '10': 'employee'},
    const {'1': 'event', '3': 8, '4': 1, '5': 11, '6': '.nervatura.Event', '9': 0, '10': 'event'},
    const {'1': 'fieldvalue', '3': 9, '4': 1, '5': 11, '6': '.nervatura.Fieldvalue', '9': 0, '10': 'fieldvalue'},
    const {'1': 'groups', '3': 10, '4': 1, '5': 11, '6': '.nervatura.Groups', '9': 0, '10': 'groups'},
    const {'1': 'item', '3': 11, '4': 1, '5': 11, '6': '.nervatura.Item', '9': 0, '10': 'item'},
    const {'1': 'link', '3': 12, '4': 1, '5': 11, '6': '.nervatura.Link', '9': 0, '10': 'link'},
    const {'1': 'log', '3': 13, '4': 1, '5': 11, '6': '.nervatura.Log', '9': 0, '10': 'log'},
    const {'1': 'movement', '3': 14, '4': 1, '5': 11, '6': '.nervatura.Movement', '9': 0, '10': 'movement'},
    const {'1': 'numberdef', '3': 15, '4': 1, '5': 11, '6': '.nervatura.Numberdef', '9': 0, '10': 'numberdef'},
    const {'1': 'pattern', '3': 16, '4': 1, '5': 11, '6': '.nervatura.Pattern', '9': 0, '10': 'pattern'},
    const {'1': 'payment', '3': 17, '4': 1, '5': 11, '6': '.nervatura.Payment', '9': 0, '10': 'payment'},
    const {'1': 'place', '3': 18, '4': 1, '5': 11, '6': '.nervatura.Place', '9': 0, '10': 'place'},
    const {'1': 'price', '3': 19, '4': 1, '5': 11, '6': '.nervatura.Price', '9': 0, '10': 'price'},
    const {'1': 'product', '3': 20, '4': 1, '5': 11, '6': '.nervatura.Product', '9': 0, '10': 'product'},
    const {'1': 'project', '3': 21, '4': 1, '5': 11, '6': '.nervatura.Project', '9': 0, '10': 'project'},
    const {'1': 'rate', '3': 22, '4': 1, '5': 11, '6': '.nervatura.Rate', '9': 0, '10': 'rate'},
    const {'1': 'tax', '3': 23, '4': 1, '5': 11, '6': '.nervatura.Tax', '9': 0, '10': 'tax'},
    const {'1': 'tool', '3': 24, '4': 1, '5': 11, '6': '.nervatura.Tool', '9': 0, '10': 'tool'},
    const {'1': 'trans', '3': 25, '4': 1, '5': 11, '6': '.nervatura.Trans', '9': 0, '10': 'trans'},
    const {'1': 'ui_audit', '3': 26, '4': 1, '5': 11, '6': '.nervatura.UiAudit', '9': 0, '10': 'uiAudit'},
    const {'1': 'ui_menu', '3': 27, '4': 1, '5': 11, '6': '.nervatura.UiMenu', '9': 0, '10': 'uiMenu'},
    const {'1': 'ui_menufields', '3': 28, '4': 1, '5': 11, '6': '.nervatura.UiMenufields', '9': 0, '10': 'uiMenufields'},
    const {'1': 'ui_message', '3': 29, '4': 1, '5': 11, '6': '.nervatura.UiMessage', '9': 0, '10': 'uiMessage'},
    const {'1': 'ui_printqueue', '3': 30, '4': 1, '5': 11, '6': '.nervatura.UiPrintqueue', '9': 0, '10': 'uiPrintqueue'},
    const {'1': 'ui_report', '3': 31, '4': 1, '5': 11, '6': '.nervatura.UiReport', '9': 0, '10': 'uiReport'},
    const {'1': 'ui_userconfig', '3': 32, '4': 1, '5': 11, '6': '.nervatura.UiUserconfig', '9': 0, '10': 'uiUserconfig'},
  ],
  '8': const [
    const {'1': 'value'},
  ],
};

/// Descriptor for `ResponseGet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseGetDescriptor = $convert.base64Decode('CgtSZXNwb25zZUdldBI0CgZ2YWx1ZXMYASADKAsyHC5uZXJ2YXR1cmEuUmVzcG9uc2VHZXQuVmFsdWVSBnZhbHVlcxqRDAoFVmFsdWUSLgoHYWRkcmVzcxgBIAEoCzISLm5lcnZhdHVyYS5BZGRyZXNzSABSB2FkZHJlc3MSLgoHYmFyY29kZRgCIAEoCzISLm5lcnZhdHVyYS5CYXJjb2RlSABSB2JhcmNvZGUSLgoHY29udGFjdBgDIAEoCzISLm5lcnZhdHVyYS5Db250YWN0SABSB2NvbnRhY3QSMQoIY3VycmVuY3kYBCABKAsyEy5uZXJ2YXR1cmEuQ3VycmVuY3lIAFIIY3VycmVuY3kSMQoIY3VzdG9tZXIYBSABKAsyEy5uZXJ2YXR1cmEuQ3VzdG9tZXJIAFIIY3VzdG9tZXISMQoIZGVmZmllbGQYBiABKAsyEy5uZXJ2YXR1cmEuRGVmZmllbGRIAFIIZGVmZmllbGQSMQoIZW1wbG95ZWUYByABKAsyEy5uZXJ2YXR1cmEuRW1wbG95ZWVIAFIIZW1wbG95ZWUSKAoFZXZlbnQYCCABKAsyEC5uZXJ2YXR1cmEuRXZlbnRIAFIFZXZlbnQSNwoKZmllbGR2YWx1ZRgJIAEoCzIVLm5lcnZhdHVyYS5GaWVsZHZhbHVlSABSCmZpZWxkdmFsdWUSKwoGZ3JvdXBzGAogASgLMhEubmVydmF0dXJhLkdyb3Vwc0gAUgZncm91cHMSJQoEaXRlbRgLIAEoCzIPLm5lcnZhdHVyYS5JdGVtSABSBGl0ZW0SJQoEbGluaxgMIAEoCzIPLm5lcnZhdHVyYS5MaW5rSABSBGxpbmsSIgoDbG9nGA0gASgLMg4ubmVydmF0dXJhLkxvZ0gAUgNsb2cSMQoIbW92ZW1lbnQYDiABKAsyEy5uZXJ2YXR1cmEuTW92ZW1lbnRIAFIIbW92ZW1lbnQSNAoJbnVtYmVyZGVmGA8gASgLMhQubmVydmF0dXJhLk51bWJlcmRlZkgAUgludW1iZXJkZWYSLgoHcGF0dGVybhgQIAEoCzISLm5lcnZhdHVyYS5QYXR0ZXJuSABSB3BhdHRlcm4SLgoHcGF5bWVudBgRIAEoCzISLm5lcnZhdHVyYS5QYXltZW50SABSB3BheW1lbnQSKAoFcGxhY2UYEiABKAsyEC5uZXJ2YXR1cmEuUGxhY2VIAFIFcGxhY2USKAoFcHJpY2UYEyABKAsyEC5uZXJ2YXR1cmEuUHJpY2VIAFIFcHJpY2USLgoHcHJvZHVjdBgUIAEoCzISLm5lcnZhdHVyYS5Qcm9kdWN0SABSB3Byb2R1Y3QSLgoHcHJvamVjdBgVIAEoCzISLm5lcnZhdHVyYS5Qcm9qZWN0SABSB3Byb2plY3QSJQoEcmF0ZRgWIAEoCzIPLm5lcnZhdHVyYS5SYXRlSABSBHJhdGUSIgoDdGF4GBcgASgLMg4ubmVydmF0dXJhLlRheEgAUgN0YXgSJQoEdG9vbBgYIAEoCzIPLm5lcnZhdHVyYS5Ub29sSABSBHRvb2wSKAoFdHJhbnMYGSABKAsyEC5uZXJ2YXR1cmEuVHJhbnNIAFIFdHJhbnMSLwoIdWlfYXVkaXQYGiABKAsyEi5uZXJ2YXR1cmEuVWlBdWRpdEgAUgd1aUF1ZGl0EiwKB3VpX21lbnUYGyABKAsyES5uZXJ2YXR1cmEuVWlNZW51SABSBnVpTWVudRI+Cg11aV9tZW51ZmllbGRzGBwgASgLMhcubmVydmF0dXJhLlVpTWVudWZpZWxkc0gAUgx1aU1lbnVmaWVsZHMSNQoKdWlfbWVzc2FnZRgdIAEoCzIULm5lcnZhdHVyYS5VaU1lc3NhZ2VIAFIJdWlNZXNzYWdlEj4KDXVpX3ByaW50cXVldWUYHiABKAsyFy5uZXJ2YXR1cmEuVWlQcmludHF1ZXVlSABSDHVpUHJpbnRxdWV1ZRIyCgl1aV9yZXBvcnQYHyABKAsyEy5uZXJ2YXR1cmEuVWlSZXBvcnRIAFIIdWlSZXBvcnQSPgoNdWlfdXNlcmNvbmZpZxggIAEoCzIXLm5lcnZhdHVyYS5VaVVzZXJjb25maWdIAFIMdWlVc2VyY29uZmlnQgcKBXZhbHVl');
@$core.Deprecated('Use metaDataDescriptor instead')
const MetaData$json = const {
  '1': 'MetaData',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'fieldname', '3': 2, '4': 1, '5': 9, '10': 'fieldname'},
    const {'1': 'fieldtype', '3': 3, '4': 1, '5': 9, '10': 'fieldtype'},
    const {'1': 'value', '3': 4, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'notes', '3': 5, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `MetaData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metaDataDescriptor = $convert.base64Decode('CghNZXRhRGF0YRIOCgJpZBgBIAEoA1ICaWQSHAoJZmllbGRuYW1lGAIgASgJUglmaWVsZG5hbWUSHAoJZmllbGR0eXBlGAMgASgJUglmaWVsZHR5cGUSFAoFdmFsdWUYBCABKAlSBXZhbHVlEhQKBW5vdGVzGAUgASgJUgVub3Rlcw==');
@$core.Deprecated('Use addressDescriptor instead')
const Address$json = const {
  '1': 'Address',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'nervatype', '3': 2, '4': 1, '5': 3, '10': 'nervatype'},
    const {'1': 'ref_id', '3': 3, '4': 1, '5': 3, '10': 'refId'},
    const {'1': 'country', '3': 4, '4': 1, '5': 9, '10': 'country'},
    const {'1': 'state', '3': 5, '4': 1, '5': 9, '10': 'state'},
    const {'1': 'zipcode', '3': 6, '4': 1, '5': 9, '10': 'zipcode'},
    const {'1': 'city', '3': 7, '4': 1, '5': 9, '10': 'city'},
    const {'1': 'street', '3': 8, '4': 1, '5': 9, '10': 'street'},
    const {'1': 'notes', '3': 9, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'metadata', '3': 10, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
};

/// Descriptor for `Address`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addressDescriptor = $convert.base64Decode('CgdBZGRyZXNzEg4KAmlkGAEgASgDUgJpZBIcCgluZXJ2YXR5cGUYAiABKANSCW5lcnZhdHlwZRIVCgZyZWZfaWQYAyABKANSBXJlZklkEhgKB2NvdW50cnkYBCABKAlSB2NvdW50cnkSFAoFc3RhdGUYBSABKAlSBXN0YXRlEhgKB3ppcGNvZGUYBiABKAlSB3ppcGNvZGUSEgoEY2l0eRgHIAEoCVIEY2l0eRIWCgZzdHJlZXQYCCABKAlSBnN0cmVldBIUCgVub3RlcxgJIAEoCVIFbm90ZXMSLwoIbWV0YWRhdGEYCiADKAsyEy5uZXJ2YXR1cmEuTWV0YURhdGFSCG1ldGFkYXRh');
@$core.Deprecated('Use barcodeDescriptor instead')
const Barcode$json = const {
  '1': 'Barcode',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'product_id', '3': 3, '4': 1, '5': 3, '10': 'productId'},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'barcodetype', '3': 5, '4': 1, '5': 3, '10': 'barcodetype'},
    const {'1': 'qty', '3': 6, '4': 1, '5': 1, '10': 'qty'},
    const {'1': 'defcode', '3': 7, '4': 1, '5': 8, '10': 'defcode'},
  ],
};

/// Descriptor for `Barcode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List barcodeDescriptor = $convert.base64Decode('CgdCYXJjb2RlEg4KAmlkGAEgASgDUgJpZBISCgRjb2RlGAIgASgJUgRjb2RlEh0KCnByb2R1Y3RfaWQYAyABKANSCXByb2R1Y3RJZBIgCgtkZXNjcmlwdGlvbhgEIAEoCVILZGVzY3JpcHRpb24SIAoLYmFyY29kZXR5cGUYBSABKANSC2JhcmNvZGV0eXBlEhAKA3F0eRgGIAEoAVIDcXR5EhgKB2RlZmNvZGUYByABKAhSB2RlZmNvZGU=');
@$core.Deprecated('Use contactDescriptor instead')
const Contact$json = const {
  '1': 'Contact',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'nervatype', '3': 2, '4': 1, '5': 3, '10': 'nervatype'},
    const {'1': 'ref_id', '3': 3, '4': 1, '5': 3, '10': 'refId'},
    const {'1': 'firstname', '3': 4, '4': 1, '5': 9, '10': 'firstname'},
    const {'1': 'surname', '3': 5, '4': 1, '5': 9, '10': 'surname'},
    const {'1': 'status', '3': 6, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'phone', '3': 7, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'fax', '3': 8, '4': 1, '5': 9, '10': 'fax'},
    const {'1': 'mobil', '3': 9, '4': 1, '5': 9, '10': 'mobil'},
    const {'1': 'email', '3': 10, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'notes', '3': 11, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'metadata', '3': 12, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
};

/// Descriptor for `Contact`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactDescriptor = $convert.base64Decode('CgdDb250YWN0Eg4KAmlkGAEgASgDUgJpZBIcCgluZXJ2YXR5cGUYAiABKANSCW5lcnZhdHlwZRIVCgZyZWZfaWQYAyABKANSBXJlZklkEhwKCWZpcnN0bmFtZRgEIAEoCVIJZmlyc3RuYW1lEhgKB3N1cm5hbWUYBSABKAlSB3N1cm5hbWUSFgoGc3RhdHVzGAYgASgJUgZzdGF0dXMSFAoFcGhvbmUYByABKAlSBXBob25lEhAKA2ZheBgIIAEoCVIDZmF4EhQKBW1vYmlsGAkgASgJUgVtb2JpbBIUCgVlbWFpbBgKIAEoCVIFZW1haWwSFAoFbm90ZXMYCyABKAlSBW5vdGVzEi8KCG1ldGFkYXRhGAwgAygLMhMubmVydmF0dXJhLk1ldGFEYXRhUghtZXRhZGF0YQ==');
@$core.Deprecated('Use currencyDescriptor instead')
const Currency$json = const {
  '1': 'Currency',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'curr', '3': 2, '4': 1, '5': 9, '10': 'curr'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'digit', '3': 4, '4': 1, '5': 3, '10': 'digit'},
    const {'1': 'defrate', '3': 5, '4': 1, '5': 1, '10': 'defrate'},
    const {'1': 'cround', '3': 6, '4': 1, '5': 3, '10': 'cround'},
    const {'1': 'metadata', '3': 7, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
};

/// Descriptor for `Currency`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List currencyDescriptor = $convert.base64Decode('CghDdXJyZW5jeRIOCgJpZBgBIAEoA1ICaWQSEgoEY3VychgCIAEoCVIEY3VychIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SFAoFZGlnaXQYBCABKANSBWRpZ2l0EhgKB2RlZnJhdGUYBSABKAFSB2RlZnJhdGUSFgoGY3JvdW5kGAYgASgDUgZjcm91bmQSLwoIbWV0YWRhdGEYByADKAsyEy5uZXJ2YXR1cmEuTWV0YURhdGFSCG1ldGFkYXRh');
@$core.Deprecated('Use customerDescriptor instead')
const Customer$json = const {
  '1': 'Customer',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'custtype', '3': 2, '4': 1, '5': 3, '10': 'custtype'},
    const {'1': 'custnumber', '3': 3, '4': 1, '5': 9, '10': 'custnumber'},
    const {'1': 'custname', '3': 4, '4': 1, '5': 9, '10': 'custname'},
    const {'1': 'taxnumber', '3': 5, '4': 1, '5': 9, '10': 'taxnumber'},
    const {'1': 'account', '3': 6, '4': 1, '5': 9, '10': 'account'},
    const {'1': 'notax', '3': 7, '4': 1, '5': 8, '10': 'notax'},
    const {'1': 'terms', '3': 8, '4': 1, '5': 3, '10': 'terms'},
    const {'1': 'creditlimit', '3': 9, '4': 1, '5': 1, '10': 'creditlimit'},
    const {'1': 'discount', '3': 10, '4': 1, '5': 1, '10': 'discount'},
    const {'1': 'notes', '3': 11, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'inactive', '3': 12, '4': 1, '5': 8, '10': 'inactive'},
    const {'1': 'metadata', '3': 13, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
};

/// Descriptor for `Customer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List customerDescriptor = $convert.base64Decode('CghDdXN0b21lchIOCgJpZBgBIAEoA1ICaWQSGgoIY3VzdHR5cGUYAiABKANSCGN1c3R0eXBlEh4KCmN1c3RudW1iZXIYAyABKAlSCmN1c3RudW1iZXISGgoIY3VzdG5hbWUYBCABKAlSCGN1c3RuYW1lEhwKCXRheG51bWJlchgFIAEoCVIJdGF4bnVtYmVyEhgKB2FjY291bnQYBiABKAlSB2FjY291bnQSFAoFbm90YXgYByABKAhSBW5vdGF4EhQKBXRlcm1zGAggASgDUgV0ZXJtcxIgCgtjcmVkaXRsaW1pdBgJIAEoAVILY3JlZGl0bGltaXQSGgoIZGlzY291bnQYCiABKAFSCGRpc2NvdW50EhQKBW5vdGVzGAsgASgJUgVub3RlcxIaCghpbmFjdGl2ZRgMIAEoCFIIaW5hY3RpdmUSLwoIbWV0YWRhdGEYDSADKAsyEy5uZXJ2YXR1cmEuTWV0YURhdGFSCG1ldGFkYXRh');
@$core.Deprecated('Use deffieldDescriptor instead')
const Deffield$json = const {
  '1': 'Deffield',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'fieldname', '3': 2, '4': 1, '5': 9, '10': 'fieldname'},
    const {'1': 'nervatype', '3': 3, '4': 1, '5': 3, '10': 'nervatype'},
    const {'1': 'subtype', '3': 4, '4': 1, '5': 3, '9': 0, '10': 'subtype', '17': true},
    const {'1': 'fieldtype', '3': 5, '4': 1, '5': 3, '10': 'fieldtype'},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'valuelist', '3': 7, '4': 1, '5': 9, '10': 'valuelist'},
    const {'1': 'addnew', '3': 8, '4': 1, '5': 8, '10': 'addnew'},
    const {'1': 'visible', '3': 9, '4': 1, '5': 8, '10': 'visible'},
    const {'1': 'readonly', '3': 10, '4': 1, '5': 8, '10': 'readonly'},
  ],
  '8': const [
    const {'1': '_subtype'},
  ],
};

/// Descriptor for `Deffield`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deffieldDescriptor = $convert.base64Decode('CghEZWZmaWVsZBIOCgJpZBgBIAEoA1ICaWQSHAoJZmllbGRuYW1lGAIgASgJUglmaWVsZG5hbWUSHAoJbmVydmF0eXBlGAMgASgDUgluZXJ2YXR5cGUSHQoHc3VidHlwZRgEIAEoA0gAUgdzdWJ0eXBliAEBEhwKCWZpZWxkdHlwZRgFIAEoA1IJZmllbGR0eXBlEiAKC2Rlc2NyaXB0aW9uGAYgASgJUgtkZXNjcmlwdGlvbhIcCgl2YWx1ZWxpc3QYByABKAlSCXZhbHVlbGlzdBIWCgZhZGRuZXcYCCABKAhSBmFkZG5ldxIYCgd2aXNpYmxlGAkgASgIUgd2aXNpYmxlEhoKCHJlYWRvbmx5GAogASgIUghyZWFkb25seUIKCghfc3VidHlwZQ==');
@$core.Deprecated('Use employeeDescriptor instead')
const Employee$json = const {
  '1': 'Employee',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'empnumber', '3': 2, '4': 1, '5': 9, '10': 'empnumber'},
    const {'1': 'username', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'username', '17': true},
    const {'1': 'usergroup', '3': 4, '4': 1, '5': 3, '10': 'usergroup'},
    const {'1': 'startdate', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'startdate', '17': true},
    const {'1': 'enddate', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'enddate', '17': true},
    const {'1': 'department', '3': 7, '4': 1, '5': 3, '9': 3, '10': 'department', '17': true},
    const {'1': 'registration_key', '3': 8, '4': 1, '5': 9, '10': 'registrationKey'},
    const {'1': 'inactive', '3': 9, '4': 1, '5': 8, '10': 'inactive'},
    const {'1': 'metadata', '3': 13, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
  '8': const [
    const {'1': '_username'},
    const {'1': '_startdate'},
    const {'1': '_enddate'},
    const {'1': '_department'},
  ],
};

/// Descriptor for `Employee`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List employeeDescriptor = $convert.base64Decode('CghFbXBsb3llZRIOCgJpZBgBIAEoA1ICaWQSHAoJZW1wbnVtYmVyGAIgASgJUgllbXBudW1iZXISHwoIdXNlcm5hbWUYAyABKAlIAFIIdXNlcm5hbWWIAQESHAoJdXNlcmdyb3VwGAQgASgDUgl1c2VyZ3JvdXASIQoJc3RhcnRkYXRlGAUgASgJSAFSCXN0YXJ0ZGF0ZYgBARIdCgdlbmRkYXRlGAYgASgJSAJSB2VuZGRhdGWIAQESIwoKZGVwYXJ0bWVudBgHIAEoA0gDUgpkZXBhcnRtZW50iAEBEikKEHJlZ2lzdHJhdGlvbl9rZXkYCCABKAlSD3JlZ2lzdHJhdGlvbktleRIaCghpbmFjdGl2ZRgJIAEoCFIIaW5hY3RpdmUSLwoIbWV0YWRhdGEYDSADKAsyEy5uZXJ2YXR1cmEuTWV0YURhdGFSCG1ldGFkYXRhQgsKCV91c2VybmFtZUIMCgpfc3RhcnRkYXRlQgoKCF9lbmRkYXRlQg0KC19kZXBhcnRtZW50');
@$core.Deprecated('Use eventDescriptor instead')
const Event$json = const {
  '1': 'Event',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'calnumber', '3': 2, '4': 1, '5': 9, '10': 'calnumber'},
    const {'1': 'nervatype', '3': 3, '4': 1, '5': 3, '10': 'nervatype'},
    const {'1': 'ref_id', '3': 4, '4': 1, '5': 3, '10': 'refId'},
    const {'1': 'uid', '3': 5, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'eventgroup', '3': 6, '4': 1, '5': 3, '9': 0, '10': 'eventgroup', '17': true},
    const {'1': 'fromdate', '3': 7, '4': 1, '5': 9, '10': 'fromdate'},
    const {'1': 'todate', '3': 8, '4': 1, '5': 9, '9': 1, '10': 'todate', '17': true},
    const {'1': 'subject', '3': 9, '4': 1, '5': 9, '10': 'subject'},
    const {'1': 'place', '3': 10, '4': 1, '5': 9, '10': 'place'},
    const {'1': 'description', '3': 11, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'metadata', '3': 12, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
  '8': const [
    const {'1': '_eventgroup'},
    const {'1': '_todate'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode('CgVFdmVudBIOCgJpZBgBIAEoA1ICaWQSHAoJY2FsbnVtYmVyGAIgASgJUgljYWxudW1iZXISHAoJbmVydmF0eXBlGAMgASgDUgluZXJ2YXR5cGUSFQoGcmVmX2lkGAQgASgDUgVyZWZJZBIQCgN1aWQYBSABKAlSA3VpZBIjCgpldmVudGdyb3VwGAYgASgDSABSCmV2ZW50Z3JvdXCIAQESGgoIZnJvbWRhdGUYByABKAlSCGZyb21kYXRlEhsKBnRvZGF0ZRgIIAEoCUgBUgZ0b2RhdGWIAQESGAoHc3ViamVjdBgJIAEoCVIHc3ViamVjdBIUCgVwbGFjZRgKIAEoCVIFcGxhY2USIAoLZGVzY3JpcHRpb24YCyABKAlSC2Rlc2NyaXB0aW9uEi8KCG1ldGFkYXRhGAwgAygLMhMubmVydmF0dXJhLk1ldGFEYXRhUghtZXRhZGF0YUINCgtfZXZlbnRncm91cEIJCgdfdG9kYXRl');
@$core.Deprecated('Use fieldvalueDescriptor instead')
const Fieldvalue$json = const {
  '1': 'Fieldvalue',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'fieldname', '3': 2, '4': 1, '5': 9, '10': 'fieldname'},
    const {'1': 'ref_id', '3': 3, '4': 1, '5': 3, '9': 0, '10': 'refId', '17': true},
    const {'1': 'value', '3': 4, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'notes', '3': 5, '4': 1, '5': 9, '10': 'notes'},
  ],
  '8': const [
    const {'1': '_ref_id'},
  ],
};

/// Descriptor for `Fieldvalue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldvalueDescriptor = $convert.base64Decode('CgpGaWVsZHZhbHVlEg4KAmlkGAEgASgDUgJpZBIcCglmaWVsZG5hbWUYAiABKAlSCWZpZWxkbmFtZRIaCgZyZWZfaWQYAyABKANIAFIFcmVmSWSIAQESFAoFdmFsdWUYBCABKAlSBXZhbHVlEhQKBW5vdGVzGAUgASgJUgVub3Rlc0IJCgdfcmVmX2lk');
@$core.Deprecated('Use groupsDescriptor instead')
const Groups$json = const {
  '1': 'Groups',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'groupname', '3': 2, '4': 1, '5': 9, '10': 'groupname'},
    const {'1': 'groupvalue', '3': 3, '4': 1, '5': 9, '10': 'groupvalue'},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'inactive', '3': 5, '4': 1, '5': 8, '10': 'inactive'},
  ],
};

/// Descriptor for `Groups`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupsDescriptor = $convert.base64Decode('CgZHcm91cHMSDgoCaWQYASABKANSAmlkEhwKCWdyb3VwbmFtZRgCIAEoCVIJZ3JvdXBuYW1lEh4KCmdyb3VwdmFsdWUYAyABKAlSCmdyb3VwdmFsdWUSIAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9uEhoKCGluYWN0aXZlGAUgASgIUghpbmFjdGl2ZQ==');
@$core.Deprecated('Use itemDescriptor instead')
const Item$json = const {
  '1': 'Item',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'trans_id', '3': 2, '4': 1, '5': 3, '10': 'transId'},
    const {'1': 'product_id', '3': 3, '4': 1, '5': 3, '10': 'productId'},
    const {'1': 'unit', '3': 4, '4': 1, '5': 9, '10': 'unit'},
    const {'1': 'qty', '3': 5, '4': 1, '5': 1, '10': 'qty'},
    const {'1': 'fxprice', '3': 6, '4': 1, '5': 1, '10': 'fxprice'},
    const {'1': 'netamount', '3': 7, '4': 1, '5': 1, '10': 'netamount'},
    const {'1': 'discount', '3': 8, '4': 1, '5': 1, '10': 'discount'},
    const {'1': 'tax_id', '3': 9, '4': 1, '5': 3, '10': 'taxId'},
    const {'1': 'vatamount', '3': 10, '4': 1, '5': 1, '10': 'vatamount'},
    const {'1': 'amount', '3': 11, '4': 1, '5': 1, '10': 'amount'},
    const {'1': 'description', '3': 12, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'deposit', '3': 13, '4': 1, '5': 8, '10': 'deposit'},
    const {'1': 'ownstock', '3': 14, '4': 1, '5': 1, '10': 'ownstock'},
    const {'1': 'actionprice', '3': 15, '4': 1, '5': 8, '10': 'actionprice'},
    const {'1': 'metadata', '3': 16, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
};

/// Descriptor for `Item`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List itemDescriptor = $convert.base64Decode('CgRJdGVtEg4KAmlkGAEgASgDUgJpZBIZCgh0cmFuc19pZBgCIAEoA1IHdHJhbnNJZBIdCgpwcm9kdWN0X2lkGAMgASgDUglwcm9kdWN0SWQSEgoEdW5pdBgEIAEoCVIEdW5pdBIQCgNxdHkYBSABKAFSA3F0eRIYCgdmeHByaWNlGAYgASgBUgdmeHByaWNlEhwKCW5ldGFtb3VudBgHIAEoAVIJbmV0YW1vdW50EhoKCGRpc2NvdW50GAggASgBUghkaXNjb3VudBIVCgZ0YXhfaWQYCSABKANSBXRheElkEhwKCXZhdGFtb3VudBgKIAEoAVIJdmF0YW1vdW50EhYKBmFtb3VudBgLIAEoAVIGYW1vdW50EiAKC2Rlc2NyaXB0aW9uGAwgASgJUgtkZXNjcmlwdGlvbhIYCgdkZXBvc2l0GA0gASgIUgdkZXBvc2l0EhoKCG93bnN0b2NrGA4gASgBUghvd25zdG9jaxIgCgthY3Rpb25wcmljZRgPIAEoCFILYWN0aW9ucHJpY2USLwoIbWV0YWRhdGEYECADKAsyEy5uZXJ2YXR1cmEuTWV0YURhdGFSCG1ldGFkYXRh');
@$core.Deprecated('Use linkDescriptor instead')
const Link$json = const {
  '1': 'Link',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'nervatype_1', '3': 2, '4': 1, '5': 3, '10': 'nervatype1'},
    const {'1': 'ref_id_1', '3': 3, '4': 1, '5': 3, '10': 'refId1'},
    const {'1': 'nervatype_2', '3': 4, '4': 1, '5': 3, '10': 'nervatype2'},
    const {'1': 'ref_id_2', '3': 5, '4': 1, '5': 3, '10': 'refId2'},
    const {'1': 'metadata', '3': 16, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
};

/// Descriptor for `Link`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linkDescriptor = $convert.base64Decode('CgRMaW5rEg4KAmlkGAEgASgDUgJpZBIfCgtuZXJ2YXR5cGVfMRgCIAEoA1IKbmVydmF0eXBlMRIYCghyZWZfaWRfMRgDIAEoA1IGcmVmSWQxEh8KC25lcnZhdHlwZV8yGAQgASgDUgpuZXJ2YXR5cGUyEhgKCHJlZl9pZF8yGAUgASgDUgZyZWZJZDISLwoIbWV0YWRhdGEYECADKAsyEy5uZXJ2YXR1cmEuTWV0YURhdGFSCG1ldGFkYXRh');
@$core.Deprecated('Use logDescriptor instead')
const Log$json = const {
  '1': 'Log',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'employee_id', '3': 2, '4': 1, '5': 3, '10': 'employeeId'},
    const {'1': 'crdate', '3': 3, '4': 1, '5': 9, '10': 'crdate'},
    const {'1': 'nervatype', '3': 4, '4': 1, '5': 3, '9': 0, '10': 'nervatype', '17': true},
    const {'1': 'ref_id', '3': 5, '4': 1, '5': 3, '9': 1, '10': 'refId', '17': true},
    const {'1': 'logstate', '3': 6, '4': 1, '5': 3, '10': 'logstate'},
    const {'1': 'metadata', '3': 16, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
  '8': const [
    const {'1': '_nervatype'},
    const {'1': '_ref_id'},
  ],
};

/// Descriptor for `Log`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logDescriptor = $convert.base64Decode('CgNMb2cSDgoCaWQYASABKANSAmlkEh8KC2VtcGxveWVlX2lkGAIgASgDUgplbXBsb3llZUlkEhYKBmNyZGF0ZRgDIAEoCVIGY3JkYXRlEiEKCW5lcnZhdHlwZRgEIAEoA0gAUgluZXJ2YXR5cGWIAQESGgoGcmVmX2lkGAUgASgDSAFSBXJlZklkiAEBEhoKCGxvZ3N0YXRlGAYgASgDUghsb2dzdGF0ZRIvCghtZXRhZGF0YRgQIAMoCzITLm5lcnZhdHVyYS5NZXRhRGF0YVIIbWV0YWRhdGFCDAoKX25lcnZhdHlwZUIJCgdfcmVmX2lk');
@$core.Deprecated('Use movementDescriptor instead')
const Movement$json = const {
  '1': 'Movement',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'trans_id', '3': 2, '4': 1, '5': 3, '10': 'transId'},
    const {'1': 'shippingdate', '3': 3, '4': 1, '5': 9, '10': 'shippingdate'},
    const {'1': 'movetype', '3': 4, '4': 1, '5': 3, '10': 'movetype'},
    const {'1': 'product_id', '3': 5, '4': 1, '5': 3, '9': 0, '10': 'productId', '17': true},
    const {'1': 'tool_id', '3': 6, '4': 1, '5': 3, '9': 1, '10': 'toolId', '17': true},
    const {'1': 'place_id', '3': 7, '4': 1, '5': 3, '9': 2, '10': 'placeId', '17': true},
    const {'1': 'qty', '3': 8, '4': 1, '5': 1, '10': 'qty'},
    const {'1': 'description', '3': 9, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'shared', '3': 10, '4': 1, '5': 8, '10': 'shared'},
    const {'1': 'metadata', '3': 16, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
  '8': const [
    const {'1': '_product_id'},
    const {'1': '_tool_id'},
    const {'1': '_place_id'},
  ],
};

/// Descriptor for `Movement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List movementDescriptor = $convert.base64Decode('CghNb3ZlbWVudBIOCgJpZBgBIAEoA1ICaWQSGQoIdHJhbnNfaWQYAiABKANSB3RyYW5zSWQSIgoMc2hpcHBpbmdkYXRlGAMgASgJUgxzaGlwcGluZ2RhdGUSGgoIbW92ZXR5cGUYBCABKANSCG1vdmV0eXBlEiIKCnByb2R1Y3RfaWQYBSABKANIAFIJcHJvZHVjdElkiAEBEhwKB3Rvb2xfaWQYBiABKANIAVIGdG9vbElkiAEBEh4KCHBsYWNlX2lkGAcgASgDSAJSB3BsYWNlSWSIAQESEAoDcXR5GAggASgBUgNxdHkSIAoLZGVzY3JpcHRpb24YCSABKAlSC2Rlc2NyaXB0aW9uEhYKBnNoYXJlZBgKIAEoCFIGc2hhcmVkEi8KCG1ldGFkYXRhGBAgAygLMhMubmVydmF0dXJhLk1ldGFEYXRhUghtZXRhZGF0YUINCgtfcHJvZHVjdF9pZEIKCghfdG9vbF9pZEILCglfcGxhY2VfaWQ=');
@$core.Deprecated('Use numberdefDescriptor instead')
const Numberdef$json = const {
  '1': 'Numberdef',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'numberkey', '3': 2, '4': 1, '5': 9, '10': 'numberkey'},
    const {'1': 'prefix', '3': 3, '4': 1, '5': 9, '10': 'prefix'},
    const {'1': 'curvalue', '3': 4, '4': 1, '5': 3, '10': 'curvalue'},
    const {'1': 'isyear', '3': 5, '4': 1, '5': 8, '10': 'isyear'},
    const {'1': 'sep', '3': 6, '4': 1, '5': 9, '10': 'sep'},
    const {'1': 'len', '3': 7, '4': 1, '5': 3, '10': 'len'},
    const {'1': 'description', '3': 8, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'visible', '3': 9, '4': 1, '5': 8, '10': 'visible'},
    const {'1': 'readonly', '3': 10, '4': 1, '5': 8, '10': 'readonly'},
    const {'1': 'orderby', '3': 11, '4': 1, '5': 3, '10': 'orderby'},
  ],
};

/// Descriptor for `Numberdef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List numberdefDescriptor = $convert.base64Decode('CglOdW1iZXJkZWYSDgoCaWQYASABKANSAmlkEhwKCW51bWJlcmtleRgCIAEoCVIJbnVtYmVya2V5EhYKBnByZWZpeBgDIAEoCVIGcHJlZml4EhoKCGN1cnZhbHVlGAQgASgDUghjdXJ2YWx1ZRIWCgZpc3llYXIYBSABKAhSBmlzeWVhchIQCgNzZXAYBiABKAlSA3NlcBIQCgNsZW4YByABKANSA2xlbhIgCgtkZXNjcmlwdGlvbhgIIAEoCVILZGVzY3JpcHRpb24SGAoHdmlzaWJsZRgJIAEoCFIHdmlzaWJsZRIaCghyZWFkb25seRgKIAEoCFIIcmVhZG9ubHkSGAoHb3JkZXJieRgLIAEoA1IHb3JkZXJieQ==');
@$core.Deprecated('Use patternDescriptor instead')
const Pattern$json = const {
  '1': 'Pattern',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'transtype', '3': 3, '4': 1, '5': 3, '10': 'transtype'},
    const {'1': 'notes', '3': 4, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'defpattern', '3': 5, '4': 1, '5': 8, '10': 'defpattern'},
  ],
};

/// Descriptor for `Pattern`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patternDescriptor = $convert.base64Decode('CgdQYXR0ZXJuEg4KAmlkGAEgASgDUgJpZBIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3JpcHRpb24SHAoJdHJhbnN0eXBlGAMgASgDUgl0cmFuc3R5cGUSFAoFbm90ZXMYBCABKAlSBW5vdGVzEh4KCmRlZnBhdHRlcm4YBSABKAhSCmRlZnBhdHRlcm4=');
@$core.Deprecated('Use paymentDescriptor instead')
const Payment$json = const {
  '1': 'Payment',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'trans_id', '3': 2, '4': 1, '5': 3, '10': 'transId'},
    const {'1': 'paiddate', '3': 3, '4': 1, '5': 9, '10': 'paiddate'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 1, '10': 'amount'},
    const {'1': 'notes', '3': 5, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'metadata', '3': 6, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
};

/// Descriptor for `Payment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentDescriptor = $convert.base64Decode('CgdQYXltZW50Eg4KAmlkGAEgASgDUgJpZBIZCgh0cmFuc19pZBgCIAEoA1IHdHJhbnNJZBIaCghwYWlkZGF0ZRgDIAEoCVIIcGFpZGRhdGUSFgoGYW1vdW50GAQgASgBUgZhbW91bnQSFAoFbm90ZXMYBSABKAlSBW5vdGVzEi8KCG1ldGFkYXRhGAYgAygLMhMubmVydmF0dXJhLk1ldGFEYXRhUghtZXRhZGF0YQ==');
@$core.Deprecated('Use placeDescriptor instead')
const Place$json = const {
  '1': 'Place',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'planumber', '3': 2, '4': 1, '5': 9, '10': 'planumber'},
    const {'1': 'placetype', '3': 3, '4': 1, '5': 3, '10': 'placetype'},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'curr', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'curr', '17': true},
    const {'1': 'defplace', '3': 6, '4': 1, '5': 8, '10': 'defplace'},
    const {'1': 'notes', '3': 7, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'inactive', '3': 8, '4': 1, '5': 8, '10': 'inactive'},
    const {'1': 'metadata', '3': 9, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
  '8': const [
    const {'1': '_curr'},
  ],
};

/// Descriptor for `Place`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeDescriptor = $convert.base64Decode('CgVQbGFjZRIOCgJpZBgBIAEoA1ICaWQSHAoJcGxhbnVtYmVyGAIgASgJUglwbGFudW1iZXISHAoJcGxhY2V0eXBlGAMgASgDUglwbGFjZXR5cGUSIAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9uEhcKBGN1cnIYBSABKAlIAFIEY3VycogBARIaCghkZWZwbGFjZRgGIAEoCFIIZGVmcGxhY2USFAoFbm90ZXMYByABKAlSBW5vdGVzEhoKCGluYWN0aXZlGAggASgIUghpbmFjdGl2ZRIvCghtZXRhZGF0YRgJIAMoCzITLm5lcnZhdHVyYS5NZXRhRGF0YVIIbWV0YWRhdGFCBwoFX2N1cnI=');
@$core.Deprecated('Use priceDescriptor instead')
const Price$json = const {
  '1': 'Price',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'product_id', '3': 2, '4': 1, '5': 3, '10': 'productId'},
    const {'1': 'validfrom', '3': 3, '4': 1, '5': 9, '10': 'validfrom'},
    const {'1': 'validto', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'validto', '17': true},
    const {'1': 'curr', '3': 5, '4': 1, '5': 9, '10': 'curr'},
    const {'1': 'qty', '3': 6, '4': 1, '5': 1, '10': 'qty'},
    const {'1': 'pricevalue', '3': 7, '4': 1, '5': 1, '10': 'pricevalue'},
    const {'1': 'vendorprice', '3': 8, '4': 1, '5': 8, '10': 'vendorprice'},
    const {'1': 'metadata', '3': 9, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
  '8': const [
    const {'1': '_validto'},
  ],
};

/// Descriptor for `Price`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List priceDescriptor = $convert.base64Decode('CgVQcmljZRIOCgJpZBgBIAEoA1ICaWQSHQoKcHJvZHVjdF9pZBgCIAEoA1IJcHJvZHVjdElkEhwKCXZhbGlkZnJvbRgDIAEoCVIJdmFsaWRmcm9tEh0KB3ZhbGlkdG8YBCABKAlIAFIHdmFsaWR0b4gBARISCgRjdXJyGAUgASgJUgRjdXJyEhAKA3F0eRgGIAEoAVIDcXR5Eh4KCnByaWNldmFsdWUYByABKAFSCnByaWNldmFsdWUSIAoLdmVuZG9ycHJpY2UYCCABKAhSC3ZlbmRvcnByaWNlEi8KCG1ldGFkYXRhGAkgAygLMhMubmVydmF0dXJhLk1ldGFEYXRhUghtZXRhZGF0YUIKCghfdmFsaWR0bw==');
@$core.Deprecated('Use productDescriptor instead')
const Product$json = const {
  '1': 'Product',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'partnumber', '3': 2, '4': 1, '5': 9, '10': 'partnumber'},
    const {'1': 'protype', '3': 3, '4': 1, '5': 3, '10': 'protype'},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'unit', '3': 5, '4': 1, '5': 9, '10': 'unit'},
    const {'1': 'tax_id', '3': 6, '4': 1, '5': 3, '10': 'taxId'},
    const {'1': 'notes', '3': 7, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'webitem', '3': 8, '4': 1, '5': 8, '10': 'webitem'},
    const {'1': 'inactive', '3': 9, '4': 1, '5': 8, '10': 'inactive'},
    const {'1': 'metadata', '3': 10, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
};

/// Descriptor for `Product`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productDescriptor = $convert.base64Decode('CgdQcm9kdWN0Eg4KAmlkGAEgASgDUgJpZBIeCgpwYXJ0bnVtYmVyGAIgASgJUgpwYXJ0bnVtYmVyEhgKB3Byb3R5cGUYAyABKANSB3Byb3R5cGUSIAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9uEhIKBHVuaXQYBSABKAlSBHVuaXQSFQoGdGF4X2lkGAYgASgDUgV0YXhJZBIUCgVub3RlcxgHIAEoCVIFbm90ZXMSGAoHd2ViaXRlbRgIIAEoCFIHd2ViaXRlbRIaCghpbmFjdGl2ZRgJIAEoCFIIaW5hY3RpdmUSLwoIbWV0YWRhdGEYCiADKAsyEy5uZXJ2YXR1cmEuTWV0YURhdGFSCG1ldGFkYXRh');
@$core.Deprecated('Use projectDescriptor instead')
const Project$json = const {
  '1': 'Project',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'pronumber', '3': 2, '4': 1, '5': 9, '10': 'pronumber'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'customer_id', '3': 4, '4': 1, '5': 3, '9': 0, '10': 'customerId', '17': true},
    const {'1': 'startdate', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'startdate', '17': true},
    const {'1': 'enddate', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'enddate', '17': true},
    const {'1': 'notes', '3': 7, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'inactive', '3': 8, '4': 1, '5': 8, '10': 'inactive'},
    const {'1': 'metadata', '3': 10, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
  '8': const [
    const {'1': '_customer_id'},
    const {'1': '_startdate'},
    const {'1': '_enddate'},
  ],
};

/// Descriptor for `Project`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectDescriptor = $convert.base64Decode('CgdQcm9qZWN0Eg4KAmlkGAEgASgDUgJpZBIcCglwcm9udW1iZXIYAiABKAlSCXByb251bWJlchIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SJAoLY3VzdG9tZXJfaWQYBCABKANIAFIKY3VzdG9tZXJJZIgBARIhCglzdGFydGRhdGUYBSABKAlIAVIJc3RhcnRkYXRliAEBEh0KB2VuZGRhdGUYBiABKAlIAlIHZW5kZGF0ZYgBARIUCgVub3RlcxgHIAEoCVIFbm90ZXMSGgoIaW5hY3RpdmUYCCABKAhSCGluYWN0aXZlEi8KCG1ldGFkYXRhGAogAygLMhMubmVydmF0dXJhLk1ldGFEYXRhUghtZXRhZGF0YUIOCgxfY3VzdG9tZXJfaWRCDAoKX3N0YXJ0ZGF0ZUIKCghfZW5kZGF0ZQ==');
@$core.Deprecated('Use rateDescriptor instead')
const Rate$json = const {
  '1': 'Rate',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'ratetype', '3': 2, '4': 1, '5': 3, '10': 'ratetype'},
    const {'1': 'ratedate', '3': 3, '4': 1, '5': 9, '10': 'ratedate'},
    const {'1': 'curr', '3': 4, '4': 1, '5': 9, '10': 'curr'},
    const {'1': 'place_id', '3': 5, '4': 1, '5': 3, '9': 0, '10': 'placeId', '17': true},
    const {'1': 'rategroup', '3': 6, '4': 1, '5': 3, '9': 1, '10': 'rategroup', '17': true},
    const {'1': 'ratevalue', '3': 7, '4': 1, '5': 1, '10': 'ratevalue'},
    const {'1': 'metadata', '3': 10, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
  '8': const [
    const {'1': '_place_id'},
    const {'1': '_rategroup'},
  ],
};

/// Descriptor for `Rate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rateDescriptor = $convert.base64Decode('CgRSYXRlEg4KAmlkGAEgASgDUgJpZBIaCghyYXRldHlwZRgCIAEoA1IIcmF0ZXR5cGUSGgoIcmF0ZWRhdGUYAyABKAlSCHJhdGVkYXRlEhIKBGN1cnIYBCABKAlSBGN1cnISHgoIcGxhY2VfaWQYBSABKANIAFIHcGxhY2VJZIgBARIhCglyYXRlZ3JvdXAYBiABKANIAVIJcmF0ZWdyb3VwiAEBEhwKCXJhdGV2YWx1ZRgHIAEoAVIJcmF0ZXZhbHVlEi8KCG1ldGFkYXRhGAogAygLMhMubmVydmF0dXJhLk1ldGFEYXRhUghtZXRhZGF0YUILCglfcGxhY2VfaWRCDAoKX3JhdGVncm91cA==');
@$core.Deprecated('Use taxDescriptor instead')
const Tax$json = const {
  '1': 'Tax',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'taxcode', '3': 2, '4': 1, '5': 9, '10': 'taxcode'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'rate', '3': 4, '4': 1, '5': 1, '10': 'rate'},
    const {'1': 'inactive', '3': 5, '4': 1, '5': 8, '10': 'inactive'},
    const {'1': 'metadata', '3': 10, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
};

/// Descriptor for `Tax`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taxDescriptor = $convert.base64Decode('CgNUYXgSDgoCaWQYASABKANSAmlkEhgKB3RheGNvZGUYAiABKAlSB3RheGNvZGUSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEhIKBHJhdGUYBCABKAFSBHJhdGUSGgoIaW5hY3RpdmUYBSABKAhSCGluYWN0aXZlEi8KCG1ldGFkYXRhGAogAygLMhMubmVydmF0dXJhLk1ldGFEYXRhUghtZXRhZGF0YQ==');
@$core.Deprecated('Use toolDescriptor instead')
const Tool$json = const {
  '1': 'Tool',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'serial', '3': 2, '4': 1, '5': 9, '10': 'serial'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'product_id', '3': 4, '4': 1, '5': 3, '10': 'productId'},
    const {'1': 'toolgroup', '3': 5, '4': 1, '5': 3, '9': 0, '10': 'toolgroup', '17': true},
    const {'1': 'notes', '3': 6, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'inactive', '3': 7, '4': 1, '5': 8, '10': 'inactive'},
    const {'1': 'metadata', '3': 10, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
  '8': const [
    const {'1': '_toolgroup'},
  ],
};

/// Descriptor for `Tool`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toolDescriptor = $convert.base64Decode('CgRUb29sEg4KAmlkGAEgASgDUgJpZBIWCgZzZXJpYWwYAiABKAlSBnNlcmlhbBIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SHQoKcHJvZHVjdF9pZBgEIAEoA1IJcHJvZHVjdElkEiEKCXRvb2xncm91cBgFIAEoA0gAUgl0b29sZ3JvdXCIAQESFAoFbm90ZXMYBiABKAlSBW5vdGVzEhoKCGluYWN0aXZlGAcgASgIUghpbmFjdGl2ZRIvCghtZXRhZGF0YRgKIAMoCzITLm5lcnZhdHVyYS5NZXRhRGF0YVIIbWV0YWRhdGFCDAoKX3Rvb2xncm91cA==');
@$core.Deprecated('Use transDescriptor instead')
const Trans$json = const {
  '1': 'Trans',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'transnumber', '3': 2, '4': 1, '5': 9, '10': 'transnumber'},
    const {'1': 'transtype', '3': 3, '4': 1, '5': 3, '10': 'transtype'},
    const {'1': 'direction', '3': 4, '4': 1, '5': 3, '10': 'direction'},
    const {'1': 'ref_transnumber', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'refTransnumber', '17': true},
    const {'1': 'crdate', '3': 6, '4': 1, '5': 9, '10': 'crdate'},
    const {'1': 'transdate', '3': 7, '4': 1, '5': 9, '10': 'transdate'},
    const {'1': 'duedate', '3': 8, '4': 1, '5': 9, '9': 1, '10': 'duedate', '17': true},
    const {'1': 'customer_id', '3': 9, '4': 1, '5': 3, '9': 2, '10': 'customerId', '17': true},
    const {'1': 'employee_id', '3': 10, '4': 1, '5': 3, '9': 3, '10': 'employeeId', '17': true},
    const {'1': 'department', '3': 11, '4': 1, '5': 3, '9': 4, '10': 'department', '17': true},
    const {'1': 'project_id', '3': 12, '4': 1, '5': 3, '9': 5, '10': 'projectId', '17': true},
    const {'1': 'place_id', '3': 13, '4': 1, '5': 3, '9': 6, '10': 'placeId', '17': true},
    const {'1': 'paidtype', '3': 14, '4': 1, '5': 3, '9': 7, '10': 'paidtype', '17': true},
    const {'1': 'curr', '3': 15, '4': 1, '5': 9, '9': 8, '10': 'curr', '17': true},
    const {'1': 'notax', '3': 16, '4': 1, '5': 8, '10': 'notax'},
    const {'1': 'paid', '3': 17, '4': 1, '5': 8, '10': 'paid'},
    const {'1': 'acrate', '3': 18, '4': 1, '5': 1, '10': 'acrate'},
    const {'1': 'notes', '3': 19, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'intnotes', '3': 20, '4': 1, '5': 9, '10': 'intnotes'},
    const {'1': 'fnote', '3': 21, '4': 1, '5': 9, '10': 'fnote'},
    const {'1': 'transtate', '3': 22, '4': 1, '5': 3, '10': 'transtate'},
    const {'1': 'closed', '3': 23, '4': 1, '5': 8, '10': 'closed'},
    const {'1': 'metadata', '3': 24, '4': 3, '5': 11, '6': '.nervatura.MetaData', '10': 'metadata'},
  ],
  '8': const [
    const {'1': '_ref_transnumber'},
    const {'1': '_duedate'},
    const {'1': '_customer_id'},
    const {'1': '_employee_id'},
    const {'1': '_department'},
    const {'1': '_project_id'},
    const {'1': '_place_id'},
    const {'1': '_paidtype'},
    const {'1': '_curr'},
  ],
};

/// Descriptor for `Trans`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transDescriptor = $convert.base64Decode('CgVUcmFucxIOCgJpZBgBIAEoA1ICaWQSIAoLdHJhbnNudW1iZXIYAiABKAlSC3RyYW5zbnVtYmVyEhwKCXRyYW5zdHlwZRgDIAEoA1IJdHJhbnN0eXBlEhwKCWRpcmVjdGlvbhgEIAEoA1IJZGlyZWN0aW9uEiwKD3JlZl90cmFuc251bWJlchgFIAEoCUgAUg5yZWZUcmFuc251bWJlcogBARIWCgZjcmRhdGUYBiABKAlSBmNyZGF0ZRIcCgl0cmFuc2RhdGUYByABKAlSCXRyYW5zZGF0ZRIdCgdkdWVkYXRlGAggASgJSAFSB2R1ZWRhdGWIAQESJAoLY3VzdG9tZXJfaWQYCSABKANIAlIKY3VzdG9tZXJJZIgBARIkCgtlbXBsb3llZV9pZBgKIAEoA0gDUgplbXBsb3llZUlkiAEBEiMKCmRlcGFydG1lbnQYCyABKANIBFIKZGVwYXJ0bWVudIgBARIiCgpwcm9qZWN0X2lkGAwgASgDSAVSCXByb2plY3RJZIgBARIeCghwbGFjZV9pZBgNIAEoA0gGUgdwbGFjZUlkiAEBEh8KCHBhaWR0eXBlGA4gASgDSAdSCHBhaWR0eXBliAEBEhcKBGN1cnIYDyABKAlICFIEY3VycogBARIUCgVub3RheBgQIAEoCFIFbm90YXgSEgoEcGFpZBgRIAEoCFIEcGFpZBIWCgZhY3JhdGUYEiABKAFSBmFjcmF0ZRIUCgVub3RlcxgTIAEoCVIFbm90ZXMSGgoIaW50bm90ZXMYFCABKAlSCGludG5vdGVzEhQKBWZub3RlGBUgASgJUgVmbm90ZRIcCgl0cmFuc3RhdGUYFiABKANSCXRyYW5zdGF0ZRIWCgZjbG9zZWQYFyABKAhSBmNsb3NlZBIvCghtZXRhZGF0YRgYIAMoCzITLm5lcnZhdHVyYS5NZXRhRGF0YVIIbWV0YWRhdGFCEgoQX3JlZl90cmFuc251bWJlckIKCghfZHVlZGF0ZUIOCgxfY3VzdG9tZXJfaWRCDgoMX2VtcGxveWVlX2lkQg0KC19kZXBhcnRtZW50Qg0KC19wcm9qZWN0X2lkQgsKCV9wbGFjZV9pZEILCglfcGFpZHR5cGVCBwoFX2N1cnI=');
@$core.Deprecated('Use uiAuditDescriptor instead')
const UiAudit$json = const {
  '1': 'UiAudit',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'usergroup', '3': 2, '4': 1, '5': 3, '10': 'usergroup'},
    const {'1': 'nervatype', '3': 3, '4': 1, '5': 3, '10': 'nervatype'},
    const {'1': 'subtype', '3': 4, '4': 1, '5': 3, '9': 0, '10': 'subtype', '17': true},
    const {'1': 'inputfilter', '3': 5, '4': 1, '5': 3, '10': 'inputfilter'},
    const {'1': 'supervisor', '3': 6, '4': 1, '5': 8, '10': 'supervisor'},
  ],
  '8': const [
    const {'1': '_subtype'},
  ],
};

/// Descriptor for `UiAudit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uiAuditDescriptor = $convert.base64Decode('CgdVaUF1ZGl0Eg4KAmlkGAEgASgDUgJpZBIcCgl1c2VyZ3JvdXAYAiABKANSCXVzZXJncm91cBIcCgluZXJ2YXR5cGUYAyABKANSCW5lcnZhdHlwZRIdCgdzdWJ0eXBlGAQgASgDSABSB3N1YnR5cGWIAQESIAoLaW5wdXRmaWx0ZXIYBSABKANSC2lucHV0ZmlsdGVyEh4KCnN1cGVydmlzb3IYBiABKAhSCnN1cGVydmlzb3JCCgoIX3N1YnR5cGU=');
@$core.Deprecated('Use uiMenuDescriptor instead')
const UiMenu$json = const {
  '1': 'UiMenu',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'menukey', '3': 2, '4': 1, '5': 9, '10': 'menukey'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'modul', '3': 4, '4': 1, '5': 9, '10': 'modul'},
    const {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'method', '3': 6, '4': 1, '5': 3, '10': 'method'},
    const {'1': 'funcname', '3': 7, '4': 1, '5': 9, '10': 'funcname'},
    const {'1': 'address', '3': 8, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `UiMenu`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uiMenuDescriptor = $convert.base64Decode('CgZVaU1lbnUSDgoCaWQYASABKANSAmlkEhgKB21lbnVrZXkYAiABKAlSB21lbnVrZXkSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEhQKBW1vZHVsGAQgASgJUgVtb2R1bBISCgRpY29uGAUgASgJUgRpY29uEhYKBm1ldGhvZBgGIAEoA1IGbWV0aG9kEhoKCGZ1bmNuYW1lGAcgASgJUghmdW5jbmFtZRIYCgdhZGRyZXNzGAggASgJUgdhZGRyZXNz');
@$core.Deprecated('Use uiMenufieldsDescriptor instead')
const UiMenufields$json = const {
  '1': 'UiMenufields',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'menu_id', '3': 2, '4': 1, '5': 3, '10': 'menuId'},
    const {'1': 'fieldname', '3': 3, '4': 1, '5': 9, '10': 'fieldname'},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'fieldtype', '3': 5, '4': 1, '5': 3, '10': 'fieldtype'},
    const {'1': 'orderby', '3': 6, '4': 1, '5': 3, '10': 'orderby'},
  ],
};

/// Descriptor for `UiMenufields`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uiMenufieldsDescriptor = $convert.base64Decode('CgxVaU1lbnVmaWVsZHMSDgoCaWQYASABKANSAmlkEhcKB21lbnVfaWQYAiABKANSBm1lbnVJZBIcCglmaWVsZG5hbWUYAyABKAlSCWZpZWxkbmFtZRIgCgtkZXNjcmlwdGlvbhgEIAEoCVILZGVzY3JpcHRpb24SHAoJZmllbGR0eXBlGAUgASgDUglmaWVsZHR5cGUSGAoHb3JkZXJieRgGIAEoA1IHb3JkZXJieQ==');
@$core.Deprecated('Use uiMessageDescriptor instead')
const UiMessage$json = const {
  '1': 'UiMessage',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'secname', '3': 2, '4': 1, '5': 9, '10': 'secname'},
    const {'1': 'fieldname', '3': 3, '4': 1, '5': 9, '10': 'fieldname'},
    const {'1': 'lang', '3': 4, '4': 1, '5': 9, '10': 'lang'},
    const {'1': 'msg', '3': 5, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `UiMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uiMessageDescriptor = $convert.base64Decode('CglVaU1lc3NhZ2USDgoCaWQYASABKANSAmlkEhgKB3NlY25hbWUYAiABKAlSB3NlY25hbWUSHAoJZmllbGRuYW1lGAMgASgJUglmaWVsZG5hbWUSEgoEbGFuZxgEIAEoCVIEbGFuZxIQCgNtc2cYBSABKAlSA21zZw==');
@$core.Deprecated('Use uiPrintqueueDescriptor instead')
const UiPrintqueue$json = const {
  '1': 'UiPrintqueue',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'nervatype', '3': 2, '4': 1, '5': 3, '9': 0, '10': 'nervatype', '17': true},
    const {'1': 'ref_id', '3': 3, '4': 1, '5': 3, '10': 'refId'},
    const {'1': 'qty', '3': 4, '4': 1, '5': 1, '10': 'qty'},
    const {'1': 'employee_id', '3': 5, '4': 1, '5': 3, '9': 1, '10': 'employeeId', '17': true},
    const {'1': 'report_id', '3': 6, '4': 1, '5': 3, '10': 'reportId'},
    const {'1': 'crdate', '3': 7, '4': 1, '5': 9, '10': 'crdate'},
  ],
  '8': const [
    const {'1': '_nervatype'},
    const {'1': '_employee_id'},
  ],
};

/// Descriptor for `UiPrintqueue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uiPrintqueueDescriptor = $convert.base64Decode('CgxVaVByaW50cXVldWUSDgoCaWQYASABKANSAmlkEiEKCW5lcnZhdHlwZRgCIAEoA0gAUgluZXJ2YXR5cGWIAQESFQoGcmVmX2lkGAMgASgDUgVyZWZJZBIQCgNxdHkYBCABKAFSA3F0eRIkCgtlbXBsb3llZV9pZBgFIAEoA0gBUgplbXBsb3llZUlkiAEBEhsKCXJlcG9ydF9pZBgGIAEoA1IIcmVwb3J0SWQSFgoGY3JkYXRlGAcgASgJUgZjcmRhdGVCDAoKX25lcnZhdHlwZUIOCgxfZW1wbG95ZWVfaWQ=');
@$core.Deprecated('Use uiReportDescriptor instead')
const UiReport$json = const {
  '1': 'UiReport',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'reportkey', '3': 2, '4': 1, '5': 9, '10': 'reportkey'},
    const {'1': 'nervatype', '3': 3, '4': 1, '5': 3, '10': 'nervatype'},
    const {'1': 'transtype', '3': 4, '4': 1, '5': 3, '9': 0, '10': 'transtype', '17': true},
    const {'1': 'direction', '3': 5, '4': 1, '5': 3, '9': 1, '10': 'direction', '17': true},
    const {'1': 'repname', '3': 6, '4': 1, '5': 9, '10': 'repname'},
    const {'1': 'description', '3': 7, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'label', '3': 8, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'filetype', '3': 9, '4': 1, '5': 3, '10': 'filetype'},
    const {'1': 'report', '3': 10, '4': 1, '5': 9, '10': 'report'},
  ],
  '8': const [
    const {'1': '_transtype'},
    const {'1': '_direction'},
  ],
};

/// Descriptor for `UiReport`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uiReportDescriptor = $convert.base64Decode('CghVaVJlcG9ydBIOCgJpZBgBIAEoA1ICaWQSHAoJcmVwb3J0a2V5GAIgASgJUglyZXBvcnRrZXkSHAoJbmVydmF0eXBlGAMgASgDUgluZXJ2YXR5cGUSIQoJdHJhbnN0eXBlGAQgASgDSABSCXRyYW5zdHlwZYgBARIhCglkaXJlY3Rpb24YBSABKANIAVIJZGlyZWN0aW9uiAEBEhgKB3JlcG5hbWUYBiABKAlSB3JlcG5hbWUSIAoLZGVzY3JpcHRpb24YByABKAlSC2Rlc2NyaXB0aW9uEhQKBWxhYmVsGAggASgJUgVsYWJlbBIaCghmaWxldHlwZRgJIAEoA1IIZmlsZXR5cGUSFgoGcmVwb3J0GAogASgJUgZyZXBvcnRCDAoKX3RyYW5zdHlwZUIMCgpfZGlyZWN0aW9u');
@$core.Deprecated('Use uiUserconfigDescriptor instead')
const UiUserconfig$json = const {
  '1': 'UiUserconfig',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'employee_id', '3': 2, '4': 1, '5': 3, '9': 0, '10': 'employeeId', '17': true},
    const {'1': 'section', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'section', '17': true},
    const {'1': 'cfgroup', '3': 4, '4': 1, '5': 9, '10': 'cfgroup'},
    const {'1': 'cfname', '3': 5, '4': 1, '5': 9, '10': 'cfname'},
    const {'1': 'cfvalue', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'cfvalue', '17': true},
    const {'1': 'orderby', '3': 7, '4': 1, '5': 3, '10': 'orderby'},
  ],
  '8': const [
    const {'1': '_employee_id'},
    const {'1': '_section'},
    const {'1': '_cfvalue'},
  ],
};

/// Descriptor for `UiUserconfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uiUserconfigDescriptor = $convert.base64Decode('CgxVaVVzZXJjb25maWcSDgoCaWQYASABKANSAmlkEiQKC2VtcGxveWVlX2lkGAIgASgDSABSCmVtcGxveWVlSWSIAQESHQoHc2VjdGlvbhgDIAEoCUgBUgdzZWN0aW9uiAEBEhgKB2NmZ3JvdXAYBCABKAlSB2NmZ3JvdXASFgoGY2ZuYW1lGAUgASgJUgZjZm5hbWUSHQoHY2Z2YWx1ZRgGIAEoCUgCUgdjZnZhbHVliAEBEhgKB29yZGVyYnkYByABKANSB29yZGVyYnlCDgoMX2VtcGxveWVlX2lkQgoKCF9zZWN0aW9uQgoKCF9jZnZhbHVl');
