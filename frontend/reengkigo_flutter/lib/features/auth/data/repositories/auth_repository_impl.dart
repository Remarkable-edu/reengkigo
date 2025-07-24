import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, User>> login({
    required String account,
    required String password,
    bool rememberAccount = false,
    bool autoLogin = false,
  }) async {
    try {
      final user = await remoteDataSource.login(
        account: account,
        password: password,
      );

      // 로컬에 사용자 정보 저장
      await localDataSource.saveUser(user);
      
      // 자동 로그인 정보 저장
      await localDataSource.saveAutoLoginInfo(
        account: account,
        password: password,
        autoLogin: autoLogin,
      );

      return Right(user);
    } on FFIFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(FFIFailure('예상치 못한 오류가 발생했습니다: $e'));
    }
  }

  @override
  Future<Either<Failure, User>> autoLogin() async {
    try {
      final canAutoLogin = await localDataSource.canAutoLogin();
      if (!canAutoLogin) {
        return Left(CacheFailure());
      }

      final account = await localDataSource.getSavedAccount();
      final password = await localDataSource.getSavedPassword();
      
      if (account == null || password == null) {
        return Left(CacheFailure());
      }

      // 저장된 계정/비밀번호로 실제 로그인 수행
      return await login(
        account: account,
        password: password,
        autoLogin: true,
      );
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getSavedAccount() async {
    try {
      final account = await localDataSource.getSavedAccount();
      return Right(account);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isAutoLoginEnabled() async {
    try {
      final enabled = await localDataSource.isAutoLoginEnabled();
      return Right(enabled);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearAuthData();
      return Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}