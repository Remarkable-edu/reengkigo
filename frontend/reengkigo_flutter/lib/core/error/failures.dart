abstract class Failure {
  const Failure();
}

class ServerFailure extends Failure {
  final String message;
  const ServerFailure(this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure();
}

class CacheFailure extends Failure {
  const CacheFailure();
}

class ValidationFailure extends Failure {
  final String message;
  const ValidationFailure(this.message);
}

class FFIFailure extends Failure {
  final String message;
  const FFIFailure(this.message);
}