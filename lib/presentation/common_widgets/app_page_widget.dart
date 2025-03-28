import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class AppPageWidget extends StatelessWidget {
  final bool isLoading;
  final Widget body;
  final VoidCallback? onRefresh;
  final PreferredSizeWidget? appbar;
  final VoidCallback? onGoBack;
  final bool? extendBodyBehindAppBar;
  final bool showFullLoading;
  final Color? backgroundColor;

  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;
  final Widget? bottomNavigationBar;

  const AppPageWidget({
    Key? key,
    this.isLoading = false,
    required this.body,
    this.onRefresh,
    this.appbar,
    this.onGoBack,
    this.extendBodyBehindAppBar = false,
    this.showFullLoading = true,
    this.backgroundColor,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: backgroundColor ?? AppColors.white,
        extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
        appBar: appbar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
        body: body,
        floatingActionButton: floatingActionButton ?? const SizedBox(),
        bottomNavigationBar: bottomNavigationBar ?? const SizedBox(),
      ),
      isLoading ? _buildFullLoading(context) : const SizedBox(),
    ]);
  }

  Widget _buildFullLoading(context) {
    if (!showFullLoading) {
      return Container(
        width: 1.sw,
        height: 1.sh,
        color: Colors.transparent,
      );
    }

    return Positioned(
      width: 1.sw,
      height: 1.sh,
      child: Container(
        color: Colors.black54,
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.primary1C8CEE),
        ),
      ),
    );
  }
}
