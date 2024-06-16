import 'package:flutter/material.dart';
import 'package:real_estate_ui/modules/dashboard/dashboard.dart';
import 'package:real_estate_ui/modules/home/presentation/pages/home.dart';
import 'package:real_estate_ui/routes/routes_constant.dart';

abstract class HomeRoutes {
  static Map<String, WidgetBuilder> all() => {
        RoutesConstants.splashScreen: (context) => const Home(),
        RoutesConstants.dashboard: (context) => const DashboardScreen(),
      };

  static Map<String, WidgetBuilder> getRoutesWithSettings(
          RouteSettings settings) =>
      {};
}
