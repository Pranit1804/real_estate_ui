import 'package:flutter/material.dart';
import 'package:real_estate_ui/modules/home/home_routes.dart';

abstract class Routes {
  static Map<String, WidgetBuilder> getAll() => {
        ...HomeRoutes.all(),
      };

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    WidgetBuilder? builder;
    if (settings.name != null) {
      switch (settings.name) {}
    }
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    }
    return null;
  }
}
