///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class DataType extends $pb.ProtobufEnum {
  static const DataType address = DataType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'address');
  static const DataType barcode = DataType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'barcode');
  static const DataType contact = DataType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'contact');
  static const DataType currency = DataType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'currency');
  static const DataType customer = DataType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'customer');
  static const DataType deffield = DataType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'deffield');
  static const DataType employee = DataType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'employee');
  static const DataType event = DataType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'event');
  static const DataType fieldvalue = DataType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'fieldvalue');
  static const DataType groups = DataType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'groups');
  static const DataType item = DataType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'item');
  static const DataType link = DataType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'link');
  static const DataType log = DataType._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'log');
  static const DataType movement = DataType._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'movement');
  static const DataType numberdef = DataType._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'numberdef');
  static const DataType pattern = DataType._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'pattern');
  static const DataType payment = DataType._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'payment');
  static const DataType place = DataType._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'place');
  static const DataType price = DataType._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'price');
  static const DataType product = DataType._(19, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'product');
  static const DataType project = DataType._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'project');
  static const DataType rate = DataType._(21, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'rate');
  static const DataType tax = DataType._(22, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'tax');
  static const DataType tool = DataType._(23, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'tool');
  static const DataType trans = DataType._(24, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'trans');
  static const DataType ui_audit = DataType._(25, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ui_audit');
  static const DataType ui_menu = DataType._(26, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ui_menu');
  static const DataType ui_menufields = DataType._(27, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ui_menufields');
  static const DataType ui_message = DataType._(28, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ui_message');
  static const DataType ui_printqueue = DataType._(29, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ui_printqueue');
  static const DataType ui_report = DataType._(30, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ui_report');
  static const DataType ui_userconfig = DataType._(31, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ui_userconfig');

  static const $core.List<DataType> values = <DataType> [
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
    ui_audit,
    ui_menu,
    ui_menufields,
    ui_message,
    ui_printqueue,
    ui_report,
    ui_userconfig,
  ];

  static final $core.Map<$core.int, DataType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DataType? valueOf($core.int value) => _byValue[value];

  const DataType._($core.int v, $core.String n) : super(v, n);
}

class ReportOrientation extends $pb.ProtobufEnum {
  static const ReportOrientation portrait = ReportOrientation._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'portrait');
  static const ReportOrientation landscape = ReportOrientation._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'landscape');

  static const $core.List<ReportOrientation> values = <ReportOrientation> [
    portrait,
    landscape,
  ];

  static final $core.Map<$core.int, ReportOrientation> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReportOrientation? valueOf($core.int value) => _byValue[value];

  const ReportOrientation._($core.int v, $core.String n) : super(v, n);
}

class ReportSize extends $pb.ProtobufEnum {
  static const ReportSize a3 = ReportSize._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'a3');
  static const ReportSize a4 = ReportSize._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'a4');
  static const ReportSize a5 = ReportSize._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'a5');
  static const ReportSize letter = ReportSize._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'letter');
  static const ReportSize legal = ReportSize._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'legal');

  static const $core.List<ReportSize> values = <ReportSize> [
    a3,
    a4,
    a5,
    letter,
    legal,
  ];

  static final $core.Map<$core.int, ReportSize> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReportSize? valueOf($core.int value) => _byValue[value];

  const ReportSize._($core.int v, $core.String n) : super(v, n);
}

class ReportOutput extends $pb.ProtobufEnum {
  static const ReportOutput auto = ReportOutput._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'auto');
  static const ReportOutput xml = ReportOutput._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'xml');
  static const ReportOutput data = ReportOutput._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'data');
  static const ReportOutput base64 = ReportOutput._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'base64');

  static const $core.List<ReportOutput> values = <ReportOutput> [
    auto,
    xml,
    data,
    base64,
  ];

  static final $core.Map<$core.int, ReportOutput> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReportOutput? valueOf($core.int value) => _byValue[value];

  const ReportOutput._($core.int v, $core.String n) : super(v, n);
}

class ReportType extends $pb.ProtobufEnum {
  static const ReportType report_none = ReportType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'report_none');
  static const ReportType report_customer = ReportType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'report_customer');
  static const ReportType report_employee = ReportType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'report_employee');
  static const ReportType report_event = ReportType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'report_event');
  static const ReportType report_place = ReportType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'report_place');
  static const ReportType report_product = ReportType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'report_product');
  static const ReportType report_project = ReportType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'report_project');
  static const ReportType report_tool = ReportType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'report_tool');
  static const ReportType report_trans = ReportType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'report_trans');

  static const $core.List<ReportType> values = <ReportType> [
    report_none,
    report_customer,
    report_employee,
    report_event,
    report_place,
    report_product,
    report_project,
    report_tool,
    report_trans,
  ];

  static final $core.Map<$core.int, ReportType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReportType? valueOf($core.int value) => _byValue[value];

  const ReportType._($core.int v, $core.String n) : super(v, n);
}

