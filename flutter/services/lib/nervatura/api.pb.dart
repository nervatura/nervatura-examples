///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'api.pbenum.dart';

export 'api.pbenum.dart';

enum Value_Value {
  boolean, 
  number, 
  text, 
  notSet
}

class Value extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Value_Value> _Value_ValueByTag = {
    1 : Value_Value.boolean,
    2 : Value_Value.number,
    3 : Value_Value.text,
    0 : Value_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Value', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'boolean')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number', $pb.PbFieldType.OD)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..hasRequiredFields = false
  ;

  Value._() : super();
  factory Value({
    $core.bool? boolean,
    $core.double? number,
    $core.String? text,
  }) {
    final _result = create();
    if (boolean != null) {
      _result.boolean = boolean;
    }
    if (number != null) {
      _result.number = number;
    }
    if (text != null) {
      _result.text = text;
    }
    return _result;
  }
  factory Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Value clone() => Value()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Value copyWith(void Function(Value) updates) => super.copyWith((message) => updates(message as Value)) as Value; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Value create() => Value._();
  Value createEmptyInstance() => create();
  static $pb.PbList<Value> createRepeated() => $pb.PbList<Value>();
  @$core.pragma('dart2js:noInline')
  static Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Value>(create);
  static Value? _defaultInstance;

  Value_Value whichValue() => _Value_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.bool get boolean => $_getBF(0);
  @$pb.TagNumber(1)
  set boolean($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoolean() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoolean() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get number => $_getN(1);
  @$pb.TagNumber(2)
  set number($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(3)
  set text($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => clearField(3);
}

class ResponseRows_Item extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseRows.Item', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..m<$core.String, Value>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values', entryClassName: 'ResponseRows.Item.ValuesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Value.create, packageName: const $pb.PackageName('nervatura'))
    ..hasRequiredFields = false
  ;

  ResponseRows_Item._() : super();
  factory ResponseRows_Item({
    $core.Map<$core.String, Value>? values,
  }) {
    final _result = create();
    if (values != null) {
      _result.values.addAll(values);
    }
    return _result;
  }
  factory ResponseRows_Item.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseRows_Item.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseRows_Item clone() => ResponseRows_Item()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseRows_Item copyWith(void Function(ResponseRows_Item) updates) => super.copyWith((message) => updates(message as ResponseRows_Item)) as ResponseRows_Item; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseRows_Item create() => ResponseRows_Item._();
  ResponseRows_Item createEmptyInstance() => create();
  static $pb.PbList<ResponseRows_Item> createRepeated() => $pb.PbList<ResponseRows_Item>();
  @$core.pragma('dart2js:noInline')
  static ResponseRows_Item getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseRows_Item>(create);
  static ResponseRows_Item? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, Value> get values => $_getMap(0);
}

class ResponseRows extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseRows', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..pc<ResponseRows_Item>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: ResponseRows_Item.create)
    ..hasRequiredFields = false
  ;

  ResponseRows._() : super();
  factory ResponseRows({
    $core.Iterable<ResponseRows_Item>? items,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory ResponseRows.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseRows.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseRows clone() => ResponseRows()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseRows copyWith(void Function(ResponseRows) updates) => super.copyWith((message) => updates(message as ResponseRows)) as ResponseRows; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseRows create() => ResponseRows._();
  ResponseRows createEmptyInstance() => create();
  static $pb.PbList<ResponseRows> createRepeated() => $pb.PbList<ResponseRows>();
  @$core.pragma('dart2js:noInline')
  static ResponseRows getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseRows>(create);
  static ResponseRows? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ResponseRows_Item> get items => $_getList(0);
}

class RequestEmpty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestEmpty', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  RequestEmpty._() : super();
  factory RequestEmpty() => create();
  factory RequestEmpty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestEmpty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestEmpty clone() => RequestEmpty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestEmpty copyWith(void Function(RequestEmpty) updates) => super.copyWith((message) => updates(message as RequestEmpty)) as RequestEmpty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestEmpty create() => RequestEmpty._();
  RequestEmpty createEmptyInstance() => create();
  static $pb.PbList<RequestEmpty> createRepeated() => $pb.PbList<RequestEmpty>();
  @$core.pragma('dart2js:noInline')
  static RequestEmpty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestEmpty>(create);
  static RequestEmpty? _defaultInstance;
}

class ResponseEmpty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseEmpty', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ResponseEmpty._() : super();
  factory ResponseEmpty() => create();
  factory ResponseEmpty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseEmpty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseEmpty clone() => ResponseEmpty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseEmpty copyWith(void Function(ResponseEmpty) updates) => super.copyWith((message) => updates(message as ResponseEmpty)) as ResponseEmpty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseEmpty create() => ResponseEmpty._();
  ResponseEmpty createEmptyInstance() => create();
  static $pb.PbList<ResponseEmpty> createRepeated() => $pb.PbList<ResponseEmpty>();
  @$core.pragma('dart2js:noInline')
  static ResponseEmpty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseEmpty>(create);
  static ResponseEmpty? _defaultInstance;
}

class RequestUserLogin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestUserLogin', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'database')
    ..hasRequiredFields = false
  ;

  RequestUserLogin._() : super();
  factory RequestUserLogin({
    $core.String? username,
    $core.String? password,
    $core.String? database,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    if (password != null) {
      _result.password = password;
    }
    if (database != null) {
      _result.database = database;
    }
    return _result;
  }
  factory RequestUserLogin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestUserLogin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestUserLogin clone() => RequestUserLogin()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestUserLogin copyWith(void Function(RequestUserLogin) updates) => super.copyWith((message) => updates(message as RequestUserLogin)) as RequestUserLogin; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestUserLogin create() => RequestUserLogin._();
  RequestUserLogin createEmptyInstance() => create();
  static $pb.PbList<RequestUserLogin> createRepeated() => $pb.PbList<RequestUserLogin>();
  @$core.pragma('dart2js:noInline')
  static RequestUserLogin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestUserLogin>(create);
  static RequestUserLogin? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get database => $_getSZ(2);
  @$pb.TagNumber(3)
  set database($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDatabase() => $_has(2);
  @$pb.TagNumber(3)
  void clearDatabase() => clearField(3);
}

class ResponseUserLogin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseUserLogin', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'engine')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version')
    ..hasRequiredFields = false
  ;

  ResponseUserLogin._() : super();
  factory ResponseUserLogin({
    $core.String? token,
    $core.String? engine,
    $core.String? version,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    if (engine != null) {
      _result.engine = engine;
    }
    if (version != null) {
      _result.version = version;
    }
    return _result;
  }
  factory ResponseUserLogin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseUserLogin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseUserLogin clone() => ResponseUserLogin()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseUserLogin copyWith(void Function(ResponseUserLogin) updates) => super.copyWith((message) => updates(message as ResponseUserLogin)) as ResponseUserLogin; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseUserLogin create() => ResponseUserLogin._();
  ResponseUserLogin createEmptyInstance() => create();
  static $pb.PbList<ResponseUserLogin> createRepeated() => $pb.PbList<ResponseUserLogin>();
  @$core.pragma('dart2js:noInline')
  static ResponseUserLogin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseUserLogin>(create);
  static ResponseUserLogin? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get engine => $_getSZ(1);
  @$pb.TagNumber(2)
  set engine($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEngine() => $_has(1);
  @$pb.TagNumber(2)
  void clearEngine() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get version => $_getSZ(2);
  @$pb.TagNumber(3)
  set version($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);
}

class RequestTokenDecode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestTokenDecode', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..hasRequiredFields = false
  ;

  RequestTokenDecode._() : super();
  factory RequestTokenDecode({
    $core.String? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory RequestTokenDecode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestTokenDecode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestTokenDecode clone() => RequestTokenDecode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestTokenDecode copyWith(void Function(RequestTokenDecode) updates) => super.copyWith((message) => updates(message as RequestTokenDecode)) as RequestTokenDecode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestTokenDecode create() => RequestTokenDecode._();
  RequestTokenDecode createEmptyInstance() => create();
  static $pb.PbList<RequestTokenDecode> createRepeated() => $pb.PbList<RequestTokenDecode>();
  @$core.pragma('dart2js:noInline')
  static RequestTokenDecode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestTokenDecode>(create);
  static RequestTokenDecode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class ResponseTokenDecode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseTokenDecode', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'database')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exp', $pb.PbFieldType.OD)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iss')
    ..hasRequiredFields = false
  ;

  ResponseTokenDecode._() : super();
  factory ResponseTokenDecode({
    $core.String? username,
    $core.String? database,
    $core.double? exp,
    $core.String? iss,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    if (database != null) {
      _result.database = database;
    }
    if (exp != null) {
      _result.exp = exp;
    }
    if (iss != null) {
      _result.iss = iss;
    }
    return _result;
  }
  factory ResponseTokenDecode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseTokenDecode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseTokenDecode clone() => ResponseTokenDecode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseTokenDecode copyWith(void Function(ResponseTokenDecode) updates) => super.copyWith((message) => updates(message as ResponseTokenDecode)) as ResponseTokenDecode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseTokenDecode create() => ResponseTokenDecode._();
  ResponseTokenDecode createEmptyInstance() => create();
  static $pb.PbList<ResponseTokenDecode> createRepeated() => $pb.PbList<ResponseTokenDecode>();
  @$core.pragma('dart2js:noInline')
  static ResponseTokenDecode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseTokenDecode>(create);
  static ResponseTokenDecode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get database => $_getSZ(1);
  @$pb.TagNumber(2)
  set database($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDatabase() => $_has(1);
  @$pb.TagNumber(2)
  void clearDatabase() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get exp => $_getN(2);
  @$pb.TagNumber(3)
  set exp($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExp() => $_has(2);
  @$pb.TagNumber(3)
  void clearExp() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get iss => $_getSZ(3);
  @$pb.TagNumber(4)
  set iss($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIss() => $_has(3);
  @$pb.TagNumber(4)
  void clearIss() => clearField(4);
}

class ResponseTokenRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseTokenRefresh', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..hasRequiredFields = false
  ;

  ResponseTokenRefresh._() : super();
  factory ResponseTokenRefresh({
    $core.String? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ResponseTokenRefresh.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseTokenRefresh.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseTokenRefresh clone() => ResponseTokenRefresh()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseTokenRefresh copyWith(void Function(ResponseTokenRefresh) updates) => super.copyWith((message) => updates(message as ResponseTokenRefresh)) as ResponseTokenRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseTokenRefresh create() => ResponseTokenRefresh._();
  ResponseTokenRefresh createEmptyInstance() => create();
  static $pb.PbList<ResponseTokenRefresh> createRepeated() => $pb.PbList<ResponseTokenRefresh>();
  @$core.pragma('dart2js:noInline')
  static ResponseTokenRefresh getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseTokenRefresh>(create);
  static ResponseTokenRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class ResponseTokenLogin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseTokenLogin', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'empnumber')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usergroup')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scope')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'department')
    ..hasRequiredFields = false
  ;

  ResponseTokenLogin._() : super();
  factory ResponseTokenLogin({
    $fixnum.Int64? id,
    $core.String? username,
    $core.String? empnumber,
    $fixnum.Int64? usergroup,
    $core.String? scope,
    $core.String? department,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (username != null) {
      _result.username = username;
    }
    if (empnumber != null) {
      _result.empnumber = empnumber;
    }
    if (usergroup != null) {
      _result.usergroup = usergroup;
    }
    if (scope != null) {
      _result.scope = scope;
    }
    if (department != null) {
      _result.department = department;
    }
    return _result;
  }
  factory ResponseTokenLogin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseTokenLogin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseTokenLogin clone() => ResponseTokenLogin()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseTokenLogin copyWith(void Function(ResponseTokenLogin) updates) => super.copyWith((message) => updates(message as ResponseTokenLogin)) as ResponseTokenLogin; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseTokenLogin create() => ResponseTokenLogin._();
  ResponseTokenLogin createEmptyInstance() => create();
  static $pb.PbList<ResponseTokenLogin> createRepeated() => $pb.PbList<ResponseTokenLogin>();
  @$core.pragma('dart2js:noInline')
  static ResponseTokenLogin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseTokenLogin>(create);
  static ResponseTokenLogin? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get empnumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set empnumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmpnumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmpnumber() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get usergroup => $_getI64(3);
  @$pb.TagNumber(4)
  set usergroup($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUsergroup() => $_has(3);
  @$pb.TagNumber(4)
  void clearUsergroup() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get scope => $_getSZ(4);
  @$pb.TagNumber(5)
  set scope($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasScope() => $_has(4);
  @$pb.TagNumber(5)
  void clearScope() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get department => $_getSZ(5);
  @$pb.TagNumber(6)
  set department($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDepartment() => $_has(5);
  @$pb.TagNumber(6)
  void clearDepartment() => clearField(6);
}

class RequestUserPassword extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestUserPassword', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'confirm')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'custnumber')
    ..hasRequiredFields = false
  ;

  RequestUserPassword._() : super();
  factory RequestUserPassword({
    $core.String? password,
    $core.String? confirm,
    $core.String? username,
    $core.String? custnumber,
  }) {
    final _result = create();
    if (password != null) {
      _result.password = password;
    }
    if (confirm != null) {
      _result.confirm = confirm;
    }
    if (username != null) {
      _result.username = username;
    }
    if (custnumber != null) {
      _result.custnumber = custnumber;
    }
    return _result;
  }
  factory RequestUserPassword.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestUserPassword.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestUserPassword clone() => RequestUserPassword()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestUserPassword copyWith(void Function(RequestUserPassword) updates) => super.copyWith((message) => updates(message as RequestUserPassword)) as RequestUserPassword; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestUserPassword create() => RequestUserPassword._();
  RequestUserPassword createEmptyInstance() => create();
  static $pb.PbList<RequestUserPassword> createRepeated() => $pb.PbList<RequestUserPassword>();
  @$core.pragma('dart2js:noInline')
  static RequestUserPassword getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestUserPassword>(create);
  static RequestUserPassword? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get password => $_getSZ(0);
  @$pb.TagNumber(1)
  set password($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassword() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get confirm => $_getSZ(1);
  @$pb.TagNumber(2)
  set confirm($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasConfirm() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfirm() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get username => $_getSZ(2);
  @$pb.TagNumber(3)
  set username($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUsername() => $_has(2);
  @$pb.TagNumber(3)
  void clearUsername() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get custnumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set custnumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCustnumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearCustnumber() => clearField(4);
}

class RequestDatabaseCreate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestDatabaseCreate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alias')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'demo')
    ..hasRequiredFields = false
  ;

  RequestDatabaseCreate._() : super();
  factory RequestDatabaseCreate({
    $core.String? alias,
    $core.bool? demo,
  }) {
    final _result = create();
    if (alias != null) {
      _result.alias = alias;
    }
    if (demo != null) {
      _result.demo = demo;
    }
    return _result;
  }
  factory RequestDatabaseCreate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestDatabaseCreate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestDatabaseCreate clone() => RequestDatabaseCreate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestDatabaseCreate copyWith(void Function(RequestDatabaseCreate) updates) => super.copyWith((message) => updates(message as RequestDatabaseCreate)) as RequestDatabaseCreate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestDatabaseCreate create() => RequestDatabaseCreate._();
  RequestDatabaseCreate createEmptyInstance() => create();
  static $pb.PbList<RequestDatabaseCreate> createRepeated() => $pb.PbList<RequestDatabaseCreate>();
  @$core.pragma('dart2js:noInline')
  static RequestDatabaseCreate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestDatabaseCreate>(create);
  static RequestDatabaseCreate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get alias => $_getSZ(0);
  @$pb.TagNumber(1)
  set alias($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAlias() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlias() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get demo => $_getBF(1);
  @$pb.TagNumber(2)
  set demo($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDemo() => $_has(1);
  @$pb.TagNumber(2)
  void clearDemo() => clearField(2);
}

class ResponseDatabaseCreate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseDatabaseCreate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOM<ResponseRows>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'details', subBuilder: ResponseRows.create)
    ..hasRequiredFields = false
  ;

  ResponseDatabaseCreate._() : super();
  factory ResponseDatabaseCreate({
    ResponseRows? details,
  }) {
    final _result = create();
    if (details != null) {
      _result.details = details;
    }
    return _result;
  }
  factory ResponseDatabaseCreate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseDatabaseCreate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseDatabaseCreate clone() => ResponseDatabaseCreate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseDatabaseCreate copyWith(void Function(ResponseDatabaseCreate) updates) => super.copyWith((message) => updates(message as ResponseDatabaseCreate)) as ResponseDatabaseCreate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseDatabaseCreate create() => ResponseDatabaseCreate._();
  ResponseDatabaseCreate createEmptyInstance() => create();
  static $pb.PbList<ResponseDatabaseCreate> createRepeated() => $pb.PbList<ResponseDatabaseCreate>();
  @$core.pragma('dart2js:noInline')
  static ResponseDatabaseCreate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseDatabaseCreate>(create);
  static ResponseDatabaseCreate? _defaultInstance;

  @$pb.TagNumber(1)
  ResponseRows get details => $_getN(0);
  @$pb.TagNumber(1)
  set details(ResponseRows v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDetails() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetails() => clearField(1);
  @$pb.TagNumber(1)
  ResponseRows ensureDetails() => $_ensure(0);
}

class RequestDelete extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestDelete', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..e<DataType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype', $pb.PbFieldType.OE, defaultOrMaker: DataType.address, valueOf: DataType.valueOf, enumValues: DataType.values)
    ..aInt64(36, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(37, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..hasRequiredFields = false
  ;

  RequestDelete._() : super();
  factory RequestDelete({
    DataType? nervatype,
    $fixnum.Int64? id,
    $core.String? key,
  }) {
    final _result = create();
    if (nervatype != null) {
      _result.nervatype = nervatype;
    }
    if (id != null) {
      _result.id = id;
    }
    if (key != null) {
      _result.key = key;
    }
    return _result;
  }
  factory RequestDelete.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestDelete.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestDelete clone() => RequestDelete()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestDelete copyWith(void Function(RequestDelete) updates) => super.copyWith((message) => updates(message as RequestDelete)) as RequestDelete; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestDelete create() => RequestDelete._();
  RequestDelete createEmptyInstance() => create();
  static $pb.PbList<RequestDelete> createRepeated() => $pb.PbList<RequestDelete>();
  @$core.pragma('dart2js:noInline')
  static RequestDelete getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestDelete>(create);
  static RequestDelete? _defaultInstance;

  @$pb.TagNumber(1)
  DataType get nervatype => $_getN(0);
  @$pb.TagNumber(1)
  set nervatype(DataType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNervatype() => $_has(0);
  @$pb.TagNumber(1)
  void clearNervatype() => clearField(1);

  @$pb.TagNumber(36)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(36)
  set id($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(36)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(36)
  void clearId() => clearField(36);

  @$pb.TagNumber(37)
  $core.String get key => $_getSZ(2);
  @$pb.TagNumber(37)
  set key($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(37)
  $core.bool hasKey() => $_has(2);
  @$pb.TagNumber(37)
  void clearKey() => clearField(37);
}

class RequestView_Query extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestView.Query', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..pc<Value>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values', $pb.PbFieldType.PM, subBuilder: Value.create)
    ..hasRequiredFields = false
  ;

  RequestView_Query._() : super();
  factory RequestView_Query({
    $core.String? key,
    $core.String? text,
    $core.Iterable<Value>? values,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (text != null) {
      _result.text = text;
    }
    if (values != null) {
      _result.values.addAll(values);
    }
    return _result;
  }
  factory RequestView_Query.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestView_Query.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestView_Query clone() => RequestView_Query()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestView_Query copyWith(void Function(RequestView_Query) updates) => super.copyWith((message) => updates(message as RequestView_Query)) as RequestView_Query; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestView_Query create() => RequestView_Query._();
  RequestView_Query createEmptyInstance() => create();
  static $pb.PbList<RequestView_Query> createRepeated() => $pb.PbList<RequestView_Query>();
  @$core.pragma('dart2js:noInline')
  static RequestView_Query getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestView_Query>(create);
  static RequestView_Query? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Value> get values => $_getList(2);
}

class RequestView extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestView', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..pc<RequestView_Query>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'options', $pb.PbFieldType.PM, subBuilder: RequestView_Query.create)
    ..hasRequiredFields = false
  ;

  RequestView._() : super();
  factory RequestView({
    $core.Iterable<RequestView_Query>? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options.addAll(options);
    }
    return _result;
  }
  factory RequestView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestView clone() => RequestView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestView copyWith(void Function(RequestView) updates) => super.copyWith((message) => updates(message as RequestView)) as RequestView; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestView create() => RequestView._();
  RequestView createEmptyInstance() => create();
  static $pb.PbList<RequestView> createRepeated() => $pb.PbList<RequestView>();
  @$core.pragma('dart2js:noInline')
  static RequestView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestView>(create);
  static RequestView? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RequestView_Query> get options => $_getList(0);
}

class ResponseView extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseView', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..m<$core.String, ResponseRows>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values', entryClassName: 'ResponseView.ValuesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: ResponseRows.create, packageName: const $pb.PackageName('nervatura'))
    ..hasRequiredFields = false
  ;

  ResponseView._() : super();
  factory ResponseView({
    $core.Map<$core.String, ResponseRows>? values,
  }) {
    final _result = create();
    if (values != null) {
      _result.values.addAll(values);
    }
    return _result;
  }
  factory ResponseView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseView clone() => ResponseView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseView copyWith(void Function(ResponseView) updates) => super.copyWith((message) => updates(message as ResponseView)) as ResponseView; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseView create() => ResponseView._();
  ResponseView createEmptyInstance() => create();
  static $pb.PbList<ResponseView> createRepeated() => $pb.PbList<ResponseView>();
  @$core.pragma('dart2js:noInline')
  static ResponseView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseView>(create);
  static ResponseView? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, ResponseRows> get values => $_getMap(0);
}

class RequestFunction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestFunction', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..m<$core.String, Value>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values', entryClassName: 'RequestFunction.ValuesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Value.create, packageName: const $pb.PackageName('nervatura'))
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  RequestFunction._() : super();
  factory RequestFunction({
    $core.String? key,
    $core.Map<$core.String, Value>? values,
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (values != null) {
      _result.values.addAll(values);
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory RequestFunction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestFunction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestFunction clone() => RequestFunction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestFunction copyWith(void Function(RequestFunction) updates) => super.copyWith((message) => updates(message as RequestFunction)) as RequestFunction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestFunction create() => RequestFunction._();
  RequestFunction createEmptyInstance() => create();
  static $pb.PbList<RequestFunction> createRepeated() => $pb.PbList<RequestFunction>();
  @$core.pragma('dart2js:noInline')
  static RequestFunction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestFunction>(create);
  static RequestFunction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.String, Value> get values => $_getMap(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get value => $_getN(2);
  @$pb.TagNumber(3)
  set value($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
}

class ResponseFunction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseFunction', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ResponseFunction._() : super();
  factory ResponseFunction({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ResponseFunction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseFunction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseFunction clone() => ResponseFunction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseFunction copyWith(void Function(ResponseFunction) updates) => super.copyWith((message) => updates(message as ResponseFunction)) as ResponseFunction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseFunction create() => ResponseFunction._();
  ResponseFunction createEmptyInstance() => create();
  static $pb.PbList<ResponseFunction> createRepeated() => $pb.PbList<ResponseFunction>();
  @$core.pragma('dart2js:noInline')
  static ResponseFunction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseFunction>(create);
  static ResponseFunction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class RequestReportList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestReportList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'label')
    ..hasRequiredFields = false
  ;

  RequestReportList._() : super();
  factory RequestReportList({
    $core.String? label,
  }) {
    final _result = create();
    if (label != null) {
      _result.label = label;
    }
    return _result;
  }
  factory RequestReportList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestReportList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestReportList clone() => RequestReportList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestReportList copyWith(void Function(RequestReportList) updates) => super.copyWith((message) => updates(message as RequestReportList)) as RequestReportList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestReportList create() => RequestReportList._();
  RequestReportList createEmptyInstance() => create();
  static $pb.PbList<RequestReportList> createRepeated() => $pb.PbList<RequestReportList>();
  @$core.pragma('dart2js:noInline')
  static RequestReportList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestReportList>(create);
  static RequestReportList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);
}

class ResponseReportList_Info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseReportList.Info', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reportkey')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'repname')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'label')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reptype')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filename')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'installed')
    ..hasRequiredFields = false
  ;

  ResponseReportList_Info._() : super();
  factory ResponseReportList_Info({
    $core.String? reportkey,
    $core.String? repname,
    $core.String? description,
    $core.String? label,
    $core.String? reptype,
    $core.String? filename,
    $core.bool? installed,
  }) {
    final _result = create();
    if (reportkey != null) {
      _result.reportkey = reportkey;
    }
    if (repname != null) {
      _result.repname = repname;
    }
    if (description != null) {
      _result.description = description;
    }
    if (label != null) {
      _result.label = label;
    }
    if (reptype != null) {
      _result.reptype = reptype;
    }
    if (filename != null) {
      _result.filename = filename;
    }
    if (installed != null) {
      _result.installed = installed;
    }
    return _result;
  }
  factory ResponseReportList_Info.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseReportList_Info.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseReportList_Info clone() => ResponseReportList_Info()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseReportList_Info copyWith(void Function(ResponseReportList_Info) updates) => super.copyWith((message) => updates(message as ResponseReportList_Info)) as ResponseReportList_Info; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseReportList_Info create() => ResponseReportList_Info._();
  ResponseReportList_Info createEmptyInstance() => create();
  static $pb.PbList<ResponseReportList_Info> createRepeated() => $pb.PbList<ResponseReportList_Info>();
  @$core.pragma('dart2js:noInline')
  static ResponseReportList_Info getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseReportList_Info>(create);
  static ResponseReportList_Info? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reportkey => $_getSZ(0);
  @$pb.TagNumber(1)
  set reportkey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReportkey() => $_has(0);
  @$pb.TagNumber(1)
  void clearReportkey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get repname => $_getSZ(1);
  @$pb.TagNumber(2)
  set repname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRepname() => $_has(1);
  @$pb.TagNumber(2)
  void clearRepname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get label => $_getSZ(3);
  @$pb.TagNumber(4)
  set label($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLabel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLabel() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get reptype => $_getSZ(4);
  @$pb.TagNumber(5)
  set reptype($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReptype() => $_has(4);
  @$pb.TagNumber(5)
  void clearReptype() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get filename => $_getSZ(5);
  @$pb.TagNumber(6)
  set filename($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFilename() => $_has(5);
  @$pb.TagNumber(6)
  void clearFilename() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get installed => $_getBF(6);
  @$pb.TagNumber(7)
  set installed($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasInstalled() => $_has(6);
  @$pb.TagNumber(7)
  void clearInstalled() => clearField(7);
}

class ResponseReportList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseReportList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..pc<ResponseReportList_Info>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: ResponseReportList_Info.create)
    ..hasRequiredFields = false
  ;

  ResponseReportList._() : super();
  factory ResponseReportList({
    $core.Iterable<ResponseReportList_Info>? items,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory ResponseReportList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseReportList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseReportList clone() => ResponseReportList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseReportList copyWith(void Function(ResponseReportList) updates) => super.copyWith((message) => updates(message as ResponseReportList)) as ResponseReportList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseReportList create() => ResponseReportList._();
  ResponseReportList createEmptyInstance() => create();
  static $pb.PbList<ResponseReportList> createRepeated() => $pb.PbList<ResponseReportList>();
  @$core.pragma('dart2js:noInline')
  static ResponseReportList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseReportList>(create);
  static ResponseReportList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ResponseReportList_Info> get items => $_getList(0);
}

class RequestReportInstall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestReportInstall', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reportkey')
    ..hasRequiredFields = false
  ;

  RequestReportInstall._() : super();
  factory RequestReportInstall({
    $core.String? reportkey,
  }) {
    final _result = create();
    if (reportkey != null) {
      _result.reportkey = reportkey;
    }
    return _result;
  }
  factory RequestReportInstall.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestReportInstall.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestReportInstall clone() => RequestReportInstall()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestReportInstall copyWith(void Function(RequestReportInstall) updates) => super.copyWith((message) => updates(message as RequestReportInstall)) as RequestReportInstall; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestReportInstall create() => RequestReportInstall._();
  RequestReportInstall createEmptyInstance() => create();
  static $pb.PbList<RequestReportInstall> createRepeated() => $pb.PbList<RequestReportInstall>();
  @$core.pragma('dart2js:noInline')
  static RequestReportInstall getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestReportInstall>(create);
  static RequestReportInstall? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reportkey => $_getSZ(0);
  @$pb.TagNumber(1)
  set reportkey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReportkey() => $_has(0);
  @$pb.TagNumber(1)
  void clearReportkey() => clearField(1);
}

class ResponseReportInstall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseReportInstall', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  ResponseReportInstall._() : super();
  factory ResponseReportInstall({
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory ResponseReportInstall.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseReportInstall.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseReportInstall clone() => ResponseReportInstall()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseReportInstall copyWith(void Function(ResponseReportInstall) updates) => super.copyWith((message) => updates(message as ResponseReportInstall)) as ResponseReportInstall; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseReportInstall create() => ResponseReportInstall._();
  ResponseReportInstall createEmptyInstance() => create();
  static $pb.PbList<ResponseReportInstall> createRepeated() => $pb.PbList<ResponseReportInstall>();
  @$core.pragma('dart2js:noInline')
  static ResponseReportInstall getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseReportInstall>(create);
  static ResponseReportInstall? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class RequestReportDelete extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestReportDelete', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reportkey')
    ..hasRequiredFields = false
  ;

  RequestReportDelete._() : super();
  factory RequestReportDelete({
    $core.String? reportkey,
  }) {
    final _result = create();
    if (reportkey != null) {
      _result.reportkey = reportkey;
    }
    return _result;
  }
  factory RequestReportDelete.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestReportDelete.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestReportDelete clone() => RequestReportDelete()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestReportDelete copyWith(void Function(RequestReportDelete) updates) => super.copyWith((message) => updates(message as RequestReportDelete)) as RequestReportDelete; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestReportDelete create() => RequestReportDelete._();
  RequestReportDelete createEmptyInstance() => create();
  static $pb.PbList<RequestReportDelete> createRepeated() => $pb.PbList<RequestReportDelete>();
  @$core.pragma('dart2js:noInline')
  static RequestReportDelete getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestReportDelete>(create);
  static RequestReportDelete? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reportkey => $_getSZ(0);
  @$pb.TagNumber(1)
  set reportkey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReportkey() => $_has(0);
  @$pb.TagNumber(1)
  void clearReportkey() => clearField(1);
}

class RequestReport extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestReport', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reportkey')
    ..e<ReportOrientation>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orientation', $pb.PbFieldType.OE, defaultOrMaker: ReportOrientation.portrait, valueOf: ReportOrientation.valueOf, enumValues: ReportOrientation.values)
    ..e<ReportSize>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', $pb.PbFieldType.OE, defaultOrMaker: ReportSize.a3, valueOf: ReportSize.valueOf, enumValues: ReportSize.values)
    ..e<ReportOutput>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'output', $pb.PbFieldType.OE, defaultOrMaker: ReportOutput.auto, valueOf: ReportOutput.valueOf, enumValues: ReportOutput.values)
    ..e<ReportType>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: ReportType.report_none, valueOf: ReportType.valueOf, enumValues: ReportType.values)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refnumber')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'template')
    ..m<$core.String, Value>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filters', entryClassName: 'RequestReport.FiltersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Value.create, packageName: const $pb.PackageName('nervatura'))
    ..hasRequiredFields = false
  ;

  RequestReport._() : super();
  factory RequestReport({
    $core.String? reportkey,
    ReportOrientation? orientation,
    ReportSize? size,
    ReportOutput? output,
    ReportType? type,
    $core.String? refnumber,
    $core.String? template,
    $core.Map<$core.String, Value>? filters,
  }) {
    final _result = create();
    if (reportkey != null) {
      _result.reportkey = reportkey;
    }
    if (orientation != null) {
      _result.orientation = orientation;
    }
    if (size != null) {
      _result.size = size;
    }
    if (output != null) {
      _result.output = output;
    }
    if (type != null) {
      _result.type = type;
    }
    if (refnumber != null) {
      _result.refnumber = refnumber;
    }
    if (template != null) {
      _result.template = template;
    }
    if (filters != null) {
      _result.filters.addAll(filters);
    }
    return _result;
  }
  factory RequestReport.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestReport.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestReport clone() => RequestReport()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestReport copyWith(void Function(RequestReport) updates) => super.copyWith((message) => updates(message as RequestReport)) as RequestReport; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestReport create() => RequestReport._();
  RequestReport createEmptyInstance() => create();
  static $pb.PbList<RequestReport> createRepeated() => $pb.PbList<RequestReport>();
  @$core.pragma('dart2js:noInline')
  static RequestReport getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestReport>(create);
  static RequestReport? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reportkey => $_getSZ(0);
  @$pb.TagNumber(1)
  set reportkey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReportkey() => $_has(0);
  @$pb.TagNumber(1)
  void clearReportkey() => clearField(1);

  @$pb.TagNumber(2)
  ReportOrientation get orientation => $_getN(1);
  @$pb.TagNumber(2)
  set orientation(ReportOrientation v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrientation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrientation() => clearField(2);

  @$pb.TagNumber(3)
  ReportSize get size => $_getN(2);
  @$pb.TagNumber(3)
  set size(ReportSize v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => clearField(3);

  @$pb.TagNumber(4)
  ReportOutput get output => $_getN(3);
  @$pb.TagNumber(4)
  set output(ReportOutput v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasOutput() => $_has(3);
  @$pb.TagNumber(4)
  void clearOutput() => clearField(4);

  @$pb.TagNumber(5)
  ReportType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type(ReportType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get refnumber => $_getSZ(5);
  @$pb.TagNumber(6)
  set refnumber($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRefnumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearRefnumber() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get template => $_getSZ(6);
  @$pb.TagNumber(7)
  set template($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTemplate() => $_has(6);
  @$pb.TagNumber(7)
  void clearTemplate() => clearField(7);

  @$pb.TagNumber(8)
  $core.Map<$core.String, Value> get filters => $_getMap(7);
}

class ResponseReport extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseReport', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ResponseReport._() : super();
  factory ResponseReport({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ResponseReport.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseReport.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseReport clone() => ResponseReport()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseReport copyWith(void Function(ResponseReport) updates) => super.copyWith((message) => updates(message as ResponseReport)) as ResponseReport; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseReport create() => ResponseReport._();
  ResponseReport createEmptyInstance() => create();
  static $pb.PbList<ResponseReport> createRepeated() => $pb.PbList<ResponseReport>();
  @$core.pragma('dart2js:noInline')
  static ResponseReport getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseReport>(create);
  static ResponseReport? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class RequestUpdate_Item extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestUpdate.Item', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..m<$core.String, Value>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values', entryClassName: 'RequestUpdate.Item.ValuesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Value.create, packageName: const $pb.PackageName('nervatura'))
    ..m<$core.String, Value>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keys', entryClassName: 'RequestUpdate.Item.KeysEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Value.create, packageName: const $pb.PackageName('nervatura'))
    ..hasRequiredFields = false
  ;

  RequestUpdate_Item._() : super();
  factory RequestUpdate_Item({
    $core.Map<$core.String, Value>? values,
    $core.Map<$core.String, Value>? keys,
  }) {
    final _result = create();
    if (values != null) {
      _result.values.addAll(values);
    }
    if (keys != null) {
      _result.keys.addAll(keys);
    }
    return _result;
  }
  factory RequestUpdate_Item.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestUpdate_Item.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestUpdate_Item clone() => RequestUpdate_Item()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestUpdate_Item copyWith(void Function(RequestUpdate_Item) updates) => super.copyWith((message) => updates(message as RequestUpdate_Item)) as RequestUpdate_Item; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestUpdate_Item create() => RequestUpdate_Item._();
  RequestUpdate_Item createEmptyInstance() => create();
  static $pb.PbList<RequestUpdate_Item> createRepeated() => $pb.PbList<RequestUpdate_Item>();
  @$core.pragma('dart2js:noInline')
  static RequestUpdate_Item getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestUpdate_Item>(create);
  static RequestUpdate_Item? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, Value> get values => $_getMap(0);

  @$pb.TagNumber(2)
  $core.Map<$core.String, Value> get keys => $_getMap(1);
}

class RequestUpdate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestUpdate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..e<DataType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype', $pb.PbFieldType.OE, defaultOrMaker: DataType.address, valueOf: DataType.valueOf, enumValues: DataType.values)
    ..pc<RequestUpdate_Item>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: RequestUpdate_Item.create)
    ..hasRequiredFields = false
  ;

  RequestUpdate._() : super();
  factory RequestUpdate({
    DataType? nervatype,
    $core.Iterable<RequestUpdate_Item>? items,
  }) {
    final _result = create();
    if (nervatype != null) {
      _result.nervatype = nervatype;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory RequestUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestUpdate clone() => RequestUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestUpdate copyWith(void Function(RequestUpdate) updates) => super.copyWith((message) => updates(message as RequestUpdate)) as RequestUpdate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestUpdate create() => RequestUpdate._();
  RequestUpdate createEmptyInstance() => create();
  static $pb.PbList<RequestUpdate> createRepeated() => $pb.PbList<RequestUpdate>();
  @$core.pragma('dart2js:noInline')
  static RequestUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestUpdate>(create);
  static RequestUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  DataType get nervatype => $_getN(0);
  @$pb.TagNumber(1)
  set nervatype(DataType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNervatype() => $_has(0);
  @$pb.TagNumber(1)
  void clearNervatype() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<RequestUpdate_Item> get items => $_getList(1);
}

class ResponseUpdate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseUpdate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  ResponseUpdate._() : super();
  factory ResponseUpdate({
    $core.Iterable<$fixnum.Int64>? values,
  }) {
    final _result = create();
    if (values != null) {
      _result.values.addAll(values);
    }
    return _result;
  }
  factory ResponseUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseUpdate clone() => ResponseUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseUpdate copyWith(void Function(ResponseUpdate) updates) => super.copyWith((message) => updates(message as ResponseUpdate)) as ResponseUpdate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseUpdate create() => ResponseUpdate._();
  ResponseUpdate createEmptyInstance() => create();
  static $pb.PbList<ResponseUpdate> createRepeated() => $pb.PbList<ResponseUpdate>();
  @$core.pragma('dart2js:noInline')
  static ResponseUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseUpdate>(create);
  static ResponseUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get values => $_getList(0);
}

class RequestGet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestGet', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..e<DataType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype', $pb.PbFieldType.OE, defaultOrMaker: DataType.address, valueOf: DataType.valueOf, enumValues: DataType.values)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata')
    ..p<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ids', $pb.PbFieldType.K6)
    ..pPS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filter')
    ..hasRequiredFields = false
  ;

  RequestGet._() : super();
  factory RequestGet({
    DataType? nervatype,
    $core.bool? metadata,
    $core.Iterable<$fixnum.Int64>? ids,
    $core.Iterable<$core.String>? filter,
  }) {
    final _result = create();
    if (nervatype != null) {
      _result.nervatype = nervatype;
    }
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (ids != null) {
      _result.ids.addAll(ids);
    }
    if (filter != null) {
      _result.filter.addAll(filter);
    }
    return _result;
  }
  factory RequestGet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestGet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestGet clone() => RequestGet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestGet copyWith(void Function(RequestGet) updates) => super.copyWith((message) => updates(message as RequestGet)) as RequestGet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestGet create() => RequestGet._();
  RequestGet createEmptyInstance() => create();
  static $pb.PbList<RequestGet> createRepeated() => $pb.PbList<RequestGet>();
  @$core.pragma('dart2js:noInline')
  static RequestGet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestGet>(create);
  static RequestGet? _defaultInstance;

  @$pb.TagNumber(1)
  DataType get nervatype => $_getN(0);
  @$pb.TagNumber(1)
  set nervatype(DataType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNervatype() => $_has(0);
  @$pb.TagNumber(1)
  void clearNervatype() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get metadata => $_getBF(1);
  @$pb.TagNumber(2)
  set metadata($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMetadata() => $_has(1);
  @$pb.TagNumber(2)
  void clearMetadata() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$fixnum.Int64> get ids => $_getList(2);

  @$pb.TagNumber(7)
  $core.List<$core.String> get filter => $_getList(3);
}

enum ResponseGet_Value_Value {
  address, 
  barcode, 
  contact, 
  currency, 
  customer, 
  deffield, 
  employee, 
  event, 
  fieldvalue, 
  groups, 
  item, 
  link, 
  log, 
  movement, 
  numberdef, 
  pattern, 
  payment, 
  place, 
  price, 
  product, 
  project, 
  rate, 
  tax, 
  tool, 
  trans, 
  uiAudit, 
  uiMenu, 
  uiMenufields, 
  uiMessage, 
  uiPrintqueue, 
  uiReport, 
  uiUserconfig, 
  notSet
}

class ResponseGet_Value extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ResponseGet_Value_Value> _ResponseGet_Value_ValueByTag = {
    1 : ResponseGet_Value_Value.address,
    2 : ResponseGet_Value_Value.barcode,
    3 : ResponseGet_Value_Value.contact,
    4 : ResponseGet_Value_Value.currency,
    5 : ResponseGet_Value_Value.customer,
    6 : ResponseGet_Value_Value.deffield,
    7 : ResponseGet_Value_Value.employee,
    8 : ResponseGet_Value_Value.event,
    9 : ResponseGet_Value_Value.fieldvalue,
    10 : ResponseGet_Value_Value.groups,
    11 : ResponseGet_Value_Value.item,
    12 : ResponseGet_Value_Value.link,
    13 : ResponseGet_Value_Value.log,
    14 : ResponseGet_Value_Value.movement,
    15 : ResponseGet_Value_Value.numberdef,
    16 : ResponseGet_Value_Value.pattern,
    17 : ResponseGet_Value_Value.payment,
    18 : ResponseGet_Value_Value.place,
    19 : ResponseGet_Value_Value.price,
    20 : ResponseGet_Value_Value.product,
    21 : ResponseGet_Value_Value.project,
    22 : ResponseGet_Value_Value.rate,
    23 : ResponseGet_Value_Value.tax,
    24 : ResponseGet_Value_Value.tool,
    25 : ResponseGet_Value_Value.trans,
    26 : ResponseGet_Value_Value.uiAudit,
    27 : ResponseGet_Value_Value.uiMenu,
    28 : ResponseGet_Value_Value.uiMenufields,
    29 : ResponseGet_Value_Value.uiMessage,
    30 : ResponseGet_Value_Value.uiPrintqueue,
    31 : ResponseGet_Value_Value.uiReport,
    32 : ResponseGet_Value_Value.uiUserconfig,
    0 : ResponseGet_Value_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseGet.Value', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32])
    ..aOM<Address>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: Address.create)
    ..aOM<Barcode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'barcode', subBuilder: Barcode.create)
    ..aOM<Contact>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contact', subBuilder: Contact.create)
    ..aOM<Currency>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currency', subBuilder: Currency.create)
    ..aOM<Customer>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customer', subBuilder: Customer.create)
    ..aOM<Deffield>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deffield', subBuilder: Deffield.create)
    ..aOM<Employee>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'employee', subBuilder: Employee.create)
    ..aOM<Event>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: Event.create)
    ..aOM<Fieldvalue>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldvalue', subBuilder: Fieldvalue.create)
    ..aOM<Groups>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groups', subBuilder: Groups.create)
    ..aOM<Item>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'item', subBuilder: Item.create)
    ..aOM<Link>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'link', subBuilder: Link.create)
    ..aOM<Log>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'log', subBuilder: Log.create)
    ..aOM<Movement>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'movement', subBuilder: Movement.create)
    ..aOM<Numberdef>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberdef', subBuilder: Numberdef.create)
    ..aOM<Pattern>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pattern', subBuilder: Pattern.create)
    ..aOM<Payment>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payment', subBuilder: Payment.create)
    ..aOM<Place>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'place', subBuilder: Place.create)
    ..aOM<Price>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', subBuilder: Price.create)
    ..aOM<Product>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'product', subBuilder: Product.create)
    ..aOM<Project>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'project', subBuilder: Project.create)
    ..aOM<Rate>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rate', subBuilder: Rate.create)
    ..aOM<Tax>(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tax', subBuilder: Tax.create)
    ..aOM<Tool>(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tool', subBuilder: Tool.create)
    ..aOM<Trans>(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trans', subBuilder: Trans.create)
    ..aOM<UiAudit>(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uiAudit', subBuilder: UiAudit.create)
    ..aOM<UiMenu>(27, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uiMenu', subBuilder: UiMenu.create)
    ..aOM<UiMenufields>(28, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uiMenufields', subBuilder: UiMenufields.create)
    ..aOM<UiMessage>(29, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uiMessage', subBuilder: UiMessage.create)
    ..aOM<UiPrintqueue>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uiPrintqueue', subBuilder: UiPrintqueue.create)
    ..aOM<UiReport>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uiReport', subBuilder: UiReport.create)
    ..aOM<UiUserconfig>(32, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uiUserconfig', subBuilder: UiUserconfig.create)
    ..hasRequiredFields = false
  ;

  ResponseGet_Value._() : super();
  factory ResponseGet_Value({
    Address? address,
    Barcode? barcode,
    Contact? contact,
    Currency? currency,
    Customer? customer,
    Deffield? deffield,
    Employee? employee,
    Event? event,
    Fieldvalue? fieldvalue,
    Groups? groups,
    Item? item,
    Link? link,
    Log? log,
    Movement? movement,
    Numberdef? numberdef,
    Pattern? pattern,
    Payment? payment,
    Place? place,
    Price? price,
    Product? product,
    Project? project,
    Rate? rate,
    Tax? tax,
    Tool? tool,
    Trans? trans,
    UiAudit? uiAudit,
    UiMenu? uiMenu,
    UiMenufields? uiMenufields,
    UiMessage? uiMessage,
    UiPrintqueue? uiPrintqueue,
    UiReport? uiReport,
    UiUserconfig? uiUserconfig,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    if (barcode != null) {
      _result.barcode = barcode;
    }
    if (contact != null) {
      _result.contact = contact;
    }
    if (currency != null) {
      _result.currency = currency;
    }
    if (customer != null) {
      _result.customer = customer;
    }
    if (deffield != null) {
      _result.deffield = deffield;
    }
    if (employee != null) {
      _result.employee = employee;
    }
    if (event != null) {
      _result.event = event;
    }
    if (fieldvalue != null) {
      _result.fieldvalue = fieldvalue;
    }
    if (groups != null) {
      _result.groups = groups;
    }
    if (item != null) {
      _result.item = item;
    }
    if (link != null) {
      _result.link = link;
    }
    if (log != null) {
      _result.log = log;
    }
    if (movement != null) {
      _result.movement = movement;
    }
    if (numberdef != null) {
      _result.numberdef = numberdef;
    }
    if (pattern != null) {
      _result.pattern = pattern;
    }
    if (payment != null) {
      _result.payment = payment;
    }
    if (place != null) {
      _result.place = place;
    }
    if (price != null) {
      _result.price = price;
    }
    if (product != null) {
      _result.product = product;
    }
    if (project != null) {
      _result.project = project;
    }
    if (rate != null) {
      _result.rate = rate;
    }
    if (tax != null) {
      _result.tax = tax;
    }
    if (tool != null) {
      _result.tool = tool;
    }
    if (trans != null) {
      _result.trans = trans;
    }
    if (uiAudit != null) {
      _result.uiAudit = uiAudit;
    }
    if (uiMenu != null) {
      _result.uiMenu = uiMenu;
    }
    if (uiMenufields != null) {
      _result.uiMenufields = uiMenufields;
    }
    if (uiMessage != null) {
      _result.uiMessage = uiMessage;
    }
    if (uiPrintqueue != null) {
      _result.uiPrintqueue = uiPrintqueue;
    }
    if (uiReport != null) {
      _result.uiReport = uiReport;
    }
    if (uiUserconfig != null) {
      _result.uiUserconfig = uiUserconfig;
    }
    return _result;
  }
  factory ResponseGet_Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseGet_Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseGet_Value clone() => ResponseGet_Value()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseGet_Value copyWith(void Function(ResponseGet_Value) updates) => super.copyWith((message) => updates(message as ResponseGet_Value)) as ResponseGet_Value; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseGet_Value create() => ResponseGet_Value._();
  ResponseGet_Value createEmptyInstance() => create();
  static $pb.PbList<ResponseGet_Value> createRepeated() => $pb.PbList<ResponseGet_Value>();
  @$core.pragma('dart2js:noInline')
  static ResponseGet_Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseGet_Value>(create);
  static ResponseGet_Value? _defaultInstance;

  ResponseGet_Value_Value whichValue() => _ResponseGet_Value_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Address get address => $_getN(0);
  @$pb.TagNumber(1)
  set address(Address v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
  @$pb.TagNumber(1)
  Address ensureAddress() => $_ensure(0);

  @$pb.TagNumber(2)
  Barcode get barcode => $_getN(1);
  @$pb.TagNumber(2)
  set barcode(Barcode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBarcode() => $_has(1);
  @$pb.TagNumber(2)
  void clearBarcode() => clearField(2);
  @$pb.TagNumber(2)
  Barcode ensureBarcode() => $_ensure(1);

  @$pb.TagNumber(3)
  Contact get contact => $_getN(2);
  @$pb.TagNumber(3)
  set contact(Contact v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasContact() => $_has(2);
  @$pb.TagNumber(3)
  void clearContact() => clearField(3);
  @$pb.TagNumber(3)
  Contact ensureContact() => $_ensure(2);

  @$pb.TagNumber(4)
  Currency get currency => $_getN(3);
  @$pb.TagNumber(4)
  set currency(Currency v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurrency() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrency() => clearField(4);
  @$pb.TagNumber(4)
  Currency ensureCurrency() => $_ensure(3);

  @$pb.TagNumber(5)
  Customer get customer => $_getN(4);
  @$pb.TagNumber(5)
  set customer(Customer v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCustomer() => $_has(4);
  @$pb.TagNumber(5)
  void clearCustomer() => clearField(5);
  @$pb.TagNumber(5)
  Customer ensureCustomer() => $_ensure(4);

  @$pb.TagNumber(6)
  Deffield get deffield => $_getN(5);
  @$pb.TagNumber(6)
  set deffield(Deffield v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeffield() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeffield() => clearField(6);
  @$pb.TagNumber(6)
  Deffield ensureDeffield() => $_ensure(5);

  @$pb.TagNumber(7)
  Employee get employee => $_getN(6);
  @$pb.TagNumber(7)
  set employee(Employee v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEmployee() => $_has(6);
  @$pb.TagNumber(7)
  void clearEmployee() => clearField(7);
  @$pb.TagNumber(7)
  Employee ensureEmployee() => $_ensure(6);

  @$pb.TagNumber(8)
  Event get event => $_getN(7);
  @$pb.TagNumber(8)
  set event(Event v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasEvent() => $_has(7);
  @$pb.TagNumber(8)
  void clearEvent() => clearField(8);
  @$pb.TagNumber(8)
  Event ensureEvent() => $_ensure(7);

  @$pb.TagNumber(9)
  Fieldvalue get fieldvalue => $_getN(8);
  @$pb.TagNumber(9)
  set fieldvalue(Fieldvalue v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasFieldvalue() => $_has(8);
  @$pb.TagNumber(9)
  void clearFieldvalue() => clearField(9);
  @$pb.TagNumber(9)
  Fieldvalue ensureFieldvalue() => $_ensure(8);

  @$pb.TagNumber(10)
  Groups get groups => $_getN(9);
  @$pb.TagNumber(10)
  set groups(Groups v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasGroups() => $_has(9);
  @$pb.TagNumber(10)
  void clearGroups() => clearField(10);
  @$pb.TagNumber(10)
  Groups ensureGroups() => $_ensure(9);

  @$pb.TagNumber(11)
  Item get item => $_getN(10);
  @$pb.TagNumber(11)
  set item(Item v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasItem() => $_has(10);
  @$pb.TagNumber(11)
  void clearItem() => clearField(11);
  @$pb.TagNumber(11)
  Item ensureItem() => $_ensure(10);

  @$pb.TagNumber(12)
  Link get link => $_getN(11);
  @$pb.TagNumber(12)
  set link(Link v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasLink() => $_has(11);
  @$pb.TagNumber(12)
  void clearLink() => clearField(12);
  @$pb.TagNumber(12)
  Link ensureLink() => $_ensure(11);

  @$pb.TagNumber(13)
  Log get log => $_getN(12);
  @$pb.TagNumber(13)
  set log(Log v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasLog() => $_has(12);
  @$pb.TagNumber(13)
  void clearLog() => clearField(13);
  @$pb.TagNumber(13)
  Log ensureLog() => $_ensure(12);

  @$pb.TagNumber(14)
  Movement get movement => $_getN(13);
  @$pb.TagNumber(14)
  set movement(Movement v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasMovement() => $_has(13);
  @$pb.TagNumber(14)
  void clearMovement() => clearField(14);
  @$pb.TagNumber(14)
  Movement ensureMovement() => $_ensure(13);

  @$pb.TagNumber(15)
  Numberdef get numberdef => $_getN(14);
  @$pb.TagNumber(15)
  set numberdef(Numberdef v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasNumberdef() => $_has(14);
  @$pb.TagNumber(15)
  void clearNumberdef() => clearField(15);
  @$pb.TagNumber(15)
  Numberdef ensureNumberdef() => $_ensure(14);

  @$pb.TagNumber(16)
  Pattern get pattern => $_getN(15);
  @$pb.TagNumber(16)
  set pattern(Pattern v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasPattern() => $_has(15);
  @$pb.TagNumber(16)
  void clearPattern() => clearField(16);
  @$pb.TagNumber(16)
  Pattern ensurePattern() => $_ensure(15);

  @$pb.TagNumber(17)
  Payment get payment => $_getN(16);
  @$pb.TagNumber(17)
  set payment(Payment v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasPayment() => $_has(16);
  @$pb.TagNumber(17)
  void clearPayment() => clearField(17);
  @$pb.TagNumber(17)
  Payment ensurePayment() => $_ensure(16);

  @$pb.TagNumber(18)
  Place get place => $_getN(17);
  @$pb.TagNumber(18)
  set place(Place v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasPlace() => $_has(17);
  @$pb.TagNumber(18)
  void clearPlace() => clearField(18);
  @$pb.TagNumber(18)
  Place ensurePlace() => $_ensure(17);

  @$pb.TagNumber(19)
  Price get price => $_getN(18);
  @$pb.TagNumber(19)
  set price(Price v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasPrice() => $_has(18);
  @$pb.TagNumber(19)
  void clearPrice() => clearField(19);
  @$pb.TagNumber(19)
  Price ensurePrice() => $_ensure(18);

  @$pb.TagNumber(20)
  Product get product => $_getN(19);
  @$pb.TagNumber(20)
  set product(Product v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasProduct() => $_has(19);
  @$pb.TagNumber(20)
  void clearProduct() => clearField(20);
  @$pb.TagNumber(20)
  Product ensureProduct() => $_ensure(19);

  @$pb.TagNumber(21)
  Project get project => $_getN(20);
  @$pb.TagNumber(21)
  set project(Project v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasProject() => $_has(20);
  @$pb.TagNumber(21)
  void clearProject() => clearField(21);
  @$pb.TagNumber(21)
  Project ensureProject() => $_ensure(20);

  @$pb.TagNumber(22)
  Rate get rate => $_getN(21);
  @$pb.TagNumber(22)
  set rate(Rate v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasRate() => $_has(21);
  @$pb.TagNumber(22)
  void clearRate() => clearField(22);
  @$pb.TagNumber(22)
  Rate ensureRate() => $_ensure(21);

  @$pb.TagNumber(23)
  Tax get tax => $_getN(22);
  @$pb.TagNumber(23)
  set tax(Tax v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasTax() => $_has(22);
  @$pb.TagNumber(23)
  void clearTax() => clearField(23);
  @$pb.TagNumber(23)
  Tax ensureTax() => $_ensure(22);

  @$pb.TagNumber(24)
  Tool get tool => $_getN(23);
  @$pb.TagNumber(24)
  set tool(Tool v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasTool() => $_has(23);
  @$pb.TagNumber(24)
  void clearTool() => clearField(24);
  @$pb.TagNumber(24)
  Tool ensureTool() => $_ensure(23);

  @$pb.TagNumber(25)
  Trans get trans => $_getN(24);
  @$pb.TagNumber(25)
  set trans(Trans v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasTrans() => $_has(24);
  @$pb.TagNumber(25)
  void clearTrans() => clearField(25);
  @$pb.TagNumber(25)
  Trans ensureTrans() => $_ensure(24);

  @$pb.TagNumber(26)
  UiAudit get uiAudit => $_getN(25);
  @$pb.TagNumber(26)
  set uiAudit(UiAudit v) { setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasUiAudit() => $_has(25);
  @$pb.TagNumber(26)
  void clearUiAudit() => clearField(26);
  @$pb.TagNumber(26)
  UiAudit ensureUiAudit() => $_ensure(25);

  @$pb.TagNumber(27)
  UiMenu get uiMenu => $_getN(26);
  @$pb.TagNumber(27)
  set uiMenu(UiMenu v) { setField(27, v); }
  @$pb.TagNumber(27)
  $core.bool hasUiMenu() => $_has(26);
  @$pb.TagNumber(27)
  void clearUiMenu() => clearField(27);
  @$pb.TagNumber(27)
  UiMenu ensureUiMenu() => $_ensure(26);

  @$pb.TagNumber(28)
  UiMenufields get uiMenufields => $_getN(27);
  @$pb.TagNumber(28)
  set uiMenufields(UiMenufields v) { setField(28, v); }
  @$pb.TagNumber(28)
  $core.bool hasUiMenufields() => $_has(27);
  @$pb.TagNumber(28)
  void clearUiMenufields() => clearField(28);
  @$pb.TagNumber(28)
  UiMenufields ensureUiMenufields() => $_ensure(27);

  @$pb.TagNumber(29)
  UiMessage get uiMessage => $_getN(28);
  @$pb.TagNumber(29)
  set uiMessage(UiMessage v) { setField(29, v); }
  @$pb.TagNumber(29)
  $core.bool hasUiMessage() => $_has(28);
  @$pb.TagNumber(29)
  void clearUiMessage() => clearField(29);
  @$pb.TagNumber(29)
  UiMessage ensureUiMessage() => $_ensure(28);

  @$pb.TagNumber(30)
  UiPrintqueue get uiPrintqueue => $_getN(29);
  @$pb.TagNumber(30)
  set uiPrintqueue(UiPrintqueue v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasUiPrintqueue() => $_has(29);
  @$pb.TagNumber(30)
  void clearUiPrintqueue() => clearField(30);
  @$pb.TagNumber(30)
  UiPrintqueue ensureUiPrintqueue() => $_ensure(29);

  @$pb.TagNumber(31)
  UiReport get uiReport => $_getN(30);
  @$pb.TagNumber(31)
  set uiReport(UiReport v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasUiReport() => $_has(30);
  @$pb.TagNumber(31)
  void clearUiReport() => clearField(31);
  @$pb.TagNumber(31)
  UiReport ensureUiReport() => $_ensure(30);

  @$pb.TagNumber(32)
  UiUserconfig get uiUserconfig => $_getN(31);
  @$pb.TagNumber(32)
  set uiUserconfig(UiUserconfig v) { setField(32, v); }
  @$pb.TagNumber(32)
  $core.bool hasUiUserconfig() => $_has(31);
  @$pb.TagNumber(32)
  void clearUiUserconfig() => clearField(32);
  @$pb.TagNumber(32)
  UiUserconfig ensureUiUserconfig() => $_ensure(31);
}

class ResponseGet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseGet', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..pc<ResponseGet_Value>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values', $pb.PbFieldType.PM, subBuilder: ResponseGet_Value.create)
    ..hasRequiredFields = false
  ;

  ResponseGet._() : super();
  factory ResponseGet({
    $core.Iterable<ResponseGet_Value>? values,
  }) {
    final _result = create();
    if (values != null) {
      _result.values.addAll(values);
    }
    return _result;
  }
  factory ResponseGet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseGet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseGet clone() => ResponseGet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseGet copyWith(void Function(ResponseGet) updates) => super.copyWith((message) => updates(message as ResponseGet)) as ResponseGet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseGet create() => ResponseGet._();
  ResponseGet createEmptyInstance() => create();
  static $pb.PbList<ResponseGet> createRepeated() => $pb.PbList<ResponseGet>();
  @$core.pragma('dart2js:noInline')
  static ResponseGet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseGet>(create);
  static ResponseGet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ResponseGet_Value> get values => $_getList(0);
}

class MetaData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MetaData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldname')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldtype')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  MetaData._() : super();
  factory MetaData({
    $fixnum.Int64? id,
    $core.String? fieldname,
    $core.String? fieldtype,
    $core.String? value,
    $core.String? notes,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (fieldname != null) {
      _result.fieldname = fieldname;
    }
    if (fieldtype != null) {
      _result.fieldtype = fieldtype;
    }
    if (value != null) {
      _result.value = value;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    return _result;
  }
  factory MetaData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetaData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetaData clone() => MetaData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetaData copyWith(void Function(MetaData) updates) => super.copyWith((message) => updates(message as MetaData)) as MetaData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MetaData create() => MetaData._();
  MetaData createEmptyInstance() => create();
  static $pb.PbList<MetaData> createRepeated() => $pb.PbList<MetaData>();
  @$core.pragma('dart2js:noInline')
  static MetaData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetaData>(create);
  static MetaData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fieldname => $_getSZ(1);
  @$pb.TagNumber(2)
  set fieldname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFieldname() => $_has(1);
  @$pb.TagNumber(2)
  void clearFieldname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fieldtype => $_getSZ(2);
  @$pb.TagNumber(3)
  set fieldtype($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFieldtype() => $_has(2);
  @$pb.TagNumber(3)
  void clearFieldtype() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get value => $_getSZ(3);
  @$pb.TagNumber(4)
  set value($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearValue() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get notes => $_getSZ(4);
  @$pb.TagNumber(5)
  set notes($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNotes() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotes() => clearField(5);
}

class Address extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Address', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'country')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'zipcode')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'city')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'street')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..pc<MetaData>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Address._() : super();
  factory Address({
    $fixnum.Int64? id,
    $fixnum.Int64? nervatype,
    $fixnum.Int64? refId,
    $core.String? country,
    $core.String? state,
    $core.String? zipcode,
    $core.String? city,
    $core.String? street,
    $core.String? notes,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (nervatype != null) {
      _result.nervatype = nervatype;
    }
    if (refId != null) {
      _result.refId = refId;
    }
    if (country != null) {
      _result.country = country;
    }
    if (state != null) {
      _result.state = state;
    }
    if (zipcode != null) {
      _result.zipcode = zipcode;
    }
    if (city != null) {
      _result.city = city;
    }
    if (street != null) {
      _result.street = street;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Address.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Address.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Address clone() => Address()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Address copyWith(void Function(Address) updates) => super.copyWith((message) => updates(message as Address)) as Address; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Address create() => Address._();
  Address createEmptyInstance() => create();
  static $pb.PbList<Address> createRepeated() => $pb.PbList<Address>();
  @$core.pragma('dart2js:noInline')
  static Address getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Address>(create);
  static Address? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get nervatype => $_getI64(1);
  @$pb.TagNumber(2)
  set nervatype($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNervatype() => $_has(1);
  @$pb.TagNumber(2)
  void clearNervatype() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get refId => $_getI64(2);
  @$pb.TagNumber(3)
  set refId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get country => $_getSZ(3);
  @$pb.TagNumber(4)
  set country($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCountry() => $_has(3);
  @$pb.TagNumber(4)
  void clearCountry() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get state => $_getSZ(4);
  @$pb.TagNumber(5)
  set state($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get zipcode => $_getSZ(5);
  @$pb.TagNumber(6)
  set zipcode($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasZipcode() => $_has(5);
  @$pb.TagNumber(6)
  void clearZipcode() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get city => $_getSZ(6);
  @$pb.TagNumber(7)
  set city($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCity() => $_has(6);
  @$pb.TagNumber(7)
  void clearCity() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get street => $_getSZ(7);
  @$pb.TagNumber(8)
  set street($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStreet() => $_has(7);
  @$pb.TagNumber(8)
  void clearStreet() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get notes => $_getSZ(8);
  @$pb.TagNumber(9)
  set notes($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNotes() => $_has(8);
  @$pb.TagNumber(9)
  void clearNotes() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<MetaData> get metadata => $_getList(9);
}

class Barcode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Barcode', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'productId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'barcodetype')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qty', $pb.PbFieldType.OD)
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'defcode')
    ..hasRequiredFields = false
  ;

  Barcode._() : super();
  factory Barcode({
    $fixnum.Int64? id,
    $core.String? code,
    $fixnum.Int64? productId,
    $core.String? description,
    $fixnum.Int64? barcodetype,
    $core.double? qty,
    $core.bool? defcode,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (code != null) {
      _result.code = code;
    }
    if (productId != null) {
      _result.productId = productId;
    }
    if (description != null) {
      _result.description = description;
    }
    if (barcodetype != null) {
      _result.barcodetype = barcodetype;
    }
    if (qty != null) {
      _result.qty = qty;
    }
    if (defcode != null) {
      _result.defcode = defcode;
    }
    return _result;
  }
  factory Barcode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Barcode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Barcode clone() => Barcode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Barcode copyWith(void Function(Barcode) updates) => super.copyWith((message) => updates(message as Barcode)) as Barcode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Barcode create() => Barcode._();
  Barcode createEmptyInstance() => create();
  static $pb.PbList<Barcode> createRepeated() => $pb.PbList<Barcode>();
  @$core.pragma('dart2js:noInline')
  static Barcode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Barcode>(create);
  static Barcode? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get productId => $_getI64(2);
  @$pb.TagNumber(3)
  set productId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProductId() => $_has(2);
  @$pb.TagNumber(3)
  void clearProductId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get barcodetype => $_getI64(4);
  @$pb.TagNumber(5)
  set barcodetype($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBarcodetype() => $_has(4);
  @$pb.TagNumber(5)
  void clearBarcodetype() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get qty => $_getN(5);
  @$pb.TagNumber(6)
  set qty($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasQty() => $_has(5);
  @$pb.TagNumber(6)
  void clearQty() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get defcode => $_getBF(6);
  @$pb.TagNumber(7)
  set defcode($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDefcode() => $_has(6);
  @$pb.TagNumber(7)
  void clearDefcode() => clearField(7);
}

class Contact extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Contact', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstname')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surname')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fax')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobil')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..pc<MetaData>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Contact._() : super();
  factory Contact({
    $fixnum.Int64? id,
    $fixnum.Int64? nervatype,
    $fixnum.Int64? refId,
    $core.String? firstname,
    $core.String? surname,
    $core.String? status,
    $core.String? phone,
    $core.String? fax,
    $core.String? mobil,
    $core.String? email,
    $core.String? notes,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (nervatype != null) {
      _result.nervatype = nervatype;
    }
    if (refId != null) {
      _result.refId = refId;
    }
    if (firstname != null) {
      _result.firstname = firstname;
    }
    if (surname != null) {
      _result.surname = surname;
    }
    if (status != null) {
      _result.status = status;
    }
    if (phone != null) {
      _result.phone = phone;
    }
    if (fax != null) {
      _result.fax = fax;
    }
    if (mobil != null) {
      _result.mobil = mobil;
    }
    if (email != null) {
      _result.email = email;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Contact.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Contact.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Contact clone() => Contact()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Contact copyWith(void Function(Contact) updates) => super.copyWith((message) => updates(message as Contact)) as Contact; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Contact create() => Contact._();
  Contact createEmptyInstance() => create();
  static $pb.PbList<Contact> createRepeated() => $pb.PbList<Contact>();
  @$core.pragma('dart2js:noInline')
  static Contact getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Contact>(create);
  static Contact? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get nervatype => $_getI64(1);
  @$pb.TagNumber(2)
  set nervatype($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNervatype() => $_has(1);
  @$pb.TagNumber(2)
  void clearNervatype() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get refId => $_getI64(2);
  @$pb.TagNumber(3)
  set refId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get firstname => $_getSZ(3);
  @$pb.TagNumber(4)
  set firstname($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirstname() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirstname() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get surname => $_getSZ(4);
  @$pb.TagNumber(5)
  set surname($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSurname() => $_has(4);
  @$pb.TagNumber(5)
  void clearSurname() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get phone => $_getSZ(6);
  @$pb.TagNumber(7)
  set phone($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPhone() => $_has(6);
  @$pb.TagNumber(7)
  void clearPhone() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get fax => $_getSZ(7);
  @$pb.TagNumber(8)
  set fax($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFax() => $_has(7);
  @$pb.TagNumber(8)
  void clearFax() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get mobil => $_getSZ(8);
  @$pb.TagNumber(9)
  set mobil($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMobil() => $_has(8);
  @$pb.TagNumber(9)
  void clearMobil() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get email => $_getSZ(9);
  @$pb.TagNumber(10)
  set email($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasEmail() => $_has(9);
  @$pb.TagNumber(10)
  void clearEmail() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get notes => $_getSZ(10);
  @$pb.TagNumber(11)
  set notes($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNotes() => $_has(10);
  @$pb.TagNumber(11)
  void clearNotes() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<MetaData> get metadata => $_getList(11);
}

class Currency extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Currency', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curr')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'digit')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'defrate', $pb.PbFieldType.OD)
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cround')
    ..pc<MetaData>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Currency._() : super();
  factory Currency({
    $fixnum.Int64? id,
    $core.String? curr,
    $core.String? description,
    $fixnum.Int64? digit,
    $core.double? defrate,
    $fixnum.Int64? cround,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (curr != null) {
      _result.curr = curr;
    }
    if (description != null) {
      _result.description = description;
    }
    if (digit != null) {
      _result.digit = digit;
    }
    if (defrate != null) {
      _result.defrate = defrate;
    }
    if (cround != null) {
      _result.cround = cround;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Currency.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Currency.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Currency clone() => Currency()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Currency copyWith(void Function(Currency) updates) => super.copyWith((message) => updates(message as Currency)) as Currency; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Currency create() => Currency._();
  Currency createEmptyInstance() => create();
  static $pb.PbList<Currency> createRepeated() => $pb.PbList<Currency>();
  @$core.pragma('dart2js:noInline')
  static Currency getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Currency>(create);
  static Currency? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get curr => $_getSZ(1);
  @$pb.TagNumber(2)
  set curr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurr() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurr() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get digit => $_getI64(3);
  @$pb.TagNumber(4)
  set digit($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDigit() => $_has(3);
  @$pb.TagNumber(4)
  void clearDigit() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get defrate => $_getN(4);
  @$pb.TagNumber(5)
  set defrate($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDefrate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDefrate() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get cround => $_getI64(5);
  @$pb.TagNumber(6)
  set cround($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCround() => $_has(5);
  @$pb.TagNumber(6)
  void clearCround() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<MetaData> get metadata => $_getList(6);
}

class Customer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Customer', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'custtype')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'custnumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'custname')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taxnumber')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'account')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notax')
    ..aInt64(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'terms')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creditlimit', $pb.PbFieldType.OD)
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discount', $pb.PbFieldType.OD)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..aOB(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inactive')
    ..pc<MetaData>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Customer._() : super();
  factory Customer({
    $fixnum.Int64? id,
    $fixnum.Int64? custtype,
    $core.String? custnumber,
    $core.String? custname,
    $core.String? taxnumber,
    $core.String? account,
    $core.bool? notax,
    $fixnum.Int64? terms,
    $core.double? creditlimit,
    $core.double? discount,
    $core.String? notes,
    $core.bool? inactive,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (custtype != null) {
      _result.custtype = custtype;
    }
    if (custnumber != null) {
      _result.custnumber = custnumber;
    }
    if (custname != null) {
      _result.custname = custname;
    }
    if (taxnumber != null) {
      _result.taxnumber = taxnumber;
    }
    if (account != null) {
      _result.account = account;
    }
    if (notax != null) {
      _result.notax = notax;
    }
    if (terms != null) {
      _result.terms = terms;
    }
    if (creditlimit != null) {
      _result.creditlimit = creditlimit;
    }
    if (discount != null) {
      _result.discount = discount;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (inactive != null) {
      _result.inactive = inactive;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Customer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Customer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Customer clone() => Customer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Customer copyWith(void Function(Customer) updates) => super.copyWith((message) => updates(message as Customer)) as Customer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Customer create() => Customer._();
  Customer createEmptyInstance() => create();
  static $pb.PbList<Customer> createRepeated() => $pb.PbList<Customer>();
  @$core.pragma('dart2js:noInline')
  static Customer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Customer>(create);
  static Customer? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get custtype => $_getI64(1);
  @$pb.TagNumber(2)
  set custtype($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCusttype() => $_has(1);
  @$pb.TagNumber(2)
  void clearCusttype() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get custnumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set custnumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCustnumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustnumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get custname => $_getSZ(3);
  @$pb.TagNumber(4)
  set custname($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCustname() => $_has(3);
  @$pb.TagNumber(4)
  void clearCustname() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get taxnumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set taxnumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTaxnumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearTaxnumber() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get account => $_getSZ(5);
  @$pb.TagNumber(6)
  set account($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAccount() => $_has(5);
  @$pb.TagNumber(6)
  void clearAccount() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get notax => $_getBF(6);
  @$pb.TagNumber(7)
  set notax($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNotax() => $_has(6);
  @$pb.TagNumber(7)
  void clearNotax() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get terms => $_getI64(7);
  @$pb.TagNumber(8)
  set terms($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTerms() => $_has(7);
  @$pb.TagNumber(8)
  void clearTerms() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get creditlimit => $_getN(8);
  @$pb.TagNumber(9)
  set creditlimit($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreditlimit() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreditlimit() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get discount => $_getN(9);
  @$pb.TagNumber(10)
  set discount($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDiscount() => $_has(9);
  @$pb.TagNumber(10)
  void clearDiscount() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get notes => $_getSZ(10);
  @$pb.TagNumber(11)
  set notes($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNotes() => $_has(10);
  @$pb.TagNumber(11)
  void clearNotes() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get inactive => $_getBF(11);
  @$pb.TagNumber(12)
  set inactive($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasInactive() => $_has(11);
  @$pb.TagNumber(12)
  void clearInactive() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<MetaData> get metadata => $_getList(12);
}

class Deffield extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Deffield', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldname')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtype')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldtype')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valuelist')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addnew')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'visible')
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'readonly')
    ..hasRequiredFields = false
  ;

  Deffield._() : super();
  factory Deffield({
    $fixnum.Int64? id,
    $core.String? fieldname,
    $fixnum.Int64? nervatype,
    $fixnum.Int64? subtype,
    $fixnum.Int64? fieldtype,
    $core.String? description,
    $core.String? valuelist,
    $core.bool? addnew,
    $core.bool? visible,
    $core.bool? readonly,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (fieldname != null) {
      _result.fieldname = fieldname;
    }
    if (nervatype != null) {
      _result.nervatype = nervatype;
    }
    if (subtype != null) {
      _result.subtype = subtype;
    }
    if (fieldtype != null) {
      _result.fieldtype = fieldtype;
    }
    if (description != null) {
      _result.description = description;
    }
    if (valuelist != null) {
      _result.valuelist = valuelist;
    }
    if (addnew != null) {
      _result.addnew = addnew;
    }
    if (visible != null) {
      _result.visible = visible;
    }
    if (readonly != null) {
      _result.readonly = readonly;
    }
    return _result;
  }
  factory Deffield.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Deffield.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Deffield clone() => Deffield()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Deffield copyWith(void Function(Deffield) updates) => super.copyWith((message) => updates(message as Deffield)) as Deffield; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Deffield create() => Deffield._();
  Deffield createEmptyInstance() => create();
  static $pb.PbList<Deffield> createRepeated() => $pb.PbList<Deffield>();
  @$core.pragma('dart2js:noInline')
  static Deffield getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Deffield>(create);
  static Deffield? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fieldname => $_getSZ(1);
  @$pb.TagNumber(2)
  set fieldname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFieldname() => $_has(1);
  @$pb.TagNumber(2)
  void clearFieldname() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get nervatype => $_getI64(2);
  @$pb.TagNumber(3)
  set nervatype($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNervatype() => $_has(2);
  @$pb.TagNumber(3)
  void clearNervatype() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get subtype => $_getI64(3);
  @$pb.TagNumber(4)
  set subtype($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSubtype() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubtype() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get fieldtype => $_getI64(4);
  @$pb.TagNumber(5)
  set fieldtype($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFieldtype() => $_has(4);
  @$pb.TagNumber(5)
  void clearFieldtype() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get valuelist => $_getSZ(6);
  @$pb.TagNumber(7)
  set valuelist($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasValuelist() => $_has(6);
  @$pb.TagNumber(7)
  void clearValuelist() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get addnew => $_getBF(7);
  @$pb.TagNumber(8)
  set addnew($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAddnew() => $_has(7);
  @$pb.TagNumber(8)
  void clearAddnew() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get visible => $_getBF(8);
  @$pb.TagNumber(9)
  set visible($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasVisible() => $_has(8);
  @$pb.TagNumber(9)
  void clearVisible() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get readonly => $_getBF(9);
  @$pb.TagNumber(10)
  set readonly($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasReadonly() => $_has(9);
  @$pb.TagNumber(10)
  void clearReadonly() => clearField(10);
}

class Employee extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Employee', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'empnumber')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usergroup')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startdate')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enddate')
    ..aInt64(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'department')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'registrationKey')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inactive')
    ..pc<MetaData>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Employee._() : super();
  factory Employee({
    $fixnum.Int64? id,
    $core.String? empnumber,
    $core.String? username,
    $fixnum.Int64? usergroup,
    $core.String? startdate,
    $core.String? enddate,
    $fixnum.Int64? department,
    $core.String? registrationKey,
    $core.bool? inactive,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (empnumber != null) {
      _result.empnumber = empnumber;
    }
    if (username != null) {
      _result.username = username;
    }
    if (usergroup != null) {
      _result.usergroup = usergroup;
    }
    if (startdate != null) {
      _result.startdate = startdate;
    }
    if (enddate != null) {
      _result.enddate = enddate;
    }
    if (department != null) {
      _result.department = department;
    }
    if (registrationKey != null) {
      _result.registrationKey = registrationKey;
    }
    if (inactive != null) {
      _result.inactive = inactive;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Employee.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Employee.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Employee clone() => Employee()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Employee copyWith(void Function(Employee) updates) => super.copyWith((message) => updates(message as Employee)) as Employee; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Employee create() => Employee._();
  Employee createEmptyInstance() => create();
  static $pb.PbList<Employee> createRepeated() => $pb.PbList<Employee>();
  @$core.pragma('dart2js:noInline')
  static Employee getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Employee>(create);
  static Employee? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get empnumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set empnumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmpnumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmpnumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get username => $_getSZ(2);
  @$pb.TagNumber(3)
  set username($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUsername() => $_has(2);
  @$pb.TagNumber(3)
  void clearUsername() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get usergroup => $_getI64(3);
  @$pb.TagNumber(4)
  set usergroup($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUsergroup() => $_has(3);
  @$pb.TagNumber(4)
  void clearUsergroup() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get startdate => $_getSZ(4);
  @$pb.TagNumber(5)
  set startdate($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStartdate() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartdate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get enddate => $_getSZ(5);
  @$pb.TagNumber(6)
  set enddate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEnddate() => $_has(5);
  @$pb.TagNumber(6)
  void clearEnddate() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get department => $_getI64(6);
  @$pb.TagNumber(7)
  set department($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDepartment() => $_has(6);
  @$pb.TagNumber(7)
  void clearDepartment() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get registrationKey => $_getSZ(7);
  @$pb.TagNumber(8)
  set registrationKey($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRegistrationKey() => $_has(7);
  @$pb.TagNumber(8)
  void clearRegistrationKey() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get inactive => $_getBF(8);
  @$pb.TagNumber(9)
  set inactive($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasInactive() => $_has(8);
  @$pb.TagNumber(9)
  void clearInactive() => clearField(9);

  @$pb.TagNumber(13)
  $core.List<MetaData> get metadata => $_getList(9);
}

class Event extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Event', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'calnumber')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventgroup')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fromdate')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'todate')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subject')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'place')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..pc<MetaData>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Event._() : super();
  factory Event({
    $fixnum.Int64? id,
    $core.String? calnumber,
    $fixnum.Int64? nervatype,
    $fixnum.Int64? refId,
    $core.String? uid,
    $fixnum.Int64? eventgroup,
    $core.String? fromdate,
    $core.String? todate,
    $core.String? subject,
    $core.String? place,
    $core.String? description,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (calnumber != null) {
      _result.calnumber = calnumber;
    }
    if (nervatype != null) {
      _result.nervatype = nervatype;
    }
    if (refId != null) {
      _result.refId = refId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (eventgroup != null) {
      _result.eventgroup = eventgroup;
    }
    if (fromdate != null) {
      _result.fromdate = fromdate;
    }
    if (todate != null) {
      _result.todate = todate;
    }
    if (subject != null) {
      _result.subject = subject;
    }
    if (place != null) {
      _result.place = place;
    }
    if (description != null) {
      _result.description = description;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Event.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Event clone() => Event()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Event copyWith(void Function(Event) updates) => super.copyWith((message) => updates(message as Event)) as Event; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Event create() => Event._();
  Event createEmptyInstance() => create();
  static $pb.PbList<Event> createRepeated() => $pb.PbList<Event>();
  @$core.pragma('dart2js:noInline')
  static Event getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event>(create);
  static Event? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get calnumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set calnumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCalnumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearCalnumber() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get nervatype => $_getI64(2);
  @$pb.TagNumber(3)
  set nervatype($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNervatype() => $_has(2);
  @$pb.TagNumber(3)
  void clearNervatype() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get refId => $_getI64(3);
  @$pb.TagNumber(4)
  set refId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRefId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get uid => $_getSZ(4);
  @$pb.TagNumber(5)
  set uid($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearUid() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get eventgroup => $_getI64(5);
  @$pb.TagNumber(6)
  set eventgroup($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEventgroup() => $_has(5);
  @$pb.TagNumber(6)
  void clearEventgroup() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get fromdate => $_getSZ(6);
  @$pb.TagNumber(7)
  set fromdate($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFromdate() => $_has(6);
  @$pb.TagNumber(7)
  void clearFromdate() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get todate => $_getSZ(7);
  @$pb.TagNumber(8)
  set todate($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTodate() => $_has(7);
  @$pb.TagNumber(8)
  void clearTodate() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get subject => $_getSZ(8);
  @$pb.TagNumber(9)
  set subject($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSubject() => $_has(8);
  @$pb.TagNumber(9)
  void clearSubject() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get place => $_getSZ(9);
  @$pb.TagNumber(10)
  set place($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPlace() => $_has(9);
  @$pb.TagNumber(10)
  void clearPlace() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get description => $_getSZ(10);
  @$pb.TagNumber(11)
  set description($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasDescription() => $_has(10);
  @$pb.TagNumber(11)
  void clearDescription() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<MetaData> get metadata => $_getList(11);
}

class Fieldvalue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Fieldvalue', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldname')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  Fieldvalue._() : super();
  factory Fieldvalue({
    $fixnum.Int64? id,
    $core.String? fieldname,
    $fixnum.Int64? refId,
    $core.String? value,
    $core.String? notes,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (fieldname != null) {
      _result.fieldname = fieldname;
    }
    if (refId != null) {
      _result.refId = refId;
    }
    if (value != null) {
      _result.value = value;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    return _result;
  }
  factory Fieldvalue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Fieldvalue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Fieldvalue clone() => Fieldvalue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Fieldvalue copyWith(void Function(Fieldvalue) updates) => super.copyWith((message) => updates(message as Fieldvalue)) as Fieldvalue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Fieldvalue create() => Fieldvalue._();
  Fieldvalue createEmptyInstance() => create();
  static $pb.PbList<Fieldvalue> createRepeated() => $pb.PbList<Fieldvalue>();
  @$core.pragma('dart2js:noInline')
  static Fieldvalue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Fieldvalue>(create);
  static Fieldvalue? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fieldname => $_getSZ(1);
  @$pb.TagNumber(2)
  set fieldname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFieldname() => $_has(1);
  @$pb.TagNumber(2)
  void clearFieldname() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get refId => $_getI64(2);
  @$pb.TagNumber(3)
  set refId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get value => $_getSZ(3);
  @$pb.TagNumber(4)
  set value($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearValue() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get notes => $_getSZ(4);
  @$pb.TagNumber(5)
  set notes($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNotes() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotes() => clearField(5);
}

class Groups extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Groups', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupname')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupvalue')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inactive')
    ..hasRequiredFields = false
  ;

  Groups._() : super();
  factory Groups({
    $fixnum.Int64? id,
    $core.String? groupname,
    $core.String? groupvalue,
    $core.String? description,
    $core.bool? inactive,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (groupname != null) {
      _result.groupname = groupname;
    }
    if (groupvalue != null) {
      _result.groupvalue = groupvalue;
    }
    if (description != null) {
      _result.description = description;
    }
    if (inactive != null) {
      _result.inactive = inactive;
    }
    return _result;
  }
  factory Groups.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Groups.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Groups clone() => Groups()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Groups copyWith(void Function(Groups) updates) => super.copyWith((message) => updates(message as Groups)) as Groups; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Groups create() => Groups._();
  Groups createEmptyInstance() => create();
  static $pb.PbList<Groups> createRepeated() => $pb.PbList<Groups>();
  @$core.pragma('dart2js:noInline')
  static Groups getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Groups>(create);
  static Groups? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get groupname => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGroupname() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get groupvalue => $_getSZ(2);
  @$pb.TagNumber(3)
  set groupvalue($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroupvalue() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupvalue() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get inactive => $_getBF(4);
  @$pb.TagNumber(5)
  set inactive($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInactive() => $_has(4);
  @$pb.TagNumber(5)
  void clearInactive() => clearField(5);
}

class Item extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Item', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transId')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'productId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unit')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qty', $pb.PbFieldType.OD)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fxprice', $pb.PbFieldType.OD)
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'netamount', $pb.PbFieldType.OD)
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discount', $pb.PbFieldType.OD)
    ..aInt64(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taxId')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vatamount', $pb.PbFieldType.OD)
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deposit')
    ..a<$core.double>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ownstock', $pb.PbFieldType.OD)
    ..aOB(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionprice')
    ..pc<MetaData>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Item._() : super();
  factory Item({
    $fixnum.Int64? id,
    $fixnum.Int64? transId,
    $fixnum.Int64? productId,
    $core.String? unit,
    $core.double? qty,
    $core.double? fxprice,
    $core.double? netamount,
    $core.double? discount,
    $fixnum.Int64? taxId,
    $core.double? vatamount,
    $core.double? amount,
    $core.String? description,
    $core.bool? deposit,
    $core.double? ownstock,
    $core.bool? actionprice,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (transId != null) {
      _result.transId = transId;
    }
    if (productId != null) {
      _result.productId = productId;
    }
    if (unit != null) {
      _result.unit = unit;
    }
    if (qty != null) {
      _result.qty = qty;
    }
    if (fxprice != null) {
      _result.fxprice = fxprice;
    }
    if (netamount != null) {
      _result.netamount = netamount;
    }
    if (discount != null) {
      _result.discount = discount;
    }
    if (taxId != null) {
      _result.taxId = taxId;
    }
    if (vatamount != null) {
      _result.vatamount = vatamount;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (description != null) {
      _result.description = description;
    }
    if (deposit != null) {
      _result.deposit = deposit;
    }
    if (ownstock != null) {
      _result.ownstock = ownstock;
    }
    if (actionprice != null) {
      _result.actionprice = actionprice;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Item.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Item.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Item clone() => Item()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Item copyWith(void Function(Item) updates) => super.copyWith((message) => updates(message as Item)) as Item; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Item create() => Item._();
  Item createEmptyInstance() => create();
  static $pb.PbList<Item> createRepeated() => $pb.PbList<Item>();
  @$core.pragma('dart2js:noInline')
  static Item getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Item>(create);
  static Item? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get transId => $_getI64(1);
  @$pb.TagNumber(2)
  set transId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get productId => $_getI64(2);
  @$pb.TagNumber(3)
  set productId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProductId() => $_has(2);
  @$pb.TagNumber(3)
  void clearProductId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get unit => $_getSZ(3);
  @$pb.TagNumber(4)
  set unit($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUnit() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnit() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get qty => $_getN(4);
  @$pb.TagNumber(5)
  set qty($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasQty() => $_has(4);
  @$pb.TagNumber(5)
  void clearQty() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get fxprice => $_getN(5);
  @$pb.TagNumber(6)
  set fxprice($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFxprice() => $_has(5);
  @$pb.TagNumber(6)
  void clearFxprice() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get netamount => $_getN(6);
  @$pb.TagNumber(7)
  set netamount($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNetamount() => $_has(6);
  @$pb.TagNumber(7)
  void clearNetamount() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get discount => $_getN(7);
  @$pb.TagNumber(8)
  set discount($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDiscount() => $_has(7);
  @$pb.TagNumber(8)
  void clearDiscount() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get taxId => $_getI64(8);
  @$pb.TagNumber(9)
  set taxId($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTaxId() => $_has(8);
  @$pb.TagNumber(9)
  void clearTaxId() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get vatamount => $_getN(9);
  @$pb.TagNumber(10)
  set vatamount($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasVatamount() => $_has(9);
  @$pb.TagNumber(10)
  void clearVatamount() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get amount => $_getN(10);
  @$pb.TagNumber(11)
  set amount($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAmount() => $_has(10);
  @$pb.TagNumber(11)
  void clearAmount() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get description => $_getSZ(11);
  @$pb.TagNumber(12)
  set description($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasDescription() => $_has(11);
  @$pb.TagNumber(12)
  void clearDescription() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get deposit => $_getBF(12);
  @$pb.TagNumber(13)
  set deposit($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasDeposit() => $_has(12);
  @$pb.TagNumber(13)
  void clearDeposit() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get ownstock => $_getN(13);
  @$pb.TagNumber(14)
  set ownstock($core.double v) { $_setDouble(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasOwnstock() => $_has(13);
  @$pb.TagNumber(14)
  void clearOwnstock() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get actionprice => $_getBF(14);
  @$pb.TagNumber(15)
  set actionprice($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasActionprice() => $_has(14);
  @$pb.TagNumber(15)
  void clearActionprice() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<MetaData> get metadata => $_getList(15);
}

class Link extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Link', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype1', protoName: 'nervatype_1')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refId1', protoName: 'ref_id_1')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype2', protoName: 'nervatype_2')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refId2', protoName: 'ref_id_2')
    ..pc<MetaData>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Link._() : super();
  factory Link({
    $fixnum.Int64? id,
    $fixnum.Int64? nervatype1,
    $fixnum.Int64? refId1,
    $fixnum.Int64? nervatype2,
    $fixnum.Int64? refId2,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (nervatype1 != null) {
      _result.nervatype1 = nervatype1;
    }
    if (refId1 != null) {
      _result.refId1 = refId1;
    }
    if (nervatype2 != null) {
      _result.nervatype2 = nervatype2;
    }
    if (refId2 != null) {
      _result.refId2 = refId2;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Link.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Link.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Link clone() => Link()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Link copyWith(void Function(Link) updates) => super.copyWith((message) => updates(message as Link)) as Link; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Link create() => Link._();
  Link createEmptyInstance() => create();
  static $pb.PbList<Link> createRepeated() => $pb.PbList<Link>();
  @$core.pragma('dart2js:noInline')
  static Link getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Link>(create);
  static Link? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get nervatype1 => $_getI64(1);
  @$pb.TagNumber(2)
  set nervatype1($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNervatype1() => $_has(1);
  @$pb.TagNumber(2)
  void clearNervatype1() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get refId1 => $_getI64(2);
  @$pb.TagNumber(3)
  set refId1($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefId1() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefId1() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get nervatype2 => $_getI64(3);
  @$pb.TagNumber(4)
  set nervatype2($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNervatype2() => $_has(3);
  @$pb.TagNumber(4)
  void clearNervatype2() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get refId2 => $_getI64(4);
  @$pb.TagNumber(5)
  set refId2($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRefId2() => $_has(4);
  @$pb.TagNumber(5)
  void clearRefId2() => clearField(5);

  @$pb.TagNumber(16)
  $core.List<MetaData> get metadata => $_getList(5);
}

class Log extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Log', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'employeeId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'crdate')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refId')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logstate')
    ..pc<MetaData>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Log._() : super();
  factory Log({
    $fixnum.Int64? id,
    $fixnum.Int64? employeeId,
    $core.String? crdate,
    $fixnum.Int64? nervatype,
    $fixnum.Int64? refId,
    $fixnum.Int64? logstate,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (employeeId != null) {
      _result.employeeId = employeeId;
    }
    if (crdate != null) {
      _result.crdate = crdate;
    }
    if (nervatype != null) {
      _result.nervatype = nervatype;
    }
    if (refId != null) {
      _result.refId = refId;
    }
    if (logstate != null) {
      _result.logstate = logstate;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Log.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Log.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Log clone() => Log()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Log copyWith(void Function(Log) updates) => super.copyWith((message) => updates(message as Log)) as Log; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Log create() => Log._();
  Log createEmptyInstance() => create();
  static $pb.PbList<Log> createRepeated() => $pb.PbList<Log>();
  @$core.pragma('dart2js:noInline')
  static Log getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Log>(create);
  static Log? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get employeeId => $_getI64(1);
  @$pb.TagNumber(2)
  set employeeId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmployeeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmployeeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get crdate => $_getSZ(2);
  @$pb.TagNumber(3)
  set crdate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCrdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearCrdate() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get nervatype => $_getI64(3);
  @$pb.TagNumber(4)
  set nervatype($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNervatype() => $_has(3);
  @$pb.TagNumber(4)
  void clearNervatype() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get refId => $_getI64(4);
  @$pb.TagNumber(5)
  set refId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRefId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRefId() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get logstate => $_getI64(5);
  @$pb.TagNumber(6)
  set logstate($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLogstate() => $_has(5);
  @$pb.TagNumber(6)
  void clearLogstate() => clearField(6);

  @$pb.TagNumber(16)
  $core.List<MetaData> get metadata => $_getList(6);
}

class Movement extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Movement', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shippingdate')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'movetype')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'productId')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toolId')
    ..aInt64(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'placeId')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qty', $pb.PbFieldType.OD)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shared')
    ..pc<MetaData>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Movement._() : super();
  factory Movement({
    $fixnum.Int64? id,
    $fixnum.Int64? transId,
    $core.String? shippingdate,
    $fixnum.Int64? movetype,
    $fixnum.Int64? productId,
    $fixnum.Int64? toolId,
    $fixnum.Int64? placeId,
    $core.double? qty,
    $core.String? description,
    $core.bool? shared,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (transId != null) {
      _result.transId = transId;
    }
    if (shippingdate != null) {
      _result.shippingdate = shippingdate;
    }
    if (movetype != null) {
      _result.movetype = movetype;
    }
    if (productId != null) {
      _result.productId = productId;
    }
    if (toolId != null) {
      _result.toolId = toolId;
    }
    if (placeId != null) {
      _result.placeId = placeId;
    }
    if (qty != null) {
      _result.qty = qty;
    }
    if (description != null) {
      _result.description = description;
    }
    if (shared != null) {
      _result.shared = shared;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Movement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Movement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Movement clone() => Movement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Movement copyWith(void Function(Movement) updates) => super.copyWith((message) => updates(message as Movement)) as Movement; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Movement create() => Movement._();
  Movement createEmptyInstance() => create();
  static $pb.PbList<Movement> createRepeated() => $pb.PbList<Movement>();
  @$core.pragma('dart2js:noInline')
  static Movement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Movement>(create);
  static Movement? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get transId => $_getI64(1);
  @$pb.TagNumber(2)
  set transId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get shippingdate => $_getSZ(2);
  @$pb.TagNumber(3)
  set shippingdate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasShippingdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearShippingdate() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get movetype => $_getI64(3);
  @$pb.TagNumber(4)
  set movetype($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMovetype() => $_has(3);
  @$pb.TagNumber(4)
  void clearMovetype() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get productId => $_getI64(4);
  @$pb.TagNumber(5)
  set productId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasProductId() => $_has(4);
  @$pb.TagNumber(5)
  void clearProductId() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get toolId => $_getI64(5);
  @$pb.TagNumber(6)
  set toolId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasToolId() => $_has(5);
  @$pb.TagNumber(6)
  void clearToolId() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get placeId => $_getI64(6);
  @$pb.TagNumber(7)
  set placeId($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPlaceId() => $_has(6);
  @$pb.TagNumber(7)
  void clearPlaceId() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get qty => $_getN(7);
  @$pb.TagNumber(8)
  set qty($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasQty() => $_has(7);
  @$pb.TagNumber(8)
  void clearQty() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get description => $_getSZ(8);
  @$pb.TagNumber(9)
  set description($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDescription() => $_has(8);
  @$pb.TagNumber(9)
  void clearDescription() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get shared => $_getBF(9);
  @$pb.TagNumber(10)
  set shared($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasShared() => $_has(9);
  @$pb.TagNumber(10)
  void clearShared() => clearField(10);

  @$pb.TagNumber(16)
  $core.List<MetaData> get metadata => $_getList(10);
}

class Numberdef extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Numberdef', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberkey')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prefix')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curvalue')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isyear')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sep')
    ..aInt64(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'len')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'visible')
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'readonly')
    ..aInt64(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderby')
    ..hasRequiredFields = false
  ;

  Numberdef._() : super();
  factory Numberdef({
    $fixnum.Int64? id,
    $core.String? numberkey,
    $core.String? prefix,
    $fixnum.Int64? curvalue,
    $core.bool? isyear,
    $core.String? sep,
    $fixnum.Int64? len,
    $core.String? description,
    $core.bool? visible,
    $core.bool? readonly,
    $fixnum.Int64? orderby,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (numberkey != null) {
      _result.numberkey = numberkey;
    }
    if (prefix != null) {
      _result.prefix = prefix;
    }
    if (curvalue != null) {
      _result.curvalue = curvalue;
    }
    if (isyear != null) {
      _result.isyear = isyear;
    }
    if (sep != null) {
      _result.sep = sep;
    }
    if (len != null) {
      _result.len = len;
    }
    if (description != null) {
      _result.description = description;
    }
    if (visible != null) {
      _result.visible = visible;
    }
    if (readonly != null) {
      _result.readonly = readonly;
    }
    if (orderby != null) {
      _result.orderby = orderby;
    }
    return _result;
  }
  factory Numberdef.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Numberdef.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Numberdef clone() => Numberdef()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Numberdef copyWith(void Function(Numberdef) updates) => super.copyWith((message) => updates(message as Numberdef)) as Numberdef; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Numberdef create() => Numberdef._();
  Numberdef createEmptyInstance() => create();
  static $pb.PbList<Numberdef> createRepeated() => $pb.PbList<Numberdef>();
  @$core.pragma('dart2js:noInline')
  static Numberdef getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Numberdef>(create);
  static Numberdef? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get numberkey => $_getSZ(1);
  @$pb.TagNumber(2)
  set numberkey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumberkey() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumberkey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get prefix => $_getSZ(2);
  @$pb.TagNumber(3)
  set prefix($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPrefix() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrefix() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get curvalue => $_getI64(3);
  @$pb.TagNumber(4)
  set curvalue($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurvalue() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurvalue() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isyear => $_getBF(4);
  @$pb.TagNumber(5)
  set isyear($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsyear() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsyear() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get sep => $_getSZ(5);
  @$pb.TagNumber(6)
  set sep($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSep() => $_has(5);
  @$pb.TagNumber(6)
  void clearSep() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get len => $_getI64(6);
  @$pb.TagNumber(7)
  set len($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLen() => $_has(6);
  @$pb.TagNumber(7)
  void clearLen() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get description => $_getSZ(7);
  @$pb.TagNumber(8)
  set description($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDescription() => $_has(7);
  @$pb.TagNumber(8)
  void clearDescription() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get visible => $_getBF(8);
  @$pb.TagNumber(9)
  set visible($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasVisible() => $_has(8);
  @$pb.TagNumber(9)
  void clearVisible() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get readonly => $_getBF(9);
  @$pb.TagNumber(10)
  set readonly($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasReadonly() => $_has(9);
  @$pb.TagNumber(10)
  void clearReadonly() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get orderby => $_getI64(10);
  @$pb.TagNumber(11)
  set orderby($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasOrderby() => $_has(10);
  @$pb.TagNumber(11)
  void clearOrderby() => clearField(11);
}

class Pattern extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pattern', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transtype')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'defpattern')
    ..hasRequiredFields = false
  ;

  Pattern._() : super();
  factory Pattern({
    $fixnum.Int64? id,
    $core.String? description,
    $fixnum.Int64? transtype,
    $core.String? notes,
    $core.bool? defpattern,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (description != null) {
      _result.description = description;
    }
    if (transtype != null) {
      _result.transtype = transtype;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (defpattern != null) {
      _result.defpattern = defpattern;
    }
    return _result;
  }
  factory Pattern.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Pattern.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Pattern clone() => Pattern()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Pattern copyWith(void Function(Pattern) updates) => super.copyWith((message) => updates(message as Pattern)) as Pattern; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Pattern create() => Pattern._();
  Pattern createEmptyInstance() => create();
  static $pb.PbList<Pattern> createRepeated() => $pb.PbList<Pattern>();
  @$core.pragma('dart2js:noInline')
  static Pattern getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Pattern>(create);
  static Pattern? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get transtype => $_getI64(2);
  @$pb.TagNumber(3)
  set transtype($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTranstype() => $_has(2);
  @$pb.TagNumber(3)
  void clearTranstype() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get notes => $_getSZ(3);
  @$pb.TagNumber(4)
  set notes($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearNotes() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get defpattern => $_getBF(4);
  @$pb.TagNumber(5)
  set defpattern($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDefpattern() => $_has(4);
  @$pb.TagNumber(5)
  void clearDefpattern() => clearField(5);
}

class Payment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Payment', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paiddate')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..pc<MetaData>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Payment._() : super();
  factory Payment({
    $fixnum.Int64? id,
    $fixnum.Int64? transId,
    $core.String? paiddate,
    $core.double? amount,
    $core.String? notes,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (transId != null) {
      _result.transId = transId;
    }
    if (paiddate != null) {
      _result.paiddate = paiddate;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Payment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Payment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Payment clone() => Payment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Payment copyWith(void Function(Payment) updates) => super.copyWith((message) => updates(message as Payment)) as Payment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Payment create() => Payment._();
  Payment createEmptyInstance() => create();
  static $pb.PbList<Payment> createRepeated() => $pb.PbList<Payment>();
  @$core.pragma('dart2js:noInline')
  static Payment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Payment>(create);
  static Payment? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get transId => $_getI64(1);
  @$pb.TagNumber(2)
  set transId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get paiddate => $_getSZ(2);
  @$pb.TagNumber(3)
  set paiddate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPaiddate() => $_has(2);
  @$pb.TagNumber(3)
  void clearPaiddate() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get amount => $_getN(3);
  @$pb.TagNumber(4)
  set amount($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get notes => $_getSZ(4);
  @$pb.TagNumber(5)
  set notes($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNotes() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotes() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<MetaData> get metadata => $_getList(5);
}

class Place extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Place', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'planumber')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'placetype')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curr')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'defplace')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inactive')
    ..pc<MetaData>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Place._() : super();
  factory Place({
    $fixnum.Int64? id,
    $core.String? planumber,
    $fixnum.Int64? placetype,
    $core.String? description,
    $core.String? curr,
    $core.bool? defplace,
    $core.String? notes,
    $core.bool? inactive,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (planumber != null) {
      _result.planumber = planumber;
    }
    if (placetype != null) {
      _result.placetype = placetype;
    }
    if (description != null) {
      _result.description = description;
    }
    if (curr != null) {
      _result.curr = curr;
    }
    if (defplace != null) {
      _result.defplace = defplace;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (inactive != null) {
      _result.inactive = inactive;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Place.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Place.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Place clone() => Place()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Place copyWith(void Function(Place) updates) => super.copyWith((message) => updates(message as Place)) as Place; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Place create() => Place._();
  Place createEmptyInstance() => create();
  static $pb.PbList<Place> createRepeated() => $pb.PbList<Place>();
  @$core.pragma('dart2js:noInline')
  static Place getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Place>(create);
  static Place? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get planumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set planumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlanumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlanumber() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get placetype => $_getI64(2);
  @$pb.TagNumber(3)
  set placetype($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlacetype() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlacetype() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get curr => $_getSZ(4);
  @$pb.TagNumber(5)
  set curr($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCurr() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurr() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get defplace => $_getBF(5);
  @$pb.TagNumber(6)
  set defplace($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDefplace() => $_has(5);
  @$pb.TagNumber(6)
  void clearDefplace() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get notes => $_getSZ(6);
  @$pb.TagNumber(7)
  set notes($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNotes() => $_has(6);
  @$pb.TagNumber(7)
  void clearNotes() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get inactive => $_getBF(7);
  @$pb.TagNumber(8)
  set inactive($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasInactive() => $_has(7);
  @$pb.TagNumber(8)
  void clearInactive() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<MetaData> get metadata => $_getList(8);
}

class Price extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Price', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'productId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validfrom')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validto')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curr')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qty', $pb.PbFieldType.OD)
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pricevalue', $pb.PbFieldType.OD)
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vendorprice')
    ..pc<MetaData>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Price._() : super();
  factory Price({
    $fixnum.Int64? id,
    $fixnum.Int64? productId,
    $core.String? validfrom,
    $core.String? validto,
    $core.String? curr,
    $core.double? qty,
    $core.double? pricevalue,
    $core.bool? vendorprice,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (productId != null) {
      _result.productId = productId;
    }
    if (validfrom != null) {
      _result.validfrom = validfrom;
    }
    if (validto != null) {
      _result.validto = validto;
    }
    if (curr != null) {
      _result.curr = curr;
    }
    if (qty != null) {
      _result.qty = qty;
    }
    if (pricevalue != null) {
      _result.pricevalue = pricevalue;
    }
    if (vendorprice != null) {
      _result.vendorprice = vendorprice;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Price.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Price.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Price clone() => Price()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Price copyWith(void Function(Price) updates) => super.copyWith((message) => updates(message as Price)) as Price; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Price create() => Price._();
  Price createEmptyInstance() => create();
  static $pb.PbList<Price> createRepeated() => $pb.PbList<Price>();
  @$core.pragma('dart2js:noInline')
  static Price getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Price>(create);
  static Price? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get productId => $_getI64(1);
  @$pb.TagNumber(2)
  set productId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProductId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProductId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get validfrom => $_getSZ(2);
  @$pb.TagNumber(3)
  set validfrom($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasValidfrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidfrom() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get validto => $_getSZ(3);
  @$pb.TagNumber(4)
  set validto($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasValidto() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidto() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get curr => $_getSZ(4);
  @$pb.TagNumber(5)
  set curr($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCurr() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurr() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get qty => $_getN(5);
  @$pb.TagNumber(6)
  set qty($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasQty() => $_has(5);
  @$pb.TagNumber(6)
  void clearQty() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get pricevalue => $_getN(6);
  @$pb.TagNumber(7)
  set pricevalue($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPricevalue() => $_has(6);
  @$pb.TagNumber(7)
  void clearPricevalue() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get vendorprice => $_getBF(7);
  @$pb.TagNumber(8)
  set vendorprice($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasVendorprice() => $_has(7);
  @$pb.TagNumber(8)
  void clearVendorprice() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<MetaData> get metadata => $_getList(8);
}

class Product extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Product', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'partnumber')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'protype')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unit')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taxId')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'webitem')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inactive')
    ..pc<MetaData>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Product._() : super();
  factory Product({
    $fixnum.Int64? id,
    $core.String? partnumber,
    $fixnum.Int64? protype,
    $core.String? description,
    $core.String? unit,
    $fixnum.Int64? taxId,
    $core.String? notes,
    $core.bool? webitem,
    $core.bool? inactive,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (partnumber != null) {
      _result.partnumber = partnumber;
    }
    if (protype != null) {
      _result.protype = protype;
    }
    if (description != null) {
      _result.description = description;
    }
    if (unit != null) {
      _result.unit = unit;
    }
    if (taxId != null) {
      _result.taxId = taxId;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (webitem != null) {
      _result.webitem = webitem;
    }
    if (inactive != null) {
      _result.inactive = inactive;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Product.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Product.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Product clone() => Product()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Product copyWith(void Function(Product) updates) => super.copyWith((message) => updates(message as Product)) as Product; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Product create() => Product._();
  Product createEmptyInstance() => create();
  static $pb.PbList<Product> createRepeated() => $pb.PbList<Product>();
  @$core.pragma('dart2js:noInline')
  static Product getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Product>(create);
  static Product? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get partnumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set partnumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPartnumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearPartnumber() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get protype => $_getI64(2);
  @$pb.TagNumber(3)
  set protype($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProtype() => $_has(2);
  @$pb.TagNumber(3)
  void clearProtype() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get unit => $_getSZ(4);
  @$pb.TagNumber(5)
  set unit($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUnit() => $_has(4);
  @$pb.TagNumber(5)
  void clearUnit() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get taxId => $_getI64(5);
  @$pb.TagNumber(6)
  set taxId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTaxId() => $_has(5);
  @$pb.TagNumber(6)
  void clearTaxId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get notes => $_getSZ(6);
  @$pb.TagNumber(7)
  set notes($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNotes() => $_has(6);
  @$pb.TagNumber(7)
  void clearNotes() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get webitem => $_getBF(7);
  @$pb.TagNumber(8)
  set webitem($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasWebitem() => $_has(7);
  @$pb.TagNumber(8)
  void clearWebitem() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get inactive => $_getBF(8);
  @$pb.TagNumber(9)
  set inactive($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasInactive() => $_has(8);
  @$pb.TagNumber(9)
  void clearInactive() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<MetaData> get metadata => $_getList(9);
}

class Project extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Project', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pronumber')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customerId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startdate')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enddate')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inactive')
    ..pc<MetaData>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Project._() : super();
  factory Project({
    $fixnum.Int64? id,
    $core.String? pronumber,
    $core.String? description,
    $fixnum.Int64? customerId,
    $core.String? startdate,
    $core.String? enddate,
    $core.String? notes,
    $core.bool? inactive,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (pronumber != null) {
      _result.pronumber = pronumber;
    }
    if (description != null) {
      _result.description = description;
    }
    if (customerId != null) {
      _result.customerId = customerId;
    }
    if (startdate != null) {
      _result.startdate = startdate;
    }
    if (enddate != null) {
      _result.enddate = enddate;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (inactive != null) {
      _result.inactive = inactive;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Project.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Project.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Project clone() => Project()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Project copyWith(void Function(Project) updates) => super.copyWith((message) => updates(message as Project)) as Project; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Project create() => Project._();
  Project createEmptyInstance() => create();
  static $pb.PbList<Project> createRepeated() => $pb.PbList<Project>();
  @$core.pragma('dart2js:noInline')
  static Project getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Project>(create);
  static Project? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get pronumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set pronumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPronumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearPronumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get customerId => $_getI64(3);
  @$pb.TagNumber(4)
  set customerId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCustomerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCustomerId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get startdate => $_getSZ(4);
  @$pb.TagNumber(5)
  set startdate($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStartdate() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartdate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get enddate => $_getSZ(5);
  @$pb.TagNumber(6)
  set enddate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEnddate() => $_has(5);
  @$pb.TagNumber(6)
  void clearEnddate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get notes => $_getSZ(6);
  @$pb.TagNumber(7)
  set notes($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNotes() => $_has(6);
  @$pb.TagNumber(7)
  void clearNotes() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get inactive => $_getBF(7);
  @$pb.TagNumber(8)
  set inactive($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasInactive() => $_has(7);
  @$pb.TagNumber(8)
  void clearInactive() => clearField(8);

  @$pb.TagNumber(10)
  $core.List<MetaData> get metadata => $_getList(8);
}

class Rate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Rate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ratetype')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ratedate')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curr')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'placeId')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rategroup')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ratevalue', $pb.PbFieldType.OD)
    ..pc<MetaData>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Rate._() : super();
  factory Rate({
    $fixnum.Int64? id,
    $fixnum.Int64? ratetype,
    $core.String? ratedate,
    $core.String? curr,
    $fixnum.Int64? placeId,
    $fixnum.Int64? rategroup,
    $core.double? ratevalue,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (ratetype != null) {
      _result.ratetype = ratetype;
    }
    if (ratedate != null) {
      _result.ratedate = ratedate;
    }
    if (curr != null) {
      _result.curr = curr;
    }
    if (placeId != null) {
      _result.placeId = placeId;
    }
    if (rategroup != null) {
      _result.rategroup = rategroup;
    }
    if (ratevalue != null) {
      _result.ratevalue = ratevalue;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Rate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Rate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Rate clone() => Rate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Rate copyWith(void Function(Rate) updates) => super.copyWith((message) => updates(message as Rate)) as Rate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Rate create() => Rate._();
  Rate createEmptyInstance() => create();
  static $pb.PbList<Rate> createRepeated() => $pb.PbList<Rate>();
  @$core.pragma('dart2js:noInline')
  static Rate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Rate>(create);
  static Rate? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get ratetype => $_getI64(1);
  @$pb.TagNumber(2)
  set ratetype($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRatetype() => $_has(1);
  @$pb.TagNumber(2)
  void clearRatetype() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ratedate => $_getSZ(2);
  @$pb.TagNumber(3)
  set ratedate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRatedate() => $_has(2);
  @$pb.TagNumber(3)
  void clearRatedate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get curr => $_getSZ(3);
  @$pb.TagNumber(4)
  set curr($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurr() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurr() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get placeId => $_getI64(4);
  @$pb.TagNumber(5)
  set placeId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPlaceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlaceId() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get rategroup => $_getI64(5);
  @$pb.TagNumber(6)
  set rategroup($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRategroup() => $_has(5);
  @$pb.TagNumber(6)
  void clearRategroup() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get ratevalue => $_getN(6);
  @$pb.TagNumber(7)
  set ratevalue($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRatevalue() => $_has(6);
  @$pb.TagNumber(7)
  void clearRatevalue() => clearField(7);

  @$pb.TagNumber(10)
  $core.List<MetaData> get metadata => $_getList(7);
}

class Tax extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Tax', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taxcode')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rate', $pb.PbFieldType.OD)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inactive')
    ..pc<MetaData>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Tax._() : super();
  factory Tax({
    $fixnum.Int64? id,
    $core.String? taxcode,
    $core.String? description,
    $core.double? rate,
    $core.bool? inactive,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (taxcode != null) {
      _result.taxcode = taxcode;
    }
    if (description != null) {
      _result.description = description;
    }
    if (rate != null) {
      _result.rate = rate;
    }
    if (inactive != null) {
      _result.inactive = inactive;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Tax.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tax.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Tax clone() => Tax()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Tax copyWith(void Function(Tax) updates) => super.copyWith((message) => updates(message as Tax)) as Tax; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tax create() => Tax._();
  Tax createEmptyInstance() => create();
  static $pb.PbList<Tax> createRepeated() => $pb.PbList<Tax>();
  @$core.pragma('dart2js:noInline')
  static Tax getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tax>(create);
  static Tax? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get taxcode => $_getSZ(1);
  @$pb.TagNumber(2)
  set taxcode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTaxcode() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaxcode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get rate => $_getN(3);
  @$pb.TagNumber(4)
  set rate($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRate() => $_has(3);
  @$pb.TagNumber(4)
  void clearRate() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get inactive => $_getBF(4);
  @$pb.TagNumber(5)
  set inactive($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInactive() => $_has(4);
  @$pb.TagNumber(5)
  void clearInactive() => clearField(5);

  @$pb.TagNumber(10)
  $core.List<MetaData> get metadata => $_getList(5);
}

class Tool extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Tool', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serial')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'productId')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toolgroup')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inactive')
    ..pc<MetaData>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Tool._() : super();
  factory Tool({
    $fixnum.Int64? id,
    $core.String? serial,
    $core.String? description,
    $fixnum.Int64? productId,
    $fixnum.Int64? toolgroup,
    $core.String? notes,
    $core.bool? inactive,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (serial != null) {
      _result.serial = serial;
    }
    if (description != null) {
      _result.description = description;
    }
    if (productId != null) {
      _result.productId = productId;
    }
    if (toolgroup != null) {
      _result.toolgroup = toolgroup;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (inactive != null) {
      _result.inactive = inactive;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Tool.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tool.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Tool clone() => Tool()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Tool copyWith(void Function(Tool) updates) => super.copyWith((message) => updates(message as Tool)) as Tool; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tool create() => Tool._();
  Tool createEmptyInstance() => create();
  static $pb.PbList<Tool> createRepeated() => $pb.PbList<Tool>();
  @$core.pragma('dart2js:noInline')
  static Tool getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tool>(create);
  static Tool? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get serial => $_getSZ(1);
  @$pb.TagNumber(2)
  set serial($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSerial() => $_has(1);
  @$pb.TagNumber(2)
  void clearSerial() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get productId => $_getI64(3);
  @$pb.TagNumber(4)
  set productId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProductId() => $_has(3);
  @$pb.TagNumber(4)
  void clearProductId() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get toolgroup => $_getI64(4);
  @$pb.TagNumber(5)
  set toolgroup($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasToolgroup() => $_has(4);
  @$pb.TagNumber(5)
  void clearToolgroup() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get notes => $_getSZ(5);
  @$pb.TagNumber(6)
  set notes($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNotes() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotes() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get inactive => $_getBF(6);
  @$pb.TagNumber(7)
  set inactive($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasInactive() => $_has(6);
  @$pb.TagNumber(7)
  void clearInactive() => clearField(7);

  @$pb.TagNumber(10)
  $core.List<MetaData> get metadata => $_getList(7);
}

class Trans extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Trans', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transnumber')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transtype')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'direction')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refTransnumber')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'crdate')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transdate')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duedate')
    ..aInt64(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customerId')
    ..aInt64(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'employeeId')
    ..aInt64(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'department')
    ..aInt64(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projectId')
    ..aInt64(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'placeId')
    ..aInt64(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paidtype')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curr')
    ..aOB(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notax')
    ..aOB(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paid')
    ..a<$core.double>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'acrate', $pb.PbFieldType.OD)
    ..aOS(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..aOS(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intnotes')
    ..aOS(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fnote')
    ..aInt64(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transtate')
    ..aOB(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'closed')
    ..pc<MetaData>(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: MetaData.create)
    ..hasRequiredFields = false
  ;

  Trans._() : super();
  factory Trans({
    $fixnum.Int64? id,
    $core.String? transnumber,
    $fixnum.Int64? transtype,
    $fixnum.Int64? direction,
    $core.String? refTransnumber,
    $core.String? crdate,
    $core.String? transdate,
    $core.String? duedate,
    $fixnum.Int64? customerId,
    $fixnum.Int64? employeeId,
    $fixnum.Int64? department,
    $fixnum.Int64? projectId,
    $fixnum.Int64? placeId,
    $fixnum.Int64? paidtype,
    $core.String? curr,
    $core.bool? notax,
    $core.bool? paid,
    $core.double? acrate,
    $core.String? notes,
    $core.String? intnotes,
    $core.String? fnote,
    $fixnum.Int64? transtate,
    $core.bool? closed,
    $core.Iterable<MetaData>? metadata,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (transnumber != null) {
      _result.transnumber = transnumber;
    }
    if (transtype != null) {
      _result.transtype = transtype;
    }
    if (direction != null) {
      _result.direction = direction;
    }
    if (refTransnumber != null) {
      _result.refTransnumber = refTransnumber;
    }
    if (crdate != null) {
      _result.crdate = crdate;
    }
    if (transdate != null) {
      _result.transdate = transdate;
    }
    if (duedate != null) {
      _result.duedate = duedate;
    }
    if (customerId != null) {
      _result.customerId = customerId;
    }
    if (employeeId != null) {
      _result.employeeId = employeeId;
    }
    if (department != null) {
      _result.department = department;
    }
    if (projectId != null) {
      _result.projectId = projectId;
    }
    if (placeId != null) {
      _result.placeId = placeId;
    }
    if (paidtype != null) {
      _result.paidtype = paidtype;
    }
    if (curr != null) {
      _result.curr = curr;
    }
    if (notax != null) {
      _result.notax = notax;
    }
    if (paid != null) {
      _result.paid = paid;
    }
    if (acrate != null) {
      _result.acrate = acrate;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (intnotes != null) {
      _result.intnotes = intnotes;
    }
    if (fnote != null) {
      _result.fnote = fnote;
    }
    if (transtate != null) {
      _result.transtate = transtate;
    }
    if (closed != null) {
      _result.closed = closed;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory Trans.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Trans.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Trans clone() => Trans()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Trans copyWith(void Function(Trans) updates) => super.copyWith((message) => updates(message as Trans)) as Trans; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Trans create() => Trans._();
  Trans createEmptyInstance() => create();
  static $pb.PbList<Trans> createRepeated() => $pb.PbList<Trans>();
  @$core.pragma('dart2js:noInline')
  static Trans getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Trans>(create);
  static Trans? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get transnumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set transnumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransnumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransnumber() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get transtype => $_getI64(2);
  @$pb.TagNumber(3)
  set transtype($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTranstype() => $_has(2);
  @$pb.TagNumber(3)
  void clearTranstype() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get direction => $_getI64(3);
  @$pb.TagNumber(4)
  set direction($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDirection() => $_has(3);
  @$pb.TagNumber(4)
  void clearDirection() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get refTransnumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set refTransnumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRefTransnumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearRefTransnumber() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get crdate => $_getSZ(5);
  @$pb.TagNumber(6)
  set crdate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCrdate() => $_has(5);
  @$pb.TagNumber(6)
  void clearCrdate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get transdate => $_getSZ(6);
  @$pb.TagNumber(7)
  set transdate($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTransdate() => $_has(6);
  @$pb.TagNumber(7)
  void clearTransdate() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get duedate => $_getSZ(7);
  @$pb.TagNumber(8)
  set duedate($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDuedate() => $_has(7);
  @$pb.TagNumber(8)
  void clearDuedate() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get customerId => $_getI64(8);
  @$pb.TagNumber(9)
  set customerId($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCustomerId() => $_has(8);
  @$pb.TagNumber(9)
  void clearCustomerId() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get employeeId => $_getI64(9);
  @$pb.TagNumber(10)
  set employeeId($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasEmployeeId() => $_has(9);
  @$pb.TagNumber(10)
  void clearEmployeeId() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get department => $_getI64(10);
  @$pb.TagNumber(11)
  set department($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasDepartment() => $_has(10);
  @$pb.TagNumber(11)
  void clearDepartment() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get projectId => $_getI64(11);
  @$pb.TagNumber(12)
  set projectId($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasProjectId() => $_has(11);
  @$pb.TagNumber(12)
  void clearProjectId() => clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get placeId => $_getI64(12);
  @$pb.TagNumber(13)
  set placeId($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasPlaceId() => $_has(12);
  @$pb.TagNumber(13)
  void clearPlaceId() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get paidtype => $_getI64(13);
  @$pb.TagNumber(14)
  set paidtype($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasPaidtype() => $_has(13);
  @$pb.TagNumber(14)
  void clearPaidtype() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get curr => $_getSZ(14);
  @$pb.TagNumber(15)
  set curr($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasCurr() => $_has(14);
  @$pb.TagNumber(15)
  void clearCurr() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get notax => $_getBF(15);
  @$pb.TagNumber(16)
  set notax($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasNotax() => $_has(15);
  @$pb.TagNumber(16)
  void clearNotax() => clearField(16);

  @$pb.TagNumber(17)
  $core.bool get paid => $_getBF(16);
  @$pb.TagNumber(17)
  set paid($core.bool v) { $_setBool(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasPaid() => $_has(16);
  @$pb.TagNumber(17)
  void clearPaid() => clearField(17);

  @$pb.TagNumber(18)
  $core.double get acrate => $_getN(17);
  @$pb.TagNumber(18)
  set acrate($core.double v) { $_setDouble(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasAcrate() => $_has(17);
  @$pb.TagNumber(18)
  void clearAcrate() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get notes => $_getSZ(18);
  @$pb.TagNumber(19)
  set notes($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasNotes() => $_has(18);
  @$pb.TagNumber(19)
  void clearNotes() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get intnotes => $_getSZ(19);
  @$pb.TagNumber(20)
  set intnotes($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasIntnotes() => $_has(19);
  @$pb.TagNumber(20)
  void clearIntnotes() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get fnote => $_getSZ(20);
  @$pb.TagNumber(21)
  set fnote($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasFnote() => $_has(20);
  @$pb.TagNumber(21)
  void clearFnote() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get transtate => $_getI64(21);
  @$pb.TagNumber(22)
  set transtate($fixnum.Int64 v) { $_setInt64(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasTranstate() => $_has(21);
  @$pb.TagNumber(22)
  void clearTranstate() => clearField(22);

  @$pb.TagNumber(23)
  $core.bool get closed => $_getBF(22);
  @$pb.TagNumber(23)
  set closed($core.bool v) { $_setBool(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasClosed() => $_has(22);
  @$pb.TagNumber(23)
  void clearClosed() => clearField(23);

  @$pb.TagNumber(24)
  $core.List<MetaData> get metadata => $_getList(23);
}

class UiAudit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UiAudit', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usergroup')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtype')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inputfilter')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supervisor')
    ..hasRequiredFields = false
  ;

  UiAudit._() : super();
  factory UiAudit({
    $fixnum.Int64? id,
    $fixnum.Int64? usergroup,
    $fixnum.Int64? nervatype,
    $fixnum.Int64? subtype,
    $fixnum.Int64? inputfilter,
    $core.bool? supervisor,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (usergroup != null) {
      _result.usergroup = usergroup;
    }
    if (nervatype != null) {
      _result.nervatype = nervatype;
    }
    if (subtype != null) {
      _result.subtype = subtype;
    }
    if (inputfilter != null) {
      _result.inputfilter = inputfilter;
    }
    if (supervisor != null) {
      _result.supervisor = supervisor;
    }
    return _result;
  }
  factory UiAudit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UiAudit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UiAudit clone() => UiAudit()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UiAudit copyWith(void Function(UiAudit) updates) => super.copyWith((message) => updates(message as UiAudit)) as UiAudit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UiAudit create() => UiAudit._();
  UiAudit createEmptyInstance() => create();
  static $pb.PbList<UiAudit> createRepeated() => $pb.PbList<UiAudit>();
  @$core.pragma('dart2js:noInline')
  static UiAudit getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UiAudit>(create);
  static UiAudit? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get usergroup => $_getI64(1);
  @$pb.TagNumber(2)
  set usergroup($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsergroup() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsergroup() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get nervatype => $_getI64(2);
  @$pb.TagNumber(3)
  set nervatype($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNervatype() => $_has(2);
  @$pb.TagNumber(3)
  void clearNervatype() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get subtype => $_getI64(3);
  @$pb.TagNumber(4)
  set subtype($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSubtype() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubtype() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get inputfilter => $_getI64(4);
  @$pb.TagNumber(5)
  set inputfilter($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInputfilter() => $_has(4);
  @$pb.TagNumber(5)
  void clearInputfilter() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get supervisor => $_getBF(5);
  @$pb.TagNumber(6)
  set supervisor($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSupervisor() => $_has(5);
  @$pb.TagNumber(6)
  void clearSupervisor() => clearField(6);
}

class UiMenu extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UiMenu', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'menukey')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'modul')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'method')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'funcname')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  UiMenu._() : super();
  factory UiMenu({
    $fixnum.Int64? id,
    $core.String? menukey,
    $core.String? description,
    $core.String? modul,
    $core.String? icon,
    $fixnum.Int64? method,
    $core.String? funcname,
    $core.String? address,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (menukey != null) {
      _result.menukey = menukey;
    }
    if (description != null) {
      _result.description = description;
    }
    if (modul != null) {
      _result.modul = modul;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (method != null) {
      _result.method = method;
    }
    if (funcname != null) {
      _result.funcname = funcname;
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory UiMenu.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UiMenu.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UiMenu clone() => UiMenu()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UiMenu copyWith(void Function(UiMenu) updates) => super.copyWith((message) => updates(message as UiMenu)) as UiMenu; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UiMenu create() => UiMenu._();
  UiMenu createEmptyInstance() => create();
  static $pb.PbList<UiMenu> createRepeated() => $pb.PbList<UiMenu>();
  @$core.pragma('dart2js:noInline')
  static UiMenu getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UiMenu>(create);
  static UiMenu? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get menukey => $_getSZ(1);
  @$pb.TagNumber(2)
  set menukey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMenukey() => $_has(1);
  @$pb.TagNumber(2)
  void clearMenukey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get modul => $_getSZ(3);
  @$pb.TagNumber(4)
  set modul($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasModul() => $_has(3);
  @$pb.TagNumber(4)
  void clearModul() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get method => $_getI64(5);
  @$pb.TagNumber(6)
  set method($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMethod() => $_has(5);
  @$pb.TagNumber(6)
  void clearMethod() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get funcname => $_getSZ(6);
  @$pb.TagNumber(7)
  set funcname($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFuncname() => $_has(6);
  @$pb.TagNumber(7)
  void clearFuncname() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get address => $_getSZ(7);
  @$pb.TagNumber(8)
  set address($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAddress() => $_has(7);
  @$pb.TagNumber(8)
  void clearAddress() => clearField(8);
}

class UiMenufields extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UiMenufields', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'menuId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldname')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldtype')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderby')
    ..hasRequiredFields = false
  ;

  UiMenufields._() : super();
  factory UiMenufields({
    $fixnum.Int64? id,
    $fixnum.Int64? menuId,
    $core.String? fieldname,
    $core.String? description,
    $fixnum.Int64? fieldtype,
    $fixnum.Int64? orderby,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (menuId != null) {
      _result.menuId = menuId;
    }
    if (fieldname != null) {
      _result.fieldname = fieldname;
    }
    if (description != null) {
      _result.description = description;
    }
    if (fieldtype != null) {
      _result.fieldtype = fieldtype;
    }
    if (orderby != null) {
      _result.orderby = orderby;
    }
    return _result;
  }
  factory UiMenufields.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UiMenufields.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UiMenufields clone() => UiMenufields()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UiMenufields copyWith(void Function(UiMenufields) updates) => super.copyWith((message) => updates(message as UiMenufields)) as UiMenufields; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UiMenufields create() => UiMenufields._();
  UiMenufields createEmptyInstance() => create();
  static $pb.PbList<UiMenufields> createRepeated() => $pb.PbList<UiMenufields>();
  @$core.pragma('dart2js:noInline')
  static UiMenufields getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UiMenufields>(create);
  static UiMenufields? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get menuId => $_getI64(1);
  @$pb.TagNumber(2)
  set menuId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMenuId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMenuId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fieldname => $_getSZ(2);
  @$pb.TagNumber(3)
  set fieldname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFieldname() => $_has(2);
  @$pb.TagNumber(3)
  void clearFieldname() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get fieldtype => $_getI64(4);
  @$pb.TagNumber(5)
  set fieldtype($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFieldtype() => $_has(4);
  @$pb.TagNumber(5)
  void clearFieldtype() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get orderby => $_getI64(5);
  @$pb.TagNumber(6)
  set orderby($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrderby() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderby() => clearField(6);
}

class UiMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UiMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secname')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldname')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lang')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  UiMessage._() : super();
  factory UiMessage({
    $fixnum.Int64? id,
    $core.String? secname,
    $core.String? fieldname,
    $core.String? lang,
    $core.String? msg,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (secname != null) {
      _result.secname = secname;
    }
    if (fieldname != null) {
      _result.fieldname = fieldname;
    }
    if (lang != null) {
      _result.lang = lang;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory UiMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UiMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UiMessage clone() => UiMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UiMessage copyWith(void Function(UiMessage) updates) => super.copyWith((message) => updates(message as UiMessage)) as UiMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UiMessage create() => UiMessage._();
  UiMessage createEmptyInstance() => create();
  static $pb.PbList<UiMessage> createRepeated() => $pb.PbList<UiMessage>();
  @$core.pragma('dart2js:noInline')
  static UiMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UiMessage>(create);
  static UiMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secname => $_getSZ(1);
  @$pb.TagNumber(2)
  set secname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecname() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fieldname => $_getSZ(2);
  @$pb.TagNumber(3)
  set fieldname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFieldname() => $_has(2);
  @$pb.TagNumber(3)
  void clearFieldname() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lang => $_getSZ(3);
  @$pb.TagNumber(4)
  set lang($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLang() => $_has(3);
  @$pb.TagNumber(4)
  void clearLang() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get msg => $_getSZ(4);
  @$pb.TagNumber(5)
  set msg($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMsg() => $_has(4);
  @$pb.TagNumber(5)
  void clearMsg() => clearField(5);
}

class UiPrintqueue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UiPrintqueue', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refId')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qty', $pb.PbFieldType.OD)
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'employeeId')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reportId')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'crdate')
    ..hasRequiredFields = false
  ;

  UiPrintqueue._() : super();
  factory UiPrintqueue({
    $fixnum.Int64? id,
    $fixnum.Int64? nervatype,
    $fixnum.Int64? refId,
    $core.double? qty,
    $fixnum.Int64? employeeId,
    $fixnum.Int64? reportId,
    $core.String? crdate,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (nervatype != null) {
      _result.nervatype = nervatype;
    }
    if (refId != null) {
      _result.refId = refId;
    }
    if (qty != null) {
      _result.qty = qty;
    }
    if (employeeId != null) {
      _result.employeeId = employeeId;
    }
    if (reportId != null) {
      _result.reportId = reportId;
    }
    if (crdate != null) {
      _result.crdate = crdate;
    }
    return _result;
  }
  factory UiPrintqueue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UiPrintqueue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UiPrintqueue clone() => UiPrintqueue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UiPrintqueue copyWith(void Function(UiPrintqueue) updates) => super.copyWith((message) => updates(message as UiPrintqueue)) as UiPrintqueue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UiPrintqueue create() => UiPrintqueue._();
  UiPrintqueue createEmptyInstance() => create();
  static $pb.PbList<UiPrintqueue> createRepeated() => $pb.PbList<UiPrintqueue>();
  @$core.pragma('dart2js:noInline')
  static UiPrintqueue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UiPrintqueue>(create);
  static UiPrintqueue? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get nervatype => $_getI64(1);
  @$pb.TagNumber(2)
  set nervatype($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNervatype() => $_has(1);
  @$pb.TagNumber(2)
  void clearNervatype() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get refId => $_getI64(2);
  @$pb.TagNumber(3)
  set refId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefId() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get qty => $_getN(3);
  @$pb.TagNumber(4)
  set qty($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasQty() => $_has(3);
  @$pb.TagNumber(4)
  void clearQty() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get employeeId => $_getI64(4);
  @$pb.TagNumber(5)
  set employeeId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmployeeId() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmployeeId() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get reportId => $_getI64(5);
  @$pb.TagNumber(6)
  set reportId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasReportId() => $_has(5);
  @$pb.TagNumber(6)
  void clearReportId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get crdate => $_getSZ(6);
  @$pb.TagNumber(7)
  set crdate($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCrdate() => $_has(6);
  @$pb.TagNumber(7)
  void clearCrdate() => clearField(7);
}

class UiReport extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UiReport', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reportkey')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nervatype')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transtype')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'direction')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'repname')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'label')
    ..aInt64(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filetype')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'report')
    ..hasRequiredFields = false
  ;

  UiReport._() : super();
  factory UiReport({
    $fixnum.Int64? id,
    $core.String? reportkey,
    $fixnum.Int64? nervatype,
    $fixnum.Int64? transtype,
    $fixnum.Int64? direction,
    $core.String? repname,
    $core.String? description,
    $core.String? label,
    $fixnum.Int64? filetype,
    $core.String? report,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (reportkey != null) {
      _result.reportkey = reportkey;
    }
    if (nervatype != null) {
      _result.nervatype = nervatype;
    }
    if (transtype != null) {
      _result.transtype = transtype;
    }
    if (direction != null) {
      _result.direction = direction;
    }
    if (repname != null) {
      _result.repname = repname;
    }
    if (description != null) {
      _result.description = description;
    }
    if (label != null) {
      _result.label = label;
    }
    if (filetype != null) {
      _result.filetype = filetype;
    }
    if (report != null) {
      _result.report = report;
    }
    return _result;
  }
  factory UiReport.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UiReport.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UiReport clone() => UiReport()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UiReport copyWith(void Function(UiReport) updates) => super.copyWith((message) => updates(message as UiReport)) as UiReport; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UiReport create() => UiReport._();
  UiReport createEmptyInstance() => create();
  static $pb.PbList<UiReport> createRepeated() => $pb.PbList<UiReport>();
  @$core.pragma('dart2js:noInline')
  static UiReport getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UiReport>(create);
  static UiReport? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get reportkey => $_getSZ(1);
  @$pb.TagNumber(2)
  set reportkey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReportkey() => $_has(1);
  @$pb.TagNumber(2)
  void clearReportkey() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get nervatype => $_getI64(2);
  @$pb.TagNumber(3)
  set nervatype($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNervatype() => $_has(2);
  @$pb.TagNumber(3)
  void clearNervatype() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get transtype => $_getI64(3);
  @$pb.TagNumber(4)
  set transtype($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTranstype() => $_has(3);
  @$pb.TagNumber(4)
  void clearTranstype() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get direction => $_getI64(4);
  @$pb.TagNumber(5)
  set direction($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDirection() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirection() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get repname => $_getSZ(5);
  @$pb.TagNumber(6)
  set repname($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRepname() => $_has(5);
  @$pb.TagNumber(6)
  void clearRepname() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get description => $_getSZ(6);
  @$pb.TagNumber(7)
  set description($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearDescription() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get label => $_getSZ(7);
  @$pb.TagNumber(8)
  set label($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLabel() => $_has(7);
  @$pb.TagNumber(8)
  void clearLabel() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get filetype => $_getI64(8);
  @$pb.TagNumber(9)
  set filetype($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFiletype() => $_has(8);
  @$pb.TagNumber(9)
  void clearFiletype() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get report => $_getSZ(9);
  @$pb.TagNumber(10)
  set report($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasReport() => $_has(9);
  @$pb.TagNumber(10)
  void clearReport() => clearField(10);
}

class UiUserconfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UiUserconfig', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nervatura'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'employeeId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'section')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cfgroup')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cfname')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cfvalue')
    ..aInt64(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderby')
    ..hasRequiredFields = false
  ;

  UiUserconfig._() : super();
  factory UiUserconfig({
    $fixnum.Int64? id,
    $fixnum.Int64? employeeId,
    $core.String? section,
    $core.String? cfgroup,
    $core.String? cfname,
    $core.String? cfvalue,
    $fixnum.Int64? orderby,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (employeeId != null) {
      _result.employeeId = employeeId;
    }
    if (section != null) {
      _result.section = section;
    }
    if (cfgroup != null) {
      _result.cfgroup = cfgroup;
    }
    if (cfname != null) {
      _result.cfname = cfname;
    }
    if (cfvalue != null) {
      _result.cfvalue = cfvalue;
    }
    if (orderby != null) {
      _result.orderby = orderby;
    }
    return _result;
  }
  factory UiUserconfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UiUserconfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UiUserconfig clone() => UiUserconfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UiUserconfig copyWith(void Function(UiUserconfig) updates) => super.copyWith((message) => updates(message as UiUserconfig)) as UiUserconfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UiUserconfig create() => UiUserconfig._();
  UiUserconfig createEmptyInstance() => create();
  static $pb.PbList<UiUserconfig> createRepeated() => $pb.PbList<UiUserconfig>();
  @$core.pragma('dart2js:noInline')
  static UiUserconfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UiUserconfig>(create);
  static UiUserconfig? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get employeeId => $_getI64(1);
  @$pb.TagNumber(2)
  set employeeId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmployeeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmployeeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get section => $_getSZ(2);
  @$pb.TagNumber(3)
  set section($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSection() => $_has(2);
  @$pb.TagNumber(3)
  void clearSection() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get cfgroup => $_getSZ(3);
  @$pb.TagNumber(4)
  set cfgroup($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCfgroup() => $_has(3);
  @$pb.TagNumber(4)
  void clearCfgroup() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get cfname => $_getSZ(4);
  @$pb.TagNumber(5)
  set cfname($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCfname() => $_has(4);
  @$pb.TagNumber(5)
  void clearCfname() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get cfvalue => $_getSZ(5);
  @$pb.TagNumber(6)
  set cfvalue($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCfvalue() => $_has(5);
  @$pb.TagNumber(6)
  void clearCfvalue() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get orderby => $_getI64(6);
  @$pb.TagNumber(7)
  set orderby($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrderby() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrderby() => clearField(7);
}

