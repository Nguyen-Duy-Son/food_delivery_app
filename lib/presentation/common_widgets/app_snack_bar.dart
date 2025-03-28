import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/app_icons.dart';
import 'package:food_delivery_app/core/constants/app_spacing.dart';
import 'package:food_delivery_app/core/constants/app_text_style.dart';
import 'package:food_delivery_app/core/services/navigation_services.dart';

class AppSnackBar {
  static void showSuccess(
    String message, {
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    bool isPressed = false;

    Flushbar(
      icon: SvgPicture.asset(
        AppIcons.icSuccess,
        width: min(20.w, 24),
        height: min(20.w, 24),
      ),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              message,
              style: AppStyle.medium14black,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (!isPressed) {
                NavigationService.navigatorKey.currentState!.maybePop();
                isPressed = true;
              }
            },
            child: Icon(
              Icons.clear,
              size: min(20.w, 24),
              color: AppColors.black,
            ),
          )
        ],
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: position,
      isDismissible: true,
      backgroundColor: Colors.white,
      boxShadows: [
        BoxShadow(
          color: const Color.fromRGBO(0, 0, 0, 0.08),
          blurRadius: 10.w,
        )
      ],
      duration: const Duration(seconds: 5),
      margin: EdgeInsets.symmetric(horizontal: min(20.w, 22), vertical: min(3.h, 5)),
      padding: EdgeInsets.symmetric(horizontal: min(14.w, 16), vertical: min(12.h, 18),),
      borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
    ).show(NavigationService.navigatorKey.currentContext!);
  }

  static void showError(
    String title, {
    String? content,
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    bool isPressed = false;

    Flushbar(
      icon: SvgPicture.asset(
        AppIcons.icFailure,
        width: min(20.w, 24),
        height: min(20.w, 24),
      ),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 230.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyle.medium14black,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 100,
                ),
                content != null
                    ? Text(
                        content,
                        style: AppStyle.medium12black,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (!isPressed) {
                NavigationService.navigatorKey.currentState!.maybePop();
                isPressed = true;
              }
            },
            child: Icon(
              Icons.clear,
              size: min(20.w, 24),
              color: AppColors.black,
            ),
          )
        ],
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: position,
      isDismissible: true,
      backgroundColor: Colors.white,
      boxShadows: [
        BoxShadow(
          color: const Color.fromRGBO(0, 0, 0, 0.08),
          blurRadius: 10.w,
        )
      ],
      duration: const Duration(seconds: 5),
      margin: EdgeInsets.symmetric(horizontal: min(20.w, 22), vertical: min(3.h, 5)),
      padding: EdgeInsets.symmetric(horizontal: min(14.w, 16), vertical: min(12.h, 18),),
      borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
    ).show(NavigationService.navigatorKey.currentContext!);
  }

  static void showWarning(
    String message, {
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    bool isPressed = false;

    Flushbar(
      icon: SvgPicture.asset(
        AppIcons.icWarning,
        width: min(20.w, 24),
        height: min(20.w, 24),
      ),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              message,
              style: AppStyle.medium14black,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (!isPressed) {
                NavigationService.navigatorKey.currentState!.maybePop();
                isPressed = true;
              }
            },
            child: Icon(
              Icons.clear,
              size: min(20.w, 24),
              color: AppColors.black,
            ),
          )
        ],
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: position,
      isDismissible: true,
      backgroundColor: Colors.white,
      boxShadows: [
        BoxShadow(
          color: const Color.fromRGBO(0, 0, 0, 0.08),
          blurRadius: 10.w,
        )
      ],
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.symmetric(horizontal: min(20.w, 22), vertical: min(3.h, 5)),
      padding: EdgeInsets.symmetric(horizontal: min(14.w, 16), vertical: min(12.h, 18),),
      borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
    ).show(NavigationService.navigatorKey.currentContext!);
  }

  static void showLoading(
    String message, {
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    bool isPressed = false;

    Flushbar(
      icon: const Icon(
        Icons.upload_outlined,
        size: 20,
        color: AppColors.primary1C8CEE,
      ),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              message,
              style: AppStyle.medium14black,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (!isPressed) {
                NavigationService.navigatorKey.currentState!.maybePop();
                isPressed = true;
              }
            },
            child: Icon(
              Icons.clear,
              size: min(20.w, 24),
              color: AppColors.black,
            ),
          )
        ],
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: position,
      isDismissible: true,
      backgroundColor: Colors.white,
      boxShadows: [
        BoxShadow(
          color: const Color.fromRGBO(0, 0, 0, 0.08),
          blurRadius: 10.w,
        )
      ],
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.symmetric(horizontal: min(20.w, 22), vertical: min(3.h, 5)),
      padding: EdgeInsets.symmetric(horizontal: min(14.w, 16), vertical: min(12.h, 18),),
      borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
    ).show(NavigationService.navigatorKey.currentContext!);
  }

  static void showProcess(
    String title,
    String? content, {
    FlushbarPosition position = FlushbarPosition.TOP,
    required Widget body,
  }) {
    bool isPressed = false;

    Flushbar(
      messageText: body,
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: position,
      isDismissible: true,
      backgroundColor: Colors.white,
      boxShadows: [
        BoxShadow(
          color: const Color.fromRGBO(0, 0, 0, 0.08),
          blurRadius: 10.w,
        )
      ],
      duration: null,
      margin: EdgeInsets.symmetric(horizontal: min(20.w, 22), vertical: min(3.h, 5)),
      padding: EdgeInsets.symmetric(horizontal: min(14.w, 16), vertical: min(12.h, 18),),
      borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
    ).show(NavigationService.navigatorKey.currentContext!);
  }
}
