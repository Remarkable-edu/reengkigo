// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRemoteDataSourceHash() =>
    r'a8eb55674781cff451b1c6f84b394e47410f9a14';

/// Auth Remote Data Source Provider
/// 원격 인증 데이터 소스를 제공합니다.
///
/// Copied from [authRemoteDataSource].
@ProviderFor(authRemoteDataSource)
final authRemoteDataSourceProvider =
    AutoDisposeProvider<AuthRemoteDataSource>.internal(
      authRemoteDataSource,
      name: r'authRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRemoteDataSourceRef = AutoDisposeProviderRef<AuthRemoteDataSource>;
String _$authLocalDataSourceHash() =>
    r'be8fcf5477326b48e739fa51bd4101e85d22bafd';

/// Auth Local Data Source Provider
/// 로컬 인증 데이터 소스를 제공합니다.
///
/// Copied from [authLocalDataSource].
@ProviderFor(authLocalDataSource)
final authLocalDataSourceProvider =
    AutoDisposeFutureProvider<AuthLocalDataSource>.internal(
      authLocalDataSource,
      name: r'authLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthLocalDataSourceRef =
    AutoDisposeFutureProviderRef<AuthLocalDataSource>;
String _$authRepositoryHash() => r'6929ce96f3f28602b5276ad1abd9cad5dea6eb03';

/// Auth Repository Provider
/// 인증 리포지토리를 제공합니다.
///
/// Copied from [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider =
    AutoDisposeFutureProvider<AuthRepository>.internal(
      authRepository,
      name: r'authRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = AutoDisposeFutureProviderRef<AuthRepository>;
String _$loginUserHash() => r'6034a2007672a851df998857325217ad842adaae';

/// Login Use Case Provider
/// 로그인 유스케이스를 제공합니다.
///
/// Copied from [loginUser].
@ProviderFor(loginUser)
final loginUserProvider = AutoDisposeFutureProvider<LoginUser>.internal(
  loginUser,
  name: r'loginUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LoginUserRef = AutoDisposeFutureProviderRef<LoginUser>;
String _$autoLoginUserHash() => r'9f61eff0eaa42dbbb34ac21474fce15efe67501b';

/// Auto Login Use Case Provider
/// 자동 로그인 유스케이스를 제공합니다.
///
/// Copied from [autoLoginUser].
@ProviderFor(autoLoginUser)
final autoLoginUserProvider = AutoDisposeFutureProvider<AutoLoginUser>.internal(
  autoLoginUser,
  name: r'autoLoginUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$autoLoginUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AutoLoginUserRef = AutoDisposeFutureProviderRef<AutoLoginUser>;
String _$logoutUserHash() => r'0a7b2a6654ecc250225794fa0ff7f55ba598bf1b';

/// Logout Use Case Provider
/// 로그아웃 유스케이스를 제공합니다.
///
/// Copied from [logoutUser].
@ProviderFor(logoutUser)
final logoutUserProvider = AutoDisposeFutureProvider<LogoutUser>.internal(
  logoutUser,
  name: r'logoutUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$logoutUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LogoutUserRef = AutoDisposeFutureProviderRef<LogoutUser>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
