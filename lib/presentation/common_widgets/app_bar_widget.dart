import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/app_icons.dart';
import 'package:food_delivery_app/core/constants/app_text_style.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isShowBackButton;
  final String? titleAppBar;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  const AppBarWidget(
      {super.key, this.titleAppBar, this.backgroundColor, this.isShowBackButton = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor ?? AppColors.white,
      leading: isShowBackButton
          ? GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                if (onTap != null) {
                  onTap!();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                margin: EdgeInsets.all(8.w),
                padding: EdgeInsets.all(8.w),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  AppIcons.icArrowLeft,
                ),
              ),
            )
          : null,
      title: AppTextWidget(
        text: titleAppBar ?? '',
        textStyle: AppStyle.bold18black,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
