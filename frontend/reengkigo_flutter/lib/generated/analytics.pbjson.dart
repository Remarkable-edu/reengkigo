//
//  Generated code. Do not modify.
//  source: analytics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use eventDataDescriptor instead')
const EventData$json = {
  '1': 'EventData',
  '2': [
    {'1': 'event_type', '3': 1, '4': 1, '5': 9, '10': 'eventType'},
    {'1': 'timestamp', '3': 2, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'properties', '3': 4, '4': 3, '5': 11, '6': '.analytics.EventData.PropertiesEntry', '10': 'properties'},
  ],
  '3': [EventData_PropertiesEntry$json],
};

@$core.Deprecated('Use eventDataDescriptor instead')
const EventData_PropertiesEntry$json = {
  '1': 'PropertiesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `EventData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDataDescriptor = $convert.base64Decode(
    'CglFdmVudERhdGESHQoKZXZlbnRfdHlwZRgBIAEoCVIJZXZlbnRUeXBlEhwKCXRpbWVzdGFtcB'
    'gCIAEoA1IJdGltZXN0YW1wEhcKB3VzZXJfaWQYAyABKAlSBnVzZXJJZBJECgpwcm9wZXJ0aWVz'
    'GAQgAygLMiQuYW5hbHl0aWNzLkV2ZW50RGF0YS5Qcm9wZXJ0aWVzRW50cnlSCnByb3BlcnRpZX'
    'MaPQoPUHJvcGVydGllc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2'
    'YWx1ZToCOAE=');

@$core.Deprecated('Use trackEventRequestDescriptor instead')
const TrackEventRequest$json = {
  '1': 'TrackEventRequest',
  '2': [
    {'1': 'events', '3': 1, '4': 3, '5': 11, '6': '.analytics.EventData', '10': 'events'},
  ],
};

/// Descriptor for `TrackEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackEventRequestDescriptor = $convert.base64Decode(
    'ChFUcmFja0V2ZW50UmVxdWVzdBIsCgZldmVudHMYASADKAsyFC5hbmFseXRpY3MuRXZlbnREYX'
    'RhUgZldmVudHM=');

@$core.Deprecated('Use trackEventResponseDescriptor instead')
const TrackEventResponse$json = {
  '1': 'TrackEventResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'processed_count', '3': 2, '4': 1, '5': 5, '10': 'processedCount'},
  ],
};

/// Descriptor for `TrackEventResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackEventResponseDescriptor = $convert.base64Decode(
    'ChJUcmFja0V2ZW50UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxInCg9wcm9jZX'
    'NzZWRfY291bnQYAiABKAVSDnByb2Nlc3NlZENvdW50');

