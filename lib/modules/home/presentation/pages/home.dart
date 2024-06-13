import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: AppColor.bodyTextLightMode);
  }
}
