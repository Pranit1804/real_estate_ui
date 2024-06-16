import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/utils/navigation_stream.dart';
import 'package:real_estate_ui/common/widgets/bottom_navigation.dart';
import 'package:real_estate_ui/modules/home/presentation/pages/home.dart';
import 'package:real_estate_ui/modules/search/presentation/pages/search.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PageController _controller;
  int _screenIndex = 2;

  @override
  void initState() {
    super.initState();
    NavStream.stream.asBroadcastStream().listen((event) {
      setState(() {
        _screenIndex = event;
        _controller.jumpToPage(event);
      });
    });
    _controller = PageController(initialPage: _screenIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: [
              const Search(),
              Container(),
              const Home(),
              Container(),
              Container(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: BottomNavigation(
              currentScreen: _screenIndex,
              controller: _controller,
              onScreenChanged: (index) {},
            ),
          )
        ],
      ),
    );
  }
}
