import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/data_source/client_provider.dart';
import 'package:food_delivery_app/core/services/navigation_services.dart';
import 'package:food_delivery_app/di.dart';
import 'package:food_delivery_app/presentation/routes/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // DI init
  await configureDependencies();


  // Read url from env and use for baseUrl in init
  await RestClientProvider.init();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
    path: 'assets/translations',
    fallbackLocale: const Locale('vi', 'VN'),
    startLocale: const Locale('vi', 'VN'),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRoutes _appRoute = AppRoutes();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (_, child) => MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        // set property
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        builder: (BuildContext context, Widget? child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        ),
        locale: context.locale,
        title: 'Flutter Base',
        onGenerateRoute: _appRoute.onGenerateRoute,
        theme: ThemeData(
          textTheme: TextTheme(
            displayLarge: GoogleFonts.manrope(fontSize: 15.sp, color: AppColors.grey800),
            displayMedium: GoogleFonts.manrope(fontSize: 15.sp, color: AppColors.grey800),
            displaySmall: GoogleFonts.manrope(fontSize: 15.sp, color: AppColors.grey800),
            headlineMedium: GoogleFonts.manrope(fontSize: 15.sp, color: AppColors.grey800),
            headlineSmall: GoogleFonts.manrope(fontSize: 15.sp, color: AppColors.grey800),
            titleLarge: GoogleFonts.manrope(fontSize: 15.sp, color: AppColors.grey800),
            titleMedium: GoogleFonts.manrope(fontSize: 15.sp, color: AppColors.grey800),
            titleSmall: GoogleFonts.manrope(fontSize: 15.sp, color: AppColors.grey800),
            bodyLarge: GoogleFonts.manrope(
              fontSize: 15.sp,
              color: AppColors.grey800,
              height: 1.5,
            ),
            bodyMedium: GoogleFonts.manrope(
              fontSize: 15.sp,
              color: AppColors.grey800,
              height: 1.5,
            ),
            bodySmall: GoogleFonts.manrope(fontSize: 15.sp, color: AppColors.grey800),
            labelLarge: GoogleFonts.manrope(fontSize: 15.sp, color: AppColors.grey800),
            labelSmall: GoogleFonts.manrope(fontSize: 15.sp, color: AppColors.grey800),
          ),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ),
      ),
    );
  }
}