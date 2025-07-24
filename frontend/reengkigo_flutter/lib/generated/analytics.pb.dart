//
//  Generated code. Do not modify.
//  source: analytics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class EventData extends $pb.GeneratedMessage {
  factory EventData({
    $core.String? eventType,
    $fixnum.Int64? timestamp,
    $core.String? userId,
    $core.Map<$core.String, $core.String>? properties,
  }) {
    final $result = create();
    if (eventType != null) {
      $result.eventType = eventType;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (properties != null) {
      $result.properties.addAll(properties);
    }
    return $result;
  }
  EventData._() : super();
  factory EventData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EventData', package: const $pb.PackageName(_omitMessageNames ? '' : 'analytics'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'eventType')
    ..aInt64(2, _omitFieldNames ? '' : 'timestamp')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..m<$core.String, $core.String>(4, _omitFieldNames ? '' : 'properties', entryClassName: 'EventData.PropertiesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('analytics'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventData clone() => EventData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventData copyWith(void Function(EventData) updates) => super.copyWith((message) => updates(message as EventData)) as EventData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EventData create() => EventData._();
  EventData createEmptyInstance() => create();
  static $pb.PbList<EventData> createRepeated() => $pb.PbList<EventData>();
  @$core.pragma('dart2js:noInline')
  static EventData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventData>(create);
  static EventData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventType => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventType() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timestamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.Map<$core.String, $core.String> get properties => $_getMap(3);
}

class TrackEventRequest extends $pb.GeneratedMessage {
  factory TrackEventRequest({
    $core.Iterable<EventData>? events,
  }) {
    final $result = create();
    if (events != null) {
      $result.events.addAll(events);
    }
    return $result;
  }
  TrackEventRequest._() : super();
  factory TrackEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrackEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TrackEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'analytics'), createEmptyInstance: create)
    ..pc<EventData>(1, _omitFieldNames ? '' : 'events', $pb.PbFieldType.PM, subBuilder: EventData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrackEventRequest clone() => TrackEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrackEventRequest copyWith(void Function(TrackEventRequest) updates) => super.copyWith((message) => updates(message as TrackEventRequest)) as TrackEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrackEventRequest create() => TrackEventRequest._();
  TrackEventRequest createEmptyInstance() => create();
  static $pb.PbList<TrackEventRequest> createRepeated() => $pb.PbList<TrackEventRequest>();
  @$core.pragma('dart2js:noInline')
  static TrackEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrackEventRequest>(create);
  static TrackEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<EventData> get events => $_getList(0);
}

class TrackEventResponse extends $pb.GeneratedMessage {
  factory TrackEventResponse({
    $core.bool? success,
    $core.int? processedCount,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (processedCount != null) {
      $result.processedCount = processedCount;
    }
    return $result;
  }
  TrackEventResponse._() : super();
  factory TrackEventResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrackEventResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TrackEventResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'analytics'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'processedCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrackEventResponse clone() => TrackEventResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrackEventResponse copyWith(void Function(TrackEventResponse) updates) => super.copyWith((message) => updates(message as TrackEventResponse)) as TrackEventResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrackEventResponse create() => TrackEventResponse._();
  TrackEventResponse createEmptyInstance() => create();
  static $pb.PbList<TrackEventResponse> createRepeated() => $pb.PbList<TrackEventResponse>();
  @$core.pragma('dart2js:noInline')
  static TrackEventResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrackEventResponse>(create);
  static TrackEventResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get processedCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set processedCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProcessedCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearProcessedCount() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
