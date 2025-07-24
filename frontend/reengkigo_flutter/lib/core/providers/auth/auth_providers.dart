import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/auth/data/datasources/auth_local_datasource.dart';
import '../../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../../features/auth/domain/repositories/auth_repository.dart';
import '../../../features/auth/domain/usecases/auto_login_user.dart';
import '../../../features/auth/domain/usecases/login_user.dart';
import '../../../features/auth/domain/usecases/logout_user.dart';
import '../ffi/ffi_providers.dart';
import '../storage/storage_providers.dart';

part 'auth_providers.g.dart';

/// Auth Remote Data Source Provider
/// 원격 인증 데이터 소스를 제공합니다.
@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final ffiClient = ref.watch(ffiClientProvider);
  
  return AuthRemoteDataSourceImpl(
    ffiLoginClient: (account, password) async {
      return await ffiClient.login(account, password);
    },
  );
}

/// Auth Local Data Source Provider
/// 로컬 인증 데이터 소스를 제공합니다.
@riverpod
Future<AuthLocalDataSource> authLocalDataSource(Ref ref) async {
  final storageService = await ref.watch(storageServiceProvider.future);
  return AuthLocalDataSourceImpl(storageService: storageService);
}

/// Auth Repository Provider
/// 인증 리포지토리를 제공합니다.
@riverpod
Future<AuthRepository> authRepository(Ref ref) async {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = await ref.watch(authLocalDataSourceProvider.future);
  
  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}

/// Login Use Case Provider
/// 로그인 유스케이스를 제공합니다.
@riverpod
Future<LoginUser> loginUser(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return LoginUser(repository);
}

/// Auto Login Use Case Provider
/// 자동 로그인 유스케이스를 제공합니다.
@riverpod
Future<AutoLoginUser> autoLoginUser(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return AutoLoginUser(repository);
}

/// Logout Use Case Provider
/// 로그아웃 유스케이스를 제공합니다.
@riverpod
Future<LogoutUser> logoutUser(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return LogoutUser(repository);
}