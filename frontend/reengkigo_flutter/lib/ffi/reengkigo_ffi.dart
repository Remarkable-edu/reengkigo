import 'dart:ffi' as ffi;
import 'dart:io' show Platform;
import 'dart:typed_data';
import 'dart:convert';
import 'package:ffi/ffi.dart';
import 'package:reengkigo_flutter/generated/ffi/bindings.dart';


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
  
  static Future<Uint8List?> login(Uint8List requestBytes) async {
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