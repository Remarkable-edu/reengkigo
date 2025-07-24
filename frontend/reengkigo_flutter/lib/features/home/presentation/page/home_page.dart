import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../shared/widgets/custom_app_bar.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../auth/presentation/state/auth_state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

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
      backgroundColor: AppConstant.backgroundColor,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppConstant.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeCard(authState),
            const SizedBox(height: AppConstant.paddingLarge),
            _buildProgressCard(),
            const SizedBox(height: AppConstant.paddingLarge),
            _buildStageCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeCard(AuthState authState) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstant.paddingLarge),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstant.cardBorderRadius),
        boxShadow: const [AppConstant.cardShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '환영합니다! 👋',
            style: AppConstant.titleTextStyle.copyWith(
              fontFamily: AppConstant.cookieRunFontFamily,
            ),
          ),
          const SizedBox(height: AppConstant.paddingSmall),
          if (authState is AuthAuthenticated) ...[
            Text(
              '계정: ${authState.user.account}',
              style: AppConstant.bodyTextStyle,
            ),
            const SizedBox(height: 4),
            Text(
              '로그인 시간: ${authState.loginTime}ms',
              style: AppConstant.bodyTextStyle.copyWith(
                color: AppConstant.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstant.paddingLarge),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstant.cardBorderRadius),
        boxShadow: const [AppConstant.cardShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '문장낭독',
                style: AppConstant.titleTextStyle,
              ),
              Text(
                '32/50',
                style: AppConstant.bodyTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstant.paddingMedium),
          _buildGradientProgressBar(32 / 50),
          const SizedBox(height: AppConstant.paddingSmall),
          Text(
            '18개의 문장을 더 읽으면 목표 달성!',
            style: AppConstant.bodyTextStyle.copyWith(
              color: AppConstant.textSecondaryColor,
              fontSize: AppConstant.fontSizeSmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStageCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstant.paddingLarge),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstant.cardBorderRadius),
        boxShadow: const [AppConstant.cardShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'STAGE 1-1 R1R',
            style: AppConstant.titleTextStyle.copyWith(
              fontFamily: AppConstant.cookieRunFontFamily,
              fontSize: AppConstant.fontSizeXLarge,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'STAGE 시리즈',
            style: AppConstant.bodyTextStyle.copyWith(
              color: AppConstant.textSecondaryColor,
            ),
          ),
          const SizedBox(height: AppConstant.paddingMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '진행률',
                style: AppConstant.bodyTextStyle,
              ),
              Text(
                '8/12',
                style: AppConstant.bodyTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstant.paddingSmall),
          _buildGradientProgressBar(8 / 12),
          const SizedBox(height: AppConstant.paddingMedium),
          Text(
            '18개의 문장을 더 읽으면 목표 달성!',
            style: AppConstant.bodyTextStyle.copyWith(
              color: AppConstant.textSecondaryColor,
              fontSize: AppConstant.fontSizeSmall,
            ),
          ),
          const SizedBox(height: AppConstant.paddingLarge),
          SizedBox(
            width: double.infinity,
            height: AppConstant.buttonHeight,
            child: ElevatedButton(
              onPressed: () {
                // 스테이지 시작 로직
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstant.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstant.borderRadius),
                ),
                elevation: 0,
              ),
              child: Text(
                'Start',
                style: AppConstant.buttonCookieRunTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientProgressBar(double progress) {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppConstant.accentColor,
                    Color(0xFFFB91A3),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}