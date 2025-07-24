import 'package:flutter/material.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../shared/widgets/custom_app_bar.dart';

class SpeakPage extends StatelessWidget {
  const SpeakPage({super.key});

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
              Icons.record_voice_over,
              size: 80,
              color: AppConstant.primaryColor,
            ),
            SizedBox(height: AppConstant.paddingMedium),
            Text(
              '낭독 페이지',
              style: AppConstant.titleTextStyle,
            ),
            SizedBox(height: AppConstant.paddingSmall),
            Text(
              '음성 낭독 기능이 들어갈 예정입니다.',
              style: AppConstant.bodyTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}