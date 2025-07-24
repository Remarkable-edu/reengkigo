import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/providers/auth/auth_providers.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_user.dart';
import '../state/auth_state.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    return const AuthInitial();
  }

  Future<void> login({
    required String account,
    required String password,
    bool rememberAccount = false,
    bool autoLogin = false,
  }) async {
    state = const AuthLoading();

    final stopwatch = Stopwatch()..start();
    final loginUseCase = await ref.read(loginUserProvider.future);

    final result = await loginUseCase(LoginParams(
      account: account,
      password: password,
      rememberAccount: rememberAccount,
      autoLogin: autoLogin,
    ));

    stopwatch.stop();

    result.fold(
      (failure) {
        String message;
        if (failure is FFIFailure) {
          message = failure.message;
        } else {
          message = '로그인 중 오류가 발생했습니다.';
        }
        state = AuthError(message);
      },
      (user) {
        state = AuthAuthenticated(
          user: user,
          loginTime: stopwatch.elapsedMilliseconds,
        );
      },
    );
  }

  Future<void> logout() async {
    state = const AuthLoading();
    
    final logoutUseCase = await ref.read(logoutUserProvider.future);
    final result = await logoutUseCase(const NoParams());
    
    result.fold(
      (failure) {
        // 로그아웃 실패해도 UI상으로는 로그아웃 처리
        state = const AuthUnauthenticated();
      },
      (_) {
        state = const AuthUnauthenticated();
      },
    );
  }

  /// 외부에서 인증 상태를 직접 설정 (자동 로그인용)
  void setAuthenticated(User user) {
    state = AuthAuthenticated(
      user: user,
      loginTime: 0, // 자동 로그인은 시간 측정 없음
    );
  }

  /// 저장된 계정 가져오기
  Future<String?> getSavedAccount() async {
    final authRepository = await ref.read(authRepositoryProvider.future);
    final result = await authRepository.getSavedAccount();
    
    return result.fold(
      (failure) => null,
      (account) => account,
    );
  }
}