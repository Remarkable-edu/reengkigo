import 'package:shared_preferences/shared_preferences.dart';

/// 로컬 저장소 서비스
/// SharedPreferences를 래핑하여 타입 안전성과 일관성을 제공합니다.
class StorageService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  // Auth 관련 키
  static const String _autoLoginKey = 'auto_login';
  static const String _savedAccountKey = 'saved_account';
  static const String _savedPasswordKey = 'saved_password';

  /// 자동 로그인 활성화 여부
  bool get isAutoLoginEnabled => _prefs.getBool(_autoLoginKey) ?? false;
  
  Future<bool> setAutoLoginEnabled(bool enabled) async {
    return await _prefs.setBool(_autoLoginKey, enabled);
  }

  /// 저장된 계정
  String? get savedAccount => _prefs.getString(_savedAccountKey);
  
  Future<bool> setSavedAccount(String? account) async {
    if (account == null) {
      return await _prefs.remove(_savedAccountKey);
    }
    return await _prefs.setString(_savedAccountKey, account);
  }

  /// 저장된 비밀번호
  String? get savedPassword => _prefs.getString(_savedPasswordKey);
  
  Future<bool> setSavedPassword(String? password) async {
    if (password == null) {
      return await _prefs.remove(_savedPasswordKey);
    }
    return await _prefs.setString(_savedPasswordKey, password);
  }

  /// 자동 로그인 정보 저장
  Future<bool> saveAutoLoginInfo({
    required String account,
    required String password,
    required bool autoLogin,
  }) async {
    if (autoLogin) {
      final results = await Future.wait([
        setAutoLoginEnabled(true),
        setSavedAccount(account),
        setSavedPassword(password),
      ]);
      return results.every((result) => result);
    } else {
      return await setAutoLoginEnabled(false);
    }
  }

  /// 자동 로그인이 가능한지 확인
  bool canAutoLogin() {
    return isAutoLoginEnabled && 
           savedAccount != null && 
           savedPassword != null;
  }

  /// 모든 인증 데이터 삭제
  Future<bool> clearAuthData() async {
    final results = await Future.wait([
      _prefs.remove(_autoLoginKey),
      _prefs.remove(_savedAccountKey),
      _prefs.remove(_savedPasswordKey),
    ]);
    
    return results.every((result) => result);
  }
}