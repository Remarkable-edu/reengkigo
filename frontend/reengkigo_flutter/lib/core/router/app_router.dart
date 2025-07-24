import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/login/page/login_page.dart';
import '../../features/auth/presentation/splash/page/splash_page.dart';
import '../../features/main/presentation/page/main_page.dart';
import 'route_names.dart';

/// 앱 라우터 설정
/// GoRouter를 사용한 선언적 라우팅
class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      // Splash Screen
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      
      // Login Screen
      GoRoute(
        path: RouteNames.login,
        name: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      
      // Main Screen (with bottom navigation)
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        builder: (context, state) => const MainPage(),
      ),
    ],
    
    // 에러 페이지
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              '페이지를 찾을 수 없습니다',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              state.error.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.login),
              child: const Text('로그인으로 돌아가기'),
            ),
          ],
        ),
      ),
    ),
  );

  static GoRouter get router => _router;
}

/// 라우터 확장 메소드
extension AppRouterExtension on BuildContext {
  /// 스플래시 화면으로 이동
  void goToSplash() => go(RouteNames.splash);
  
  /// 로그인 화면으로 이동
  void goToLogin() => go(RouteNames.login);
  
  /// 홈 화면으로 이동
  void goToHome() => go(RouteNames.home);
}