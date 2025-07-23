class PerformanceResult {
  final String method;
  final Duration duration;
  final String result;
  final bool success;
  final String? error;

  PerformanceResult({
    required this.method,
    required this.duration,
    required this.result,
    required this.success,
    this.error,
  });

  @override
  String toString() {
    if (success) {
      return '$method: ${duration.inMilliseconds}ms';
    } else {
      return '$method: Error - $error (${duration.inMilliseconds}ms)';
    }
  }
}

class PerformanceComparison {
  final PerformanceResult ffiResult;
  final PerformanceResult dioResult;
  final Duration difference;
  final String fasterMethod;

  PerformanceComparison({
    required this.ffiResult,
    required this.dioResult,
    required this.difference,
    required this.fasterMethod,
  });

  @override
  String toString() {
    return '''
FFI: ${ffiResult.duration.inMilliseconds}ms
DIO: ${dioResult.duration.inMilliseconds}ms
Difference: ${difference.inMilliseconds}ms
Faster: $fasterMethod
''';
  }
}

class PerformanceService {
  static Future<PerformanceResult> measurePerformance<T>(
    String method,
    Future<T> Function() operation,
  ) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await operation();
      stopwatch.stop();
      
      return PerformanceResult(
        method: method,
        duration: stopwatch.elapsed,
        result: result.toString(),
        success: true,
      );
    } catch (e) {
      stopwatch.stop();
      
      return PerformanceResult(
        method: method,
        duration: stopwatch.elapsed,
        result: '',
        success: false,
        error: e.toString(),
      );
    }
  }

  static PerformanceComparison compareResults(
    PerformanceResult ffiResult,
    PerformanceResult dioResult,
  ) {
    final difference = (ffiResult.duration - dioResult.duration).abs();
    final fasterMethod = ffiResult.duration < dioResult.duration ? 'FFI' : 'DIO';
    
    return PerformanceComparison(
      ffiResult: ffiResult,
      dioResult: dioResult,
      difference: difference,
      fasterMethod: fasterMethod,
    );
  }
}

