import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/app_text_style.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_text.dart';


class AppActionWidget extends StatelessWidget {
  const AppActionWidget(
      {super.key,
      this.content,
      this.onPressed,
      this.backgroundColor,
      this.contentTextStyle});

  final String? content;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final TextStyle? contentTextStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 1.sw,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: backgroundColor ?? AppColors.orangeFF7622,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: AppTextWidget(
          text: content ?? '',
          textStyle: contentTextStyle ?? AppStyle.bold12white,
        ),
      ),
    );
  }
}
