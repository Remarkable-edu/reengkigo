import 'package:flutter/material.dart';

import '../../core/constant/app_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/logo/main_logo.png',
        height: 24,
        fit: BoxFit.contain,
      ),
      centerTitle: true,
      backgroundColor: AppConstant.backgroundColor,
      foregroundColor: AppConstant.textPrimaryColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}