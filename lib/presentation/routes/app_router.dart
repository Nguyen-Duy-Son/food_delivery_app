import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/core/repositories/auth_repository.dart';
import 'package:food_delivery_app/di.dart';
import 'package:food_delivery_app/presentation/routes/route_name.dart';
import 'package:food_delivery_app/presentation/screen/home/home_screen.dart';
import 'package:food_delivery_app/presentation/screen/on_boarding/on_boarding_screen.dart';
import 'package:food_delivery_app/presentation/screen/sign_in/provider/sign_in_provider.dart';
import 'package:food_delivery_app/presentation/screen/sign_in/sign_in_screen.dart';
import 'package:food_delivery_app/presentation/screen/sign_up/sign_up_screen.dart';
import 'package:food_delivery_app/presentation/screen/splash/splash_screen.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    Widget initialWidget = const SplashScreen();
    Widget routeWidget = initialWidget;

    switch (routeSettings.name) {
      case RouteName.rootScreen:
        routeWidget = initialWidget;
        break;

      case RouteName.onBoardingScreen:
        routeWidget = const OnBoardingScreen();
        break;

      case RouteName.signInScreen:
        routeWidget = ProviderScope(
          overrides: [
            authRepositoryProvider.overrideWithValue(getIt<AuthRepository>()),
          ],
          child: const SignInScreen(),
        );
        break;

      case RouteName.signUpScreen:
        routeWidget = const SignUpScreen();
        break;
      case RouteName.homeScreen:
        routeWidget = const HomeScreen();
        break;
      default:
        routeWidget;
        break;
    }
    return MaterialPageRoute(
      builder: (_) => routeWidget,
      settings: routeSettings,
    );
  }
}
