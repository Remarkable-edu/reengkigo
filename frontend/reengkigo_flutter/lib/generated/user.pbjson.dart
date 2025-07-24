//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userProfileDescriptor instead')
const UserProfile$json = {
  '1': 'UserProfile',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'full_name', '3': 4, '4': 1, '5': 9, '10': 'fullName'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 3, '10': 'createdAt'},
  ],
};

/// Descriptor for `UserProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userProfileDescriptor = $convert.base64Decode(
    'CgtVc2VyUHJvZmlsZRIXCgd1c2VyX2lkGAEgASgFUgZ1c2VySWQSGgoIdXNlcm5hbWUYAiABKA'
    'lSCHVzZXJuYW1lEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIbCglmdWxsX25hbWUYBCABKAlSCGZ1'
    'bGxOYW1lEh0KCmNyZWF0ZWRfYXQYBSABKANSCWNyZWF0ZWRBdA==');

@$core.Deprecated('Use getUserProfileRequestDescriptor instead')
const GetUserProfileRequest$json = {
  '1': 'GetUserProfileRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserProfileRequestDescriptor = $convert.base64Decode(
    'ChVHZXRVc2VyUHJvZmlsZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoBVIGdXNlcklk');

@$core.Deprecated('Use getUserProfileResponseDescriptor instead')
const GetUserProfileResponse$json = {
  '1': 'GetUserProfileResponse',
  '2': [
    {'1': 'profile', '3': 1, '4': 1, '5': 11, '6': '.user.UserProfile', '10': 'profile'},
  ],
};

/// Descriptor for `GetUserProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserProfileResponseDescriptor = $convert.base64Decode(
    'ChZHZXRVc2VyUHJvZmlsZVJlc3BvbnNlEisKB3Byb2ZpbGUYASABKAsyES51c2VyLlVzZXJQcm'
    '9maWxlUgdwcm9maWxl');

@$core.Deprecated('Use updateUserProfileRequestDescriptor instead')
const UpdateUserProfileRequest$json = {
  '1': 'UpdateUserProfileRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'full_name', '3': 4, '4': 1, '5': 9, '10': 'fullName'},
  ],
};

/// Descriptor for `UpdateUserProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserProfileRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVVc2VyUHJvZmlsZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoBVIGdXNlcklkEhoKCH'
    'VzZXJuYW1lGAIgASgJUgh1c2VybmFtZRIUCgVlbWFpbBgDIAEoCVIFZW1haWwSGwoJZnVsbF9u'
    'YW1lGAQgASgJUghmdWxsTmFtZQ==');

@$core.Deprecated('Use updateUserProfileResponseDescriptor instead')
const UpdateUserProfileResponse$json = {
  '1': 'UpdateUserProfileResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UpdateUserProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserProfileResponseDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVVc2VyUHJvZmlsZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGA'
    'oHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZQ==');

