import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class MorePage extends ConsumerWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppConstant.backgroundColor,
      appBar: _buildWhiteAppBar(),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: AppConstant.paddingLarge),
            
            // Mission 항목
            _buildMenuItem(
              context,
              icon: 'assets/icon/book_icon.svg',
              title: 'Mission',
              onTap: () {
                // Mission 기능 구현
              },
            ),
            _buildDivider(),
            
            // Media 항목
            _buildMenuItem(
              context,
              icon: 'assets/icon/speak_icon.svg',
              title: 'Media',
              onTap: () {
                // Media 기능 구현
              },
            ),
            _buildDivider(),
            
            // 내 계정 정보
            _buildMenuItem(
              context,
              icon: 'assets/icon/profile_icon.svg',
              title: '내 계정 정보',
              showArrow: true,
              onTap: () {
                // 계정 정보 페이지로 이동
              },
            ),
            _buildDivider(),
            
            // 이용약관 및 개인정보처리정책
            _buildMenuItem(
              context,
              icon: 'assets/icon/main_icon.svg',
              title: '이용약관 및 개인정보처리정책',
              showArrow: true,
              onTap: () {
                // 이용약관 페이지로 이동
              },
            ),
            _buildDivider(),
            
            // 로그아웃
            _buildMenuItem(
              context,
              icon: 'assets/icon/profile_icon.svg',
              title: '로그아웃',
              onTap: () {
                _showLogoutDialog(context, ref);
              },
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildWhiteAppBar() {
    return AppBar(
      title: Image.asset(
        'assets/logo/main_logo.png',
        height: 24,
        fit: BoxFit.contain,
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: AppConstant.textPrimaryColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.white,
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String icon,
    required String title,
    required VoidCallback onTap,
    bool showArrow = false,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstant.paddingLarge,
        vertical: AppConstant.paddingMedium,
      ),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppConstant.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              AppConstant.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: AppConstant.bodyTextStyle.copyWith(
          fontSize: AppConstant.fontSizeLarge,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: showArrow
          ? const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppConstant.textTertiaryColor,
            )
          : null,
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstant.paddingLarge),
      height: 1,
      child: CustomPaint(
        painter: DottedLinePainter(),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstant.cardBorderRadius),
          ),
          title: Text(
            '로그아웃',
            style: AppConstant.titleTextStyle.copyWith(
              fontFamily: AppConstant.cookieRunFontFamily,
            ),
          ),
          content: Text(
            '정말 로그아웃 하시겠습니까?',
            style: AppConstant.bodyTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                '취소',
                style: AppConstant.bodyTextStyle.copyWith(
                  color: AppConstant.textSecondaryColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(authNotifierProvider.notifier).logout();
              },
              child: Text(
                '로그아웃',
                style: AppConstant.bodyTextStyle.copyWith(
                  color: AppConstant.accentColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 4.0;
    const dashSpace = 4.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}