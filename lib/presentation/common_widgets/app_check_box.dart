import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/app_text_style.dart';

class AppCheckBoxWidget extends StatelessWidget {
  final bool value;
  final String? label;
  final Function(bool value) onClick;

  const AppCheckBoxWidget({super.key, required this.value, required this.onClick, this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick(!value);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center, // Canh giữa theo chiều dọc
        children: [
          GestureDetector(
            onTap: () {
              onClick(!value);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: min(20.w, 28),
              height: min(20.w, 28),
              decoration: BoxDecoration(
                color: value ? AppColors.orangeFF7622 : Colors.transparent,
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: value ? AppColors.orangeFF7622 : AppColors.grey500, width: 1),
              ),
              child: value ? Center(child: Icon(Icons.check, color: AppColors.white, size: min(16.w, 24))) : null,
            ),
          ),
          if (label?.isNotEmpty == true) ...[
            const SizedBox(width: 8),
            Text(
              label ?? '',
              style: AppStyle.regular12black.copyWith(
                color: AppColors.grey500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
