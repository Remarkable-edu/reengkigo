import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../ffi/reengkigo_ffi.dart';

part 'ffi_providers.g.dart';

/// FFI Client Provider
/// Rust FFI 클라이언트 인스턴스를 제공합니다.
@riverpod
ReengkigoApiClient ffiClient(Ref ref) {
  return ReengkigoApiClient();
}