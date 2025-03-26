import 'package:flutter/material.dart';
import 'package:food_delivery_app/di.dart';
import 'package:food_delivery_app/presentation/routes/route_name.dart';
import 'package:food_delivery_app/presentation/screen/home/cubit/home_cubit.dart';
import 'package:food_delivery_app/presentation/screen/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      case RouteName.homeScreen:
        routeWidget = BlocProvider(
            create: (context) {
              return HomeCubit();
            },
            child: const HomeScreen());
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
