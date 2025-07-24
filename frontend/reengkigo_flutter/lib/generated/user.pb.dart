//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class UserProfile extends $pb.GeneratedMessage {
  factory UserProfile({
    $core.int? userId,
    $core.String? username,
    $core.String? email,
    $core.String? fullName,
    $fixnum.Int64? createdAt,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (username != null) {
      $result.username = username;
    }
    if (email != null) {
      $result.email = email;
    }
    if (fullName != null) {
      $result.fullName = fullName;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  UserProfile._() : super();
  factory UserProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'fullName')
    ..aInt64(5, _omitFieldNames ? '' : 'createdAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserProfile clone() => UserProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserProfile copyWith(void Function(UserProfile) updates) => super.copyWith((message) => updates(message as UserProfile)) as UserProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserProfile create() => UserProfile._();
  UserProfile createEmptyInstance() => create();
  static $pb.PbList<UserProfile> createRepeated() => $pb.PbList<UserProfile>();
  @$core.pragma('dart2js:noInline')
  static UserProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserProfile>(create);
  static UserProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get fullName => $_getSZ(3);
  @$pb.TagNumber(4)
  set fullName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFullName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFullName() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createdAt => $_getI64(4);
  @$pb.TagNumber(5)
  set createdAt($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
}

class GetUserProfileRequest extends $pb.GeneratedMessage {
  factory GetUserProfileRequest({
    $core.int? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetUserProfileRequest._() : super();
  factory GetUserProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserProfileRequest clone() => GetUserProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserProfileRequest copyWith(void Function(GetUserProfileRequest) updates) => super.copyWith((message) => updates(message as GetUserProfileRequest)) as GetUserProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserProfileRequest create() => GetUserProfileRequest._();
  GetUserProfileRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserProfileRequest> createRepeated() => $pb.PbList<GetUserProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserProfileRequest>(create);
  static GetUserProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class GetUserProfileResponse extends $pb.GeneratedMessage {
  factory GetUserProfileResponse({
    UserProfile? profile,
  }) {
    final $result = create();
    if (profile != null) {
      $result.profile = profile;
    }
    return $result;
  }
  GetUserProfileResponse._() : super();
  factory GetUserProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<UserProfile>(1, _omitFieldNames ? '' : 'profile', subBuilder: UserProfile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserProfileResponse clone() => GetUserProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserProfileResponse copyWith(void Function(GetUserProfileResponse) updates) => super.copyWith((message) => updates(message as GetUserProfileResponse)) as GetUserProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserProfileResponse create() => GetUserProfileResponse._();
  GetUserProfileResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserProfileResponse> createRepeated() => $pb.PbList<GetUserProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserProfileResponse>(create);
  static GetUserProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  UserProfile get profile => $_getN(0);
  @$pb.TagNumber(1)
  set profile(UserProfile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfile() => clearField(1);
  @$pb.TagNumber(1)
  UserProfile ensureProfile() => $_ensure(0);
}

class UpdateUserProfileRequest extends $pb.GeneratedMessage {
  factory UpdateUserProfileRequest({
    $core.int? userId,
    $core.String? username,
    $core.String? email,
    $core.String? fullName,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (username != null) {
      $result.username = username;
    }
    if (email != null) {
      $result.email = email;
    }
    if (fullName != null) {
      $result.fullName = fullName;
    }
    return $result;
  }
  UpdateUserProfileRequest._() : super();
  factory UpdateUserProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'fullName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserProfileRequest clone() => UpdateUserProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserProfileRequest copyWith(void Function(UpdateUserProfileRequest) updates) => super.copyWith((message) => updates(message as UpdateUserProfileRequest)) as UpdateUserProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserProfileRequest create() => UpdateUserProfileRequest._();
  UpdateUserProfileRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateUserProfileRequest> createRepeated() => $pb.PbList<UpdateUserProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserProfileRequest>(create);
  static UpdateUserProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get fullName => $_getSZ(3);
  @$pb.TagNumber(4)
  set fullName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFullName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFullName() => clearField(4);
}

class UpdateUserProfileResponse extends $pb.GeneratedMessage {
  factory UpdateUserProfileResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  UpdateUserProfileResponse._() : super();
  factory UpdateUserProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserProfileResponse clone() => UpdateUserProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserProfileResponse copyWith(void Function(UpdateUserProfileResponse) updates) => super.copyWith((message) => updates(message as UpdateUserProfileResponse)) as UpdateUserProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserProfileResponse create() => UpdateUserProfileResponse._();
  UpdateUserProfileResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateUserProfileResponse> createRepeated() => $pb.PbList<UpdateUserProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserProfileResponse>(create);
  static UpdateUserProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
