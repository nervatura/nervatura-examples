///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'api.pb.dart' as $0;
export 'api.pb.dart';

class APIClient extends $grpc.Client {
  static final _$userLogin =
      $grpc.ClientMethod<$0.RequestUserLogin, $0.ResponseUserLogin>(
          '/nervatura.API/UserLogin',
          ($0.RequestUserLogin value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResponseUserLogin.fromBuffer(value));
  static final _$userPassword =
      $grpc.ClientMethod<$0.RequestUserPassword, $0.ResponseEmpty>(
          '/nervatura.API/UserPassword',
          ($0.RequestUserPassword value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ResponseEmpty.fromBuffer(value));
  static final _$tokenLogin =
      $grpc.ClientMethod<$0.RequestEmpty, $0.ResponseTokenLogin>(
          '/nervatura.API/TokenLogin',
          ($0.RequestEmpty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResponseTokenLogin.fromBuffer(value));
  static final _$tokenRefresh =
      $grpc.ClientMethod<$0.RequestEmpty, $0.ResponseTokenRefresh>(
          '/nervatura.API/TokenRefresh',
          ($0.RequestEmpty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResponseTokenRefresh.fromBuffer(value));
  static final _$tokenDecode =
      $grpc.ClientMethod<$0.RequestTokenDecode, $0.ResponseTokenDecode>(
          '/nervatura.API/TokenDecode',
          ($0.RequestTokenDecode value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResponseTokenDecode.fromBuffer(value));
  static final _$get = $grpc.ClientMethod<$0.RequestGet, $0.ResponseGet>(
      '/nervatura.API/Get',
      ($0.RequestGet value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResponseGet.fromBuffer(value));
  static final _$update =
      $grpc.ClientMethod<$0.RequestUpdate, $0.ResponseUpdate>(
          '/nervatura.API/Update',
          ($0.RequestUpdate value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ResponseUpdate.fromBuffer(value));
  static final _$delete =
      $grpc.ClientMethod<$0.RequestDelete, $0.ResponseEmpty>(
          '/nervatura.API/Delete',
          ($0.RequestDelete value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ResponseEmpty.fromBuffer(value));
  static final _$view = $grpc.ClientMethod<$0.RequestView, $0.ResponseView>(
      '/nervatura.API/View',
      ($0.RequestView value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResponseView.fromBuffer(value));
  static final _$function =
      $grpc.ClientMethod<$0.RequestFunction, $0.ResponseFunction>(
          '/nervatura.API/Function',
          ($0.RequestFunction value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResponseFunction.fromBuffer(value));
  static final _$report =
      $grpc.ClientMethod<$0.RequestReport, $0.ResponseReport>(
          '/nervatura.API/Report',
          ($0.RequestReport value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ResponseReport.fromBuffer(value));
  static final _$reportList =
      $grpc.ClientMethod<$0.RequestReportList, $0.ResponseReportList>(
          '/nervatura.API/ReportList',
          ($0.RequestReportList value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResponseReportList.fromBuffer(value));
  static final _$reportInstall =
      $grpc.ClientMethod<$0.RequestReportInstall, $0.ResponseReportInstall>(
          '/nervatura.API/ReportInstall',
          ($0.RequestReportInstall value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResponseReportInstall.fromBuffer(value));
  static final _$reportDelete =
      $grpc.ClientMethod<$0.RequestReportDelete, $0.ResponseEmpty>(
          '/nervatura.API/ReportDelete',
          ($0.RequestReportDelete value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ResponseEmpty.fromBuffer(value));
  static final _$databaseCreate =
      $grpc.ClientMethod<$0.RequestDatabaseCreate, $0.ResponseDatabaseCreate>(
          '/nervatura.API/DatabaseCreate',
          ($0.RequestDatabaseCreate value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResponseDatabaseCreate.fromBuffer(value));

  APIClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ResponseUserLogin> userLogin(
      $0.RequestUserLogin request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userLogin, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseEmpty> userPassword(
      $0.RequestUserPassword request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userPassword, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseTokenLogin> tokenLogin(
      $0.RequestEmpty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$tokenLogin, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseTokenRefresh> tokenRefresh(
      $0.RequestEmpty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$tokenRefresh, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseTokenDecode> tokenDecode(
      $0.RequestTokenDecode request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$tokenDecode, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseGet> get($0.RequestGet request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseUpdate> update($0.RequestUpdate request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseEmpty> delete($0.RequestDelete request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseView> view($0.RequestView request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$view, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseFunction> function($0.RequestFunction request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$function, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseReport> report($0.RequestReport request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$report, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseReportList> reportList(
      $0.RequestReportList request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reportList, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseReportInstall> reportInstall(
      $0.RequestReportInstall request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reportInstall, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseEmpty> reportDelete(
      $0.RequestReportDelete request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reportDelete, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseDatabaseCreate> databaseCreate(
      $0.RequestDatabaseCreate request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$databaseCreate, request, options: options);
  }
}

abstract class APIServiceBase extends $grpc.Service {
  $core.String get $name => 'nervatura.API';

  APIServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RequestUserLogin, $0.ResponseUserLogin>(
        'UserLogin',
        userLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestUserLogin.fromBuffer(value),
        ($0.ResponseUserLogin value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestUserPassword, $0.ResponseEmpty>(
        'UserPassword',
        userPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RequestUserPassword.fromBuffer(value),
        ($0.ResponseEmpty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestEmpty, $0.ResponseTokenLogin>(
        'TokenLogin',
        tokenLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestEmpty.fromBuffer(value),
        ($0.ResponseTokenLogin value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestEmpty, $0.ResponseTokenRefresh>(
        'TokenRefresh',
        tokenRefresh_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestEmpty.fromBuffer(value),
        ($0.ResponseTokenRefresh value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.RequestTokenDecode, $0.ResponseTokenDecode>(
            'TokenDecode',
            tokenDecode_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.RequestTokenDecode.fromBuffer(value),
            ($0.ResponseTokenDecode value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestGet, $0.ResponseGet>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestGet.fromBuffer(value),
        ($0.ResponseGet value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestUpdate, $0.ResponseUpdate>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestUpdate.fromBuffer(value),
        ($0.ResponseUpdate value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestDelete, $0.ResponseEmpty>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestDelete.fromBuffer(value),
        ($0.ResponseEmpty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestView, $0.ResponseView>(
        'View',
        view_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestView.fromBuffer(value),
        ($0.ResponseView value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestFunction, $0.ResponseFunction>(
        'Function',
        function_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestFunction.fromBuffer(value),
        ($0.ResponseFunction value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestReport, $0.ResponseReport>(
        'Report',
        report_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestReport.fromBuffer(value),
        ($0.ResponseReport value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestReportList, $0.ResponseReportList>(
        'ReportList',
        reportList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestReportList.fromBuffer(value),
        ($0.ResponseReportList value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.RequestReportInstall, $0.ResponseReportInstall>(
            'ReportInstall',
            reportInstall_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.RequestReportInstall.fromBuffer(value),
            ($0.ResponseReportInstall value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestReportDelete, $0.ResponseEmpty>(
        'ReportDelete',
        reportDelete_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RequestReportDelete.fromBuffer(value),
        ($0.ResponseEmpty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestDatabaseCreate,
            $0.ResponseDatabaseCreate>(
        'DatabaseCreate',
        databaseCreate_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RequestDatabaseCreate.fromBuffer(value),
        ($0.ResponseDatabaseCreate value) => value.writeToBuffer()));
  }

  $async.Future<$0.ResponseUserLogin> userLogin_Pre($grpc.ServiceCall call,
      $async.Future<$0.RequestUserLogin> request) async {
    return userLogin(call, await request);
  }

  $async.Future<$0.ResponseEmpty> userPassword_Pre($grpc.ServiceCall call,
      $async.Future<$0.RequestUserPassword> request) async {
    return userPassword(call, await request);
  }

  $async.Future<$0.ResponseTokenLogin> tokenLogin_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RequestEmpty> request) async {
    return tokenLogin(call, await request);
  }

  $async.Future<$0.ResponseTokenRefresh> tokenRefresh_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RequestEmpty> request) async {
    return tokenRefresh(call, await request);
  }

  $async.Future<$0.ResponseTokenDecode> tokenDecode_Pre($grpc.ServiceCall call,
      $async.Future<$0.RequestTokenDecode> request) async {
    return tokenDecode(call, await request);
  }

  $async.Future<$0.ResponseGet> get_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RequestGet> request) async {
    return get(call, await request);
  }

  $async.Future<$0.ResponseUpdate> update_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RequestUpdate> request) async {
    return update(call, await request);
  }

  $async.Future<$0.ResponseEmpty> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RequestDelete> request) async {
    return delete(call, await request);
  }

  $async.Future<$0.ResponseView> view_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RequestView> request) async {
    return view(call, await request);
  }

  $async.Future<$0.ResponseFunction> function_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RequestFunction> request) async {
    return function(call, await request);
  }

  $async.Future<$0.ResponseReport> report_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RequestReport> request) async {
    return report(call, await request);
  }

  $async.Future<$0.ResponseReportList> reportList_Pre($grpc.ServiceCall call,
      $async.Future<$0.RequestReportList> request) async {
    return reportList(call, await request);
  }

  $async.Future<$0.ResponseReportInstall> reportInstall_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RequestReportInstall> request) async {
    return reportInstall(call, await request);
  }

  $async.Future<$0.ResponseEmpty> reportDelete_Pre($grpc.ServiceCall call,
      $async.Future<$0.RequestReportDelete> request) async {
    return reportDelete(call, await request);
  }

  $async.Future<$0.ResponseDatabaseCreate> databaseCreate_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RequestDatabaseCreate> request) async {
    return databaseCreate(call, await request);
  }

  $async.Future<$0.ResponseUserLogin> userLogin(
      $grpc.ServiceCall call, $0.RequestUserLogin request);
  $async.Future<$0.ResponseEmpty> userPassword(
      $grpc.ServiceCall call, $0.RequestUserPassword request);
  $async.Future<$0.ResponseTokenLogin> tokenLogin(
      $grpc.ServiceCall call, $0.RequestEmpty request);
  $async.Future<$0.ResponseTokenRefresh> tokenRefresh(
      $grpc.ServiceCall call, $0.RequestEmpty request);
  $async.Future<$0.ResponseTokenDecode> tokenDecode(
      $grpc.ServiceCall call, $0.RequestTokenDecode request);
  $async.Future<$0.ResponseGet> get(
      $grpc.ServiceCall call, $0.RequestGet request);
  $async.Future<$0.ResponseUpdate> update(
      $grpc.ServiceCall call, $0.RequestUpdate request);
  $async.Future<$0.ResponseEmpty> delete(
      $grpc.ServiceCall call, $0.RequestDelete request);
  $async.Future<$0.ResponseView> view(
      $grpc.ServiceCall call, $0.RequestView request);
  $async.Future<$0.ResponseFunction> function(
      $grpc.ServiceCall call, $0.RequestFunction request);
  $async.Future<$0.ResponseReport> report(
      $grpc.ServiceCall call, $0.RequestReport request);
  $async.Future<$0.ResponseReportList> reportList(
      $grpc.ServiceCall call, $0.RequestReportList request);
  $async.Future<$0.ResponseReportInstall> reportInstall(
      $grpc.ServiceCall call, $0.RequestReportInstall request);
  $async.Future<$0.ResponseEmpty> reportDelete(
      $grpc.ServiceCall call, $0.RequestReportDelete request);
  $async.Future<$0.ResponseDatabaseCreate> databaseCreate(
      $grpc.ServiceCall call, $0.RequestDatabaseCreate request);
}
