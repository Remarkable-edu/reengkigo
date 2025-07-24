import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/constant/app_constant.dart';
import '../../../../../core/router/app_router.dart';
import '../../providers/auth_provider.dart';
import '../../state/auth_state.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _accountController = TextEditingController(text: AppConstant.defaultAccount);
  final _passwordController = TextEditingController(text: AppConstant.defaultPassword);
  bool _obscurePassword = true;
  bool _autoLogin = false;

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ref.read(authNotifierProvider.notifier).login(
          account: _accountController.text,
          password: _passwordController.text,
          autoLogin: _autoLogin,
        );
  }

  @override
  Widget build(BuildContext context) {
    // Auth 상태 변화 감지
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next is AuthAuthenticated) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('로그인 성공! (${next.loginTime}ms)'),
            backgroundColor: Colors.green,
          ),
        );
        context.goToHome();
      } else if (next is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('로그인 실패: ${next.message}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      backgroundColor: AppConstant.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstant.paddingLarge),
          child: Column(
            children: [
              // 상단 여백
              const SizedBox(height: AppConstant.paddingXXXLarge),
              
              // 로고
              Image.asset(
                AppConstant.loginLogoPath,
                height: AppConstant.logoHeight,
              ),
              
              const SizedBox(height: AppConstant.paddingXXXLarge),
              
              // 로그인 카드
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppConstant.paddingLarge),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppConstant.cardBorderRadius),
                  boxShadow: const [AppConstant.cardShadow],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ID 라벨
                      const Text(
                        'ID',
                        style: AppConstant.labelTextStyle,
                      ),
                      const SizedBox(height: AppConstant.paddingSmall),
                      
                      // ID 입력 필드
                      TextFormField(
                        controller: _accountController,
                        decoration: _buildInputDecoration('ID'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ID를 입력해주세요';
                          }
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: AppConstant.paddingMedium + AppConstant.paddingSmall/2),
                      
                      // Password 라벨
                      const Text(
                        'Password',
                        style: AppConstant.labelTextStyle,
                      ),
                      const SizedBox(height: AppConstant.paddingSmall),
                      
                      // Password 입력 필드
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: _buildInputDecoration(
                          'Password',
                          suffixIcon: _buildPasswordVisibilityIcon(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '비밀번호를 입력해주세요';
                          }
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: AppConstant.paddingMedium + AppConstant.paddingSmall/2),
                      
                      // 자동 로그인 체크박스
                      _buildAutoLoginCheckbox(),
                      
                      const SizedBox(height: AppConstant.paddingMedium + AppConstant.paddingSmall/2),
                      
              
                      // 로그인 버튼
                      _buildLoginButton(authState),
                    ],
                  ),
                ),
              ),
              
              const Spacer(),
              
              // 개인정보처리방침 링크
              _buildPrivacyPolicyButton(),
              
              const SizedBox(height: AppConstant.paddingMedium + AppConstant.paddingSmall/2),
            ],
          ),
        ),
      ),
    );
  }

  /// 입력 필드 decoration 빌더
  InputDecoration _buildInputDecoration(String hintText, {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppConstant.hintTextStyle,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstant.borderRadius),
        borderSide: const BorderSide(
          color: AppConstant.accentColor,
          width: AppConstant.borderWidth,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstant.borderRadius),
        borderSide: const BorderSide(
          color: AppConstant.accentColor,
          width: AppConstant.borderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstant.borderRadius),
        borderSide: const BorderSide(
          color: AppConstant.accentColor,
          width: AppConstant.focusedBorderWidth,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstant.paddingMedium,
        vertical: AppConstant.paddingSmall + AppConstant.paddingSmall/2,
      ),
      suffixIcon: suffixIcon,
    );
  }

  /// 비밀번호 가시성 토글 아이콘
  Widget _buildPasswordVisibilityIcon() {
    return IconButton(
      icon: Icon(
        _obscurePassword ? Icons.visibility_off : Icons.visibility,
        color: AppConstant.hintTextColor,
        size: AppConstant.iconSize,
      ),
      onPressed: () {
        setState(() {
          _obscurePassword = !_obscurePassword;
        });
      },
    );
  }

  /// 자동 로그인 체크박스
  Widget _buildAutoLoginCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _autoLogin,
          onChanged: (value) {
            setState(() {
              _autoLogin = value ?? false;
            });
          },
          activeColor: AppConstant.primaryColor,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(
          '자동 로그인',
          style: AppConstant.bodyTextStyle.copyWith(
            color: AppConstant.textSecondaryColor,
          ),
        ),
      ],
    );
  }

  /// 로그인 버튼
  Widget _buildLoginButton(AuthState authState) {
    return SizedBox(
      width: double.infinity,
      height: AppConstant.buttonHeight,
      child: ElevatedButton(
        onPressed: authState is AuthLoading ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstant.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstant.borderRadius),
          ),
          elevation: 0,
        ),
        child: authState is AuthLoading
            ? const SizedBox(
                width: AppConstant.loadingIndicatorSize,
                height: AppConstant.loadingIndicatorSize,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2,
                ),
              )
            : Text(
                'Login',
                style: AppConstant.buttonCookieRunTextStyle,
              ),
      ),
    );
  }

  /// 개인정보처리방침 버튼
  Widget _buildPrivacyPolicyButton() {
    return TextButton(
      onPressed: () {
        // 개인정보처리방침 페이지로 이동
      },
      child: const Text(
        '개인정보처리방침',
        style: AppConstant.linkTextStyle,
      ),
    );
  }
}