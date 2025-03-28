import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/app_images.dart';
import 'package:food_delivery_app/core/enum/storage_keys.dart';
import 'package:food_delivery_app/di.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_action.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_circle_widget.dart';
import 'package:food_delivery_app/presentation/routes/route_name.dart';
import 'package:food_delivery_app/presentation/screen/on_boarding/widgets/on_board_page.dart';

import '../../../core/services/shared_preferences_service.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(); // Thêm PageController
  int _currentPage = 0; // Biến để theo dõi trang hiện tại

  final List<OnBoardPageWidget> pages = [
    OnBoardPageWidget(
      arguments: OnBoardingPageArguments(
        title: tr("All your favorites"),
        description: 'Get all your loved foods in one place, you just place the order we do the rest',
        image: AppImages.imgOnBoarding1,
      ),
    ),
    OnBoardPageWidget(
      arguments: OnBoardingPageArguments(
        title: tr("Order from chosen chef"),
        description: 'Get all your loved foods in one place, you just place the order we do the rest',
        image: AppImages.imgOnBoarding2,
      ),
    ),
    OnBoardPageWidget(
      arguments: OnBoardingPageArguments(
        title: tr("Free delivery offers"),
        description: 'Get all your loved foods in one place, you just place the order we do the rest',
        image: AppImages.imgOnBoarding3,
      ),
    ),
  ];

  void onGetStarted() {
    // Xử lý khi nhấn Get Started
    setIsFirstTime();
    Navigator.pushReplacementNamed(context, RouteName.signInScreen);
  }

  Future<void> setIsFirstTime() async {
    SharedPreferencesService prefs = getIt<SharedPreferencesService>();
     await prefs.setBoolValue(StorageKeys.isFirstTime, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => onGetStarted(),
            child: Text(
              tr("Skip"),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pages.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: AppCircleWidget(
                  backgroundColor: index == _currentPage ? AppColors.warningEA9617 : AppColors.warning200,
                ),
              ),
            ),
          ),

          if(_currentPage == pages.length - 1) ...[
            SizedBox(height: 32.h),
            SizedBox(
              width: 120.w,
              height: 48.h,
              child: AppActionWidget(
                content: tr("GET STARTED"),
                onPressed: () => onGetStarted(),
                backgroundColor: AppColors.orangeFFA500,
              ),
            ),
            SizedBox(height: 20.h)
          ] else ...[
            SizedBox(height: 100.h),
          ],

        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // Giải phóng bộ nhớ
    super.dispose();
  }
}
