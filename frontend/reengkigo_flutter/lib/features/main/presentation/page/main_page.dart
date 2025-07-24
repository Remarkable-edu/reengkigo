import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../book/presentation/page/book_page.dart';
import '../../../home/presentation/page/home_page.dart';
import '../../../more/presentation/page/more_page.dart';
import '../../../rank/presentation/page/rank_page.dart';
import '../../../speak/presentation/page/speak_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late List<AnimationController> _iconAnimationControllers;

  final List<Widget> _pages = [
    const HomePage(),
    const BookPage(),
    const SpeakPage(),
    const RankPage(),
    const MorePage(),
  ];

  final List<String> _tabLabels = [
    '홈',
    '교재',
    '낭독',
    '랭킹',
    '더보기',
  ];

  final List<String> _iconPaths = [
    AppConstant.homeIconPath,
    AppConstant.bookIconPath,
    AppConstant.speakIconPath,
    AppConstant.rankIconPath,
    AppConstant.profileIconPath,
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    _iconAnimationControllers = List.generate(
      5,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this,
      ),
    );
    
    // 초기 선택된 아이콘 애니메이션 시작
    _iconAnimationControllers[0].forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    for (var controller in _iconAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        // padding: const EdgeInsets.only(top: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            enableFeedback: false,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          onTap: (index) {
            // 이전 선택된 아이콘 애니메이션 리셋
            _iconAnimationControllers[_selectedIndex].reverse();
            
            setState(() {
              _selectedIndex = index;
            });
            
            // 새로 선택된 아이콘 애니메이션 시작
            _iconAnimationControllers[index].forward();
          },
          selectedItemColor: AppConstant.accentColor,
          unselectedItemColor: AppConstant.textTertiaryColor,
          selectedLabelStyle: AppConstant.bodyTextStyle.copyWith(
            fontSize: AppConstant.fontSizeSmall,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: AppConstant.bodyTextStyle.copyWith(
            fontSize: AppConstant.fontSizeSmall,
            color: AppConstant.textTertiaryColor,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          items: List.generate(5, (index) {
            return BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: AnimatedBuilder(
                  animation: _iconAnimationControllers[index],
                  builder: (context, child) {
                    final isSelected = _selectedIndex == index;
                    final scale = isSelected 
                        ? 1.0 + (_iconAnimationControllers[index].value * 0.2)
                        : 1.0;
                    
                    return Transform.scale(
                      scale: scale,
                      child: SvgPicture.asset(
                        _iconPaths[index],
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          isSelected
                              ? AppConstant.accentColor
                              : AppConstant.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    );
                  },
                ),
              ),
              label: _tabLabels[index],
            );
          }),
          ),
        ),
      ),
    );
  }
}