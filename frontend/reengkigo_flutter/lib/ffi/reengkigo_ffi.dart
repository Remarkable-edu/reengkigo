import 'dart:ffi' as ffi;
import 'dart:io' show Platform;
import 'package:ffi/ffi.dart';
import './generated/bindings.dart';

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
  
  /// Add two numbers using Rust implementation
  static double add(double a, double b) {
    return bindings.simple_add(a, b);
  }
  
  /// Multiply two numbers using Rust implementation
  static double multiply(double a, double b) {
    return bindings.simple_multiply(a, b);
  }
  
  /// Greet someone using Rust implementation
  static String greet(String name) {
    final namePointer = name.toNativeUtf8().cast<ffi.Char>();
    final resultPointer = bindings.simple_greet(namePointer);
    final result = resultPointer.cast<Utf8>().toDartString();
    
    // Free the memory allocated by Rust
    bindings.free_string(resultPointer);
    
    // Free the input string memory
    malloc.free(namePointer);
    
    return result;
  }
}