import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:real_estate_ui/modules/home/presentation/widgets/estate_list_widget.dart';
import 'package:real_estate_ui/modules/home/presentation/widgets/home_header.dart';

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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.white, AppColor.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.2, 0.9],
          ),
        ),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext headerContext, bool boolean) {
            return [
              const HomeHeader(),
            ];
          },
          body: const EstateListing(),
        ),
      ),
    );
  }
}
