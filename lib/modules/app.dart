import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/constants/app_constants.dart';

import 'package:real_estate_ui/common/utils/app_utils.dart';
import 'package:real_estate_ui/common/utils/screen_utils.dart';
import 'package:real_estate_ui/global_navigator.dart';
import 'package:real_estate_ui/routes/routes.dart';
import 'package:real_estate_ui/routes/routes_constant.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: mtAppGlobalKey);
  static GlobalKey<_AppState> mtAppKey = GlobalKey();
  static GlobalKey<_AppState> mtAppGlobalKey = GlobalKey();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode _themeMode = ThemeMode.light;
  final GlobalKey<NavigatorState> _navigatorStateGlobalKey =
      GlobalNavigator.navigatorStateGlobalKey;

  @override
  void initState() {
    super.initState();
    _themeMode = AppUtils.getAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        ScreenUtils.init(context, navigator: _navigatorStateGlobalKey);
        return getApp();
      },
    );
  }

  changeThemeMode(ThemeMode newTheme) {
    setState(() {
      _themeMode = newTheme;
    });
  }

  ThemeMode getThemeMode() {
    return _themeMode;
  }

  MaterialApp getApp() {
    return MaterialApp(
      key: App.mtAppKey,
      navigatorKey: _navigatorStateGlobalKey,
      builder: (context, child) {
        return _appBuilder(context, child!);
      },
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      themeMode: _themeMode,
      routes: Routes.getAll(),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RoutesConstants.splashScreen,
    );
  }

  Widget _appBuilder(BuildContext context, Widget widget) {
    final Widget appWidget = SafeArea(child: widget);

    return appWidget;
  }
}
