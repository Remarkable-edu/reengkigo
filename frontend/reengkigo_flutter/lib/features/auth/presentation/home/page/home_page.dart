import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth_provider.dart';
import '../../state/auth_state.dart';

class HomePage extends ConsumerWidget {
  final String? loginTime;

  const HomePage({
    super.key,
    this.loginTime,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 로그아웃 상태 감지
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next is AuthUnauthenticated) {
        context.go('/login');
      }
    });

    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reengkigo 홈'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.home,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 24),
            const Text(
              '🎉 로그인 성공!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            _buildUserInfo(authState, loginTime),
            const SizedBox(height: 32),
            const Text(
              'Clean Architecture + Riverpod + FFI',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(AuthState authState, String? loginTime) {
    if (authState is AuthAuthenticated) {
      return Column(
        children: [
          Text(
            '계정 ID: ${authState.user.accountId}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            '계정명: ${authState.user.account}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            '로그인 시간: ${authState.loginTime}ms',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      );
    }
    
    // loginTime이 URL 파라미터로 전달된 경우
    if (loginTime != null) {
      return Text(
        '로그인 시간: ${loginTime}ms',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      );
    }
    
    return const SizedBox.shrink();
  }
}