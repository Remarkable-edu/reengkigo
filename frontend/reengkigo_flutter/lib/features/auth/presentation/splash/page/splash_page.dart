import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../../../core/constant/app_constant.dart';
import '../../../../../core/providers/auth/auth_providers.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../providers/auth_provider.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    
    _audioPlayer = AudioPlayer();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    // 아래에서 위로 튀어나오는 애니메이션
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.3), // 아래에서 시작
      end: Offset.zero, // 중앙으로
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
    
    // 크기 변화 애니메이션 (튀어나오는 효과)
    _scaleAnimation = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _startSplashSequence();
  }

  Future<void> _startSplashSequence() async {
    // 음악 재생
    await _playSound();
    
    // 애니메이션 시작
    _animationController.forward();
    
    // 자동 로그인 시도
    _tryAutoLogin();
  }

  Future<void> _playSound() async {
    try {
      String soundPath = AppConstant.splashSoundPath;
      String assetPath = soundPath.replaceFirst('assets/', '');
      
      await _audioPlayer.play(AssetSource(assetPath));
      debugPrint('Sound playing: $assetPath');
    } catch (e) {
      debugPrint('Sound playback failed: $e');
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _tryAutoLogin() async {
    // 최소 2초간 스플래시 화면 표시
    await Future.delayed(const Duration(seconds: 3));
    
    try {
      final autoLoginUseCase = await ref.read(autoLoginUserProvider.future);
      final result = await autoLoginUseCase(const NoParams());
      
      if (mounted) {
        result.fold(
          (failure) {
            // 자동 로그인 실패 - 로그인 화면으로
            context.goToLogin();
          },
          (user) {
            // 자동 로그인 성공 - 상태 업데이트 후 홈으로
            ref.read(authNotifierProvider.notifier).setAuthenticated(user);
            context.goToHome();
          },
        );
      }
    } catch (e) {
      // 오류 발생 시 로그인 화면으로
      if (mounted) {
        context.goToLogin();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.primaryColor,
      body: Center(
        child: SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Image.asset(
              AppConstant.splashLogoPath,
              width: AppConstant.logoHeight * 2,
              height: AppConstant.logoHeight * 2,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}