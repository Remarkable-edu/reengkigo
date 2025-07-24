import 'dart:ffi' as ffi;
import 'dart:io' show Platform;
import 'dart:convert';
import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:reengkigo_flutter/generated/ffi/bindings.dart';
import '../generated/login.pb.dart';

/// Reengkigo FFI 저수준 인터페이스
/// C 라이브러리와 직접 통신하는 기본 FFI 기능
class ReengkigoFFI {
  static ReengkigoBindings? _bindings;
  
  static ReengkigoBindings get bindings {
    if (_bindings != null) return _bindings!;
    
    final library = _loadLibrary();
    _bindings = ReengkigoBindings(library);
    return _bindings!;
  }
  
  static ffi.DynamicLibrary _loadLibrary() {
    if (Platform.isIOS) {
      // iOS uses the executable itself (static library linked at build time)
      return ffi.DynamicLibrary.executable();
    } else if (Platform.isAndroid) {
      // Android uses the shared library
      return ffi.DynamicLibrary.open('libdart_ffi.so');
    } else {
      throw UnsupportedError('This platform is not supported.');
    }
  }
  
  /// 저수준 FFI 로그인 호출 - 프로토버프 바이트 입력/출력
  static Future<Uint8List?> callLoginRaw(Uint8List requestBytes) async {
    final binding = bindings;
    
    // Allocate memory for request bytes
    final requestPtr = malloc<ffi.Uint8>(requestBytes.length);
    final requestList = requestPtr.asTypedList(requestBytes.length);
    requestList.setAll(0, requestBytes);
    
    try {
      // Call the login function
      final resultPtr = binding.login(requestPtr, requestBytes.length);
      
      if (resultPtr == ffi.nullptr) {
        return null;
      }
      
      // Convert C string to Dart string
      final base64String = resultPtr.cast<Utf8>().toDartString();
      
      // Free the returned string
      binding.free_string(resultPtr);
      
      // Decode base64 to get protobuf bytes
      return base64Decode(base64String);
    } finally {
      // Free the request memory
      malloc.free(requestPtr);
    }
  }
}

class ReengkigoApiClient {
  Future<LoginResponse?> login(String account, String password) async {
    try {
      final loginRequest = LoginRequest()
        ..account = account
        ..password = password;

      final requestBytes = loginRequest.writeToBuffer();
      final responseBytes = await ReengkigoFFI.callLoginRaw(Uint8List.fromList(requestBytes));

      if (responseBytes == null) {
        return null;
      }
      return LoginResponse.fromBuffer(responseBytes);
    } catch (e) {
      // Logger를 사용하거나 디버그 모드에서만 출력
      if (kDebugMode) {
        debugPrint('ReengkigoApiClient.login error: $e');
      }
      return null;
    }
  }
}

