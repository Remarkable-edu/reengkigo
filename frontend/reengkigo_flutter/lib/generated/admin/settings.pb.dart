//
//  Generated code. Do not modify.
//  source: admin/settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AdminSettings extends $pb.GeneratedMessage {
  factory AdminSettings({
    $core.int? settingId,
    $core.String? key,
    $core.String? value,
    $core.String? description,
  }) {
    final $result = create();
    if (settingId != null) {
      $result.settingId = settingId;
    }
    if (key != null) {
      $result.key = key;
    }
    if (value != null) {
      $result.value = value;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  AdminSettings._() : super();
  factory AdminSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'admin'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'settingId', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'key')
    ..aOS(3, _omitFieldNames ? '' : 'value')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminSettings clone() => AdminSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminSettings copyWith(void Function(AdminSettings) updates) => super.copyWith((message) => updates(message as AdminSettings)) as AdminSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminSettings create() => AdminSettings._();
  AdminSettings createEmptyInstance() => create();
  static $pb.PbList<AdminSettings> createRepeated() => $pb.PbList<AdminSettings>();
  @$core.pragma('dart2js:noInline')
  static AdminSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminSettings>(create);
  static AdminSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get settingId => $_getIZ(0);
  @$pb.TagNumber(1)
  set settingId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSettingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSettingId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(2);
  @$pb.TagNumber(3)
  set value($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);
}

class GetSettingsRequest extends $pb.GeneratedMessage {
  factory GetSettingsRequest({
    $core.Iterable<$core.String>? keys,
  }) {
    final $result = create();
    if (keys != null) {
      $result.keys.addAll(keys);
    }
    return $result;
  }
  GetSettingsRequest._() : super();
  factory GetSettingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSettingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSettingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'admin'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'keys')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSettingsRequest clone() => GetSettingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSettingsRequest copyWith(void Function(GetSettingsRequest) updates) => super.copyWith((message) => updates(message as GetSettingsRequest)) as GetSettingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSettingsRequest create() => GetSettingsRequest._();
  GetSettingsRequest createEmptyInstance() => create();
  static $pb.PbList<GetSettingsRequest> createRepeated() => $pb.PbList<GetSettingsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSettingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSettingsRequest>(create);
  static GetSettingsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get keys => $_getList(0);
}

class GetSettingsResponse extends $pb.GeneratedMessage {
  factory GetSettingsResponse({
    $core.Iterable<AdminSettings>? settings,
  }) {
    final $result = create();
    if (settings != null) {
      $result.settings.addAll(settings);
    }
    return $result;
  }
  GetSettingsResponse._() : super();
  factory GetSettingsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSettingsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSettingsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'admin'), createEmptyInstance: create)
    ..pc<AdminSettings>(1, _omitFieldNames ? '' : 'settings', $pb.PbFieldType.PM, subBuilder: AdminSettings.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSettingsResponse clone() => GetSettingsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSettingsResponse copyWith(void Function(GetSettingsResponse) updates) => super.copyWith((message) => updates(message as GetSettingsResponse)) as GetSettingsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSettingsResponse create() => GetSettingsResponse._();
  GetSettingsResponse createEmptyInstance() => create();
  static $pb.PbList<GetSettingsResponse> createRepeated() => $pb.PbList<GetSettingsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSettingsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSettingsResponse>(create);
  static GetSettingsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AdminSettings> get settings => $_getList(0);
}

class UpdateSettingsRequest extends $pb.GeneratedMessage {
  factory UpdateSettingsRequest({
    $core.Iterable<AdminSettings>? settings,
  }) {
    final $result = create();
    if (settings != null) {
      $result.settings.addAll(settings);
    }
    return $result;
  }
  UpdateSettingsRequest._() : super();
  factory UpdateSettingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSettingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSettingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'admin'), createEmptyInstance: create)
    ..pc<AdminSettings>(1, _omitFieldNames ? '' : 'settings', $pb.PbFieldType.PM, subBuilder: AdminSettings.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSettingsRequest clone() => UpdateSettingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSettingsRequest copyWith(void Function(UpdateSettingsRequest) updates) => super.copyWith((message) => updates(message as UpdateSettingsRequest)) as UpdateSettingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSettingsRequest create() => UpdateSettingsRequest._();
  UpdateSettingsRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSettingsRequest> createRepeated() => $pb.PbList<UpdateSettingsRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSettingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSettingsRequest>(create);
  static UpdateSettingsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AdminSettings> get settings => $_getList(0);
}

class UpdateSettingsResponse extends $pb.GeneratedMessage {
  factory UpdateSettingsResponse({
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
  UpdateSettingsResponse._() : super();
  factory UpdateSettingsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSettingsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSettingsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'admin'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSettingsResponse clone() => UpdateSettingsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSettingsResponse copyWith(void Function(UpdateSettingsResponse) updates) => super.copyWith((message) => updates(message as UpdateSettingsResponse)) as UpdateSettingsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSettingsResponse create() => UpdateSettingsResponse._();
  UpdateSettingsResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSettingsResponse> createRepeated() => $pb.PbList<UpdateSettingsResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSettingsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSettingsResponse>(create);
  static UpdateSettingsResponse? _defaultInstance;

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
