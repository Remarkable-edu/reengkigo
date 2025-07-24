//
//  Generated code. Do not modify.
//  source: admin/settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use adminSettingsDescriptor instead')
const AdminSettings$json = {
  '1': 'AdminSettings',
  '2': [
    {'1': 'setting_id', '3': 1, '4': 1, '5': 5, '10': 'settingId'},
    {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `AdminSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminSettingsDescriptor = $convert.base64Decode(
    'Cg1BZG1pblNldHRpbmdzEh0KCnNldHRpbmdfaWQYASABKAVSCXNldHRpbmdJZBIQCgNrZXkYAi'
    'ABKAlSA2tleRIUCgV2YWx1ZRgDIAEoCVIFdmFsdWUSIAoLZGVzY3JpcHRpb24YBCABKAlSC2Rl'
    'c2NyaXB0aW9u');

@$core.Deprecated('Use getSettingsRequestDescriptor instead')
const GetSettingsRequest$json = {
  '1': 'GetSettingsRequest',
  '2': [
    {'1': 'keys', '3': 1, '4': 3, '5': 9, '10': 'keys'},
  ],
};

/// Descriptor for `GetSettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSettingsRequestDescriptor = $convert.base64Decode(
    'ChJHZXRTZXR0aW5nc1JlcXVlc3QSEgoEa2V5cxgBIAMoCVIEa2V5cw==');

@$core.Deprecated('Use getSettingsResponseDescriptor instead')
const GetSettingsResponse$json = {
  '1': 'GetSettingsResponse',
  '2': [
    {'1': 'settings', '3': 1, '4': 3, '5': 11, '6': '.admin.AdminSettings', '10': 'settings'},
  ],
};

/// Descriptor for `GetSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSettingsResponseDescriptor = $convert.base64Decode(
    'ChNHZXRTZXR0aW5nc1Jlc3BvbnNlEjAKCHNldHRpbmdzGAEgAygLMhQuYWRtaW4uQWRtaW5TZX'
    'R0aW5nc1IIc2V0dGluZ3M=');

@$core.Deprecated('Use updateSettingsRequestDescriptor instead')
const UpdateSettingsRequest$json = {
  '1': 'UpdateSettingsRequest',
  '2': [
    {'1': 'settings', '3': 1, '4': 3, '5': 11, '6': '.admin.AdminSettings', '10': 'settings'},
  ],
};

/// Descriptor for `UpdateSettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSettingsRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVTZXR0aW5nc1JlcXVlc3QSMAoIc2V0dGluZ3MYASADKAsyFC5hZG1pbi5BZG1pbl'
    'NldHRpbmdzUghzZXR0aW5ncw==');

@$core.Deprecated('Use updateSettingsResponseDescriptor instead')
const UpdateSettingsResponse$json = {
  '1': 'UpdateSettingsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UpdateSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSettingsResponseDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVTZXR0aW5nc1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbW'
    'Vzc2FnZRgCIAEoCVIHbWVzc2FnZQ==');

