//
//  Generated code. Do not modify.
//  source: login.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LoginRequest extends $pb.GeneratedMessage {
  factory LoginRequest({
    $core.String? account,
    $core.String? password,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  LoginRequest._() : super();
  factory LoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'login'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'account')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRequest copyWith(void Function(LoginRequest) updates) => super.copyWith((message) => updates(message as LoginRequest)) as LoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() => $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class Auth extends $pb.GeneratedMessage {
  factory Auth({
    $core.int? accountId,
    $core.int? accountTypeId,
    $core.int? agencyId,
    $core.int? academyId,
    $core.String? account,
    $core.int? state,
  }) {
    final $result = create();
    if (accountId != null) {
      $result.accountId = accountId;
    }
    if (accountTypeId != null) {
      $result.accountTypeId = accountTypeId;
    }
    if (agencyId != null) {
      $result.agencyId = agencyId;
    }
    if (academyId != null) {
      $result.academyId = academyId;
    }
    if (account != null) {
      $result.account = account;
    }
    if (state != null) {
      $result.state = state;
    }
    return $result;
  }
  Auth._() : super();
  factory Auth.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Auth.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Auth', package: const $pb.PackageName(_omitMessageNames ? '' : 'login'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'accountId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'accountTypeId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'agencyId', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'academyId', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'account')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'state', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Auth clone() => Auth()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Auth copyWith(void Function(Auth) updates) => super.copyWith((message) => updates(message as Auth)) as Auth;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Auth create() => Auth._();
  Auth createEmptyInstance() => create();
  static $pb.PbList<Auth> createRepeated() => $pb.PbList<Auth>();
  @$core.pragma('dart2js:noInline')
  static Auth getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Auth>(create);
  static Auth? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get accountId => $_getIZ(0);
  @$pb.TagNumber(1)
  set accountId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get accountTypeId => $_getIZ(1);
  @$pb.TagNumber(2)
  set accountTypeId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountTypeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountTypeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get agencyId => $_getIZ(2);
  @$pb.TagNumber(3)
  set agencyId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAgencyId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAgencyId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get academyId => $_getIZ(3);
  @$pb.TagNumber(4)
  set academyId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAcademyId() => $_has(3);
  @$pb.TagNumber(4)
  void clearAcademyId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get account => $_getSZ(4);
  @$pb.TagNumber(5)
  set account($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAccount() => $_has(4);
  @$pb.TagNumber(5)
  void clearAccount() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get state => $_getIZ(5);
  @$pb.TagNumber(6)
  set state($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);
}

class ErrorDetail extends $pb.GeneratedMessage {
  factory ErrorDetail({
    $core.String? code,
    $core.String? message,
    $core.String? userMessage,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (message != null) {
      $result.message = message;
    }
    if (userMessage != null) {
      $result.userMessage = userMessage;
    }
    return $result;
  }
  ErrorDetail._() : super();
  factory ErrorDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ErrorDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ErrorDetail', package: const $pb.PackageName(_omitMessageNames ? '' : 'login'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'userMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ErrorDetail clone() => ErrorDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ErrorDetail copyWith(void Function(ErrorDetail) updates) => super.copyWith((message) => updates(message as ErrorDetail)) as ErrorDetail;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ErrorDetail create() => ErrorDetail._();
  ErrorDetail createEmptyInstance() => create();
  static $pb.PbList<ErrorDetail> createRepeated() => $pb.PbList<ErrorDetail>();
  @$core.pragma('dart2js:noInline')
  static ErrorDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ErrorDetail>(create);
  static ErrorDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set userMessage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserMessage() => clearField(3);
}

enum LoginResponse_Result {
  auth, 
  error, 
  notSet
}

/// 로그인 응답 구조체 (성공/실패 모두 처리)
class LoginResponse extends $pb.GeneratedMessage {
  factory LoginResponse({
    $core.bool? success,
    Auth? auth,
    ErrorDetail? error,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (auth != null) {
      $result.auth = auth;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  LoginResponse._() : super();
  factory LoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, LoginResponse_Result> _LoginResponse_ResultByTag = {
    2 : LoginResponse_Result.auth,
    3 : LoginResponse_Result.error,
    0 : LoginResponse_Result.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'login'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<Auth>(2, _omitFieldNames ? '' : 'auth', subBuilder: Auth.create)
    ..aOM<ErrorDetail>(3, _omitFieldNames ? '' : 'error', subBuilder: ErrorDetail.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginResponse clone() => LoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginResponse copyWith(void Function(LoginResponse) updates) => super.copyWith((message) => updates(message as LoginResponse)) as LoginResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginResponse create() => LoginResponse._();
  LoginResponse createEmptyInstance() => create();
  static $pb.PbList<LoginResponse> createRepeated() => $pb.PbList<LoginResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginResponse>(create);
  static LoginResponse? _defaultInstance;

  LoginResponse_Result whichResult() => _LoginResponse_ResultByTag[$_whichOneof(0)]!;
  void clearResult() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  Auth get auth => $_getN(1);
  @$pb.TagNumber(2)
  set auth(Auth v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuth() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuth() => clearField(2);
  @$pb.TagNumber(2)
  Auth ensureAuth() => $_ensure(1);

  @$pb.TagNumber(3)
  ErrorDetail get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(ErrorDetail v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
  @$pb.TagNumber(3)
  ErrorDetail ensureError() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
