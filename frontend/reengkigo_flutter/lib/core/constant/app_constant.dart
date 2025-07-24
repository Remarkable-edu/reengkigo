import 'package:flutter/material.dart';

/// 앱 전역에서 사용되는 상수들
class AppConstant {
  AppConstant._();
  
  // Colors
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color primaryColor = Color(0xFF4DB6AC); // 청록색
  static const Color accentColor = Color(0xFFE91E63); // 핑크색
  static const Color textPrimaryColor = Color(0xFF333333);
  static const Color textSecondaryColor = Color(0xFF666666);
  static const Color textTertiaryColor = Color(0xFF999999);
  static const Color hintTextColor = Color(0xFFCCCCCC);
  static const Color shadowColor = Color(0x1A000000);
  
  // Sizes
  static const double borderRadius = 8.0;
  static const double cardBorderRadius = 16.0;
  static const double borderWidth = 1.5;
  static const double focusedBorderWidth = 2.0;
  
  // Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
  static const double paddingXXLarge = 48.0;
  static const double paddingXXXLarge = 60.0;
  
  // Font Sizes
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14.0;
  static const double fontSizeLarge = 16.0;
  static const double fontSizeXLarge = 18.0;
  static const double fontSizeXXLarge = 24.0;
  static const double fontSizeXXXLarge = 32.0;
  
  // Component Sizes
  static const double buttonHeight = 52.0;
  static const double textFieldHeight = 48.0;
  static const double logoHeight = 120.0;
  static const double iconSize = 24.0;
  static const double loadingIndicatorSize = 24.0;
  
  // Shadow
  static const BoxShadow cardShadow = BoxShadow(
    color: shadowColor,
    blurRadius: 10,
    offset: Offset(0, 2),
  );
  
  // Assets
  static const String loginLogoPath = 'assets/logo/login_logo.png';
  static const String splashLogoPath = 'assets/logo/splash_logo.png';
  static const String splashSoundPath = 'assets/sounds/splash_sound.wav';
  
  // Bottom Navigation Icons
  static const String homeIconPath = 'assets/icon/main_icon.svg';
  static const String bookIconPath = 'assets/icon/book_icon.svg';
  static const String speakIconPath = 'assets/icon/speak_icon.svg';
  static const String rankIconPath = 'assets/icon/rank_icon.svg';
  static const String profileIconPath = 'assets/icon/profile_icon.svg';
  
  // Font Families
  static const String cookieRunFontFamily = 'CookieRun';
  static const String nanumSquareRoundFontFamily = 'NanumSquareRound';
  
  // Text Styles
  TextStyle headingTextStyle = TextStyle(
    fontFamily: cookieRunFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: fontSizeXXXLarge,
    color: textPrimaryColor,
  );
  
  static const TextStyle titleTextStyle = TextStyle(
    fontFamily: nanumSquareRoundFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: fontSizeXLarge,
    color: textPrimaryColor,
  );
  
  static const TextStyle bodyTextStyle = TextStyle(
    fontFamily: nanumSquareRoundFontFamily,
    fontWeight: FontWeight.normal,
    fontSize: fontSizeMedium,
    color: textPrimaryColor,
  );
  
  static const TextStyle labelTextStyle = TextStyle(
    fontFamily: nanumSquareRoundFontFamily,
    fontWeight: FontWeight.w500,
    fontSize: fontSizeMedium,
    color: textPrimaryColor,
  );
  
  static const TextStyle buttonTextStyle = TextStyle(
    fontFamily: nanumSquareRoundFontFamily,
    fontWeight: FontWeight.w600,
    fontSize: fontSizeLarge,
    color: Colors.white,
  );

  static const TextStyle buttonCookieRunTextStyle = TextStyle(
    fontFamily: cookieRunFontFamily,
    fontWeight: FontWeight.w600,
    fontSize: fontSizeLarge,
    color: Colors.white,
  );
  
  static const TextStyle hintTextStyle = TextStyle(
    fontFamily: nanumSquareRoundFontFamily,
    fontSize: fontSizeMedium,
    color: hintTextColor,
  );
  
  static const TextStyle linkTextStyle = TextStyle(
    fontFamily: nanumSquareRoundFontFamily,
    fontSize: fontSizeMedium,
    color: textTertiaryColor,
  );
  
  // Default Values
  static const String defaultAccount = 'rk0000';
  static const String defaultPassword = '16680503';
}