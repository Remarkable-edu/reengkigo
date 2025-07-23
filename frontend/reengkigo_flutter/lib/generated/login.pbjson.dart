//
//  Generated code. Do not modify.
//  source: login.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSGAoHYWNjb3VudBgBIAEoCVIHYWNjb3VudBIaCghwYXNzd29yZBgCIA'
    'EoCVIIcGFzc3dvcmQ=');

@$core.Deprecated('Use authDescriptor instead')
const Auth$json = {
  '1': 'Auth',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 5, '10': 'accountId'},
    {'1': 'account_type_id', '3': 2, '4': 1, '5': 5, '10': 'accountTypeId'},
    {'1': 'agency_id', '3': 3, '4': 1, '5': 5, '10': 'agencyId'},
    {'1': 'academy_id', '3': 4, '4': 1, '5': 5, '10': 'academyId'},
    {'1': 'account', '3': 5, '4': 1, '5': 9, '10': 'account'},
    {'1': 'state', '3': 6, '4': 1, '5': 5, '10': 'state'},
  ],
};

/// Descriptor for `Auth`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authDescriptor = $convert.base64Decode(
    'CgRBdXRoEh0KCmFjY291bnRfaWQYASABKAVSCWFjY291bnRJZBImCg9hY2NvdW50X3R5cGVfaW'
    'QYAiABKAVSDWFjY291bnRUeXBlSWQSGwoJYWdlbmN5X2lkGAMgASgFUghhZ2VuY3lJZBIdCgph'
    'Y2FkZW15X2lkGAQgASgFUglhY2FkZW15SWQSGAoHYWNjb3VudBgFIAEoCVIHYWNjb3VudBIUCg'
    'VzdGF0ZRgGIAEoBVIFc3RhdGU=');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'auth', '3': 1, '4': 1, '5': 11, '6': '.login.Auth', '10': 'auth'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEh8KBGF1dGgYASABKAsyCy5sb2dpbi5BdXRoUgRhdXRo');

