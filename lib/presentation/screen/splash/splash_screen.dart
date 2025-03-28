import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/constants/app_images.dart';
import 'package:food_delivery_app/core/enum/storage_keys.dart';
import 'package:food_delivery_app/core/services/shared_preferences_service.dart';
import 'package:food_delivery_app/di.dart';
import 'package:food_delivery_app/presentation/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initData();
  }

  Future<void> initData() async {
    SharedPreferencesService prefs = getIt<SharedPreferencesService>();
    bool isFirstTime = await prefs.getBoolValue(StorageKeys.isFirstTime);
    await checkIsFirstTime(isFirstTime);
  }
  Future<void> checkIsFirstTime(bool isFirstTime) async {
    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, RouteName.onBoardingScreen);
    } else {
      Navigator.pushReplacementNamed(context, RouteName.signInScreen);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppImages.imgSplash2,
        fit: BoxFit.fill,
        width: 1.sw,
        height: 1.sh,
      ),
    );
  }
}
