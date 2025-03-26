import 'package:flutter/material.dart';
import 'package:food_delivery_app/di.dart';
import 'package:food_delivery_app/presentation/routes/route_name.dart';
import 'package:food_delivery_app/presentation/screen/home/cubit/home_cubit.dart';
import 'package:food_delivery_app/presentation/screen/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    Widget initialWidget = const HomeScreen();
    Widget _routeWidget = initialWidget;

    switch (routeSettings.name) {
      case RouteName.rootScreen:
        _routeWidget = BlocProvider(
            create: (context) {
              return HomeCubit();
            },
            child: initialWidget);
        break;
      default:
        _routeWidget;
        break;
    }
    return MaterialPageRoute(
      builder: (_) => _routeWidget,
      settings: routeSettings,
    );
  }
}
