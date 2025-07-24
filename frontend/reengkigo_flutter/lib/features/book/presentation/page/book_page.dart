import 'package:flutter/material.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../shared/widgets/custom_app_bar.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.backgroundColor,
      appBar: const CustomAppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.book,
              size: 80,
              color: AppConstant.primaryColor,
            ),
            SizedBox(height: AppConstant.paddingMedium),
            Text(
              '교재 페이지',
              style: AppConstant.titleTextStyle,
            ),
            SizedBox(height: AppConstant.paddingSmall),
            Text(
              '교재 관련 기능이 들어갈 예정입니다.',
              style: AppConstant.bodyTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}