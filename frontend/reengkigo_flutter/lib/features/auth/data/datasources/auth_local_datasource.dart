import '../../../../core/error/failures.dart';
import '../../../../shared/services/storage_service.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getLastUser();
  Future<void> saveAutoLoginInfo({
    required String account,
    required String password,
    required bool autoLogin,
  });
  Future<String?> getSavedAccount();
  Future<String?> getSavedPassword();
  Future<bool> isAutoLoginEnabled();
  Future<bool> canAutoLogin();
  Future<void> clearAuthData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final StorageService storageService;

  AuthLocalDataSourceImpl({required this.storageService});

  @override
  Future<void> saveUser(UserModel user) async {
    try {
      // 별도 작업 없음 - 자동 로그인은 계정/비밀번호로만 처리
    } catch (e) {
      throw CacheFailure();
    }
  }

  @override
  Future<UserModel?> getLastUser() async {
    try {
      final account = storageService.savedAccount;
      if (account == null) return null;

      // 저장된 계정으로 기본 사용자 모델 생성
      return UserModel(
        accountId: 0, // 기본값
        accountTypeId: 0,
        agencyId: 0,
        academyId: 0,
        account: account,
        state: 1,
      );
    } catch (e) {
      throw CacheFailure();
    }
  }

  @override
  Future<void> saveAutoLoginInfo({
    required String account,
    required String password,
    required bool autoLogin,
  }) async {
    try {
      await storageService.saveAutoLoginInfo(
        account: account,
        password: password,
        autoLogin: autoLogin,
      );
    } catch (e) {
      throw CacheFailure();
    }
  }

  @override
  Future<String?> getSavedAccount() async {
    try {
      return storageService.savedAccount;
    } catch (e) {
      throw CacheFailure();
    }
  }

  @override
  Future<String?> getSavedPassword() async {
    try {
      return storageService.savedPassword;
    } catch (e) {
      throw CacheFailure();
    }
  }

  @override
  Future<bool> isAutoLoginEnabled() async {
    try {
      return storageService.isAutoLoginEnabled;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> canAutoLogin() async {
    try {
      return storageService.canAutoLogin();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> clearAuthData() async {
    try {
      await storageService.clearAuthData();
    } catch (e) {
      throw CacheFailure();
    }
  }
}