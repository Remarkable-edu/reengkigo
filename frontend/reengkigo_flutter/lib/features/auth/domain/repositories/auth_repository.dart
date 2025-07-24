import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String account,
    required String password,
    bool rememberAccount = false,
    bool autoLogin = false,
  });
  
  Future<Either<Failure, User>> autoLogin();
  
  Future<Either<Failure, String?>> getSavedAccount();
  
  Future<Either<Failure, bool>> isAutoLoginEnabled();
  
  Future<Either<Failure, void>> logout();
}