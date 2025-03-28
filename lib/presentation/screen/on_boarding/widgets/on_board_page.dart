import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/app_padding.dart';
import 'package:food_delivery_app/core/constants/app_text_style.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_circle_widget.dart';

class OnBoardingPageArguments {
  final String title;
  final String description;
  final String image;

  OnBoardingPageArguments({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnBoardPageWidget extends StatefulWidget {
  const OnBoardPageWidget({super.key, required this.arguments});
  final OnBoardingPageArguments arguments;
  @override
  State<OnBoardPageWidget> createState() => _OnBoardPageWidgetState();
}

class _OnBoardPageWidgetState extends State<OnBoardPageWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.arguments.image,
              width: 300.w,
              height: 300.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 40.h),
            Text(
              widget.arguments.title,
              style: AppStyle.bold24black,
            ),
            SizedBox(height: 20.h),
            Text(
              widget.arguments.description,
              style: AppStyle.regular16grey500,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}



