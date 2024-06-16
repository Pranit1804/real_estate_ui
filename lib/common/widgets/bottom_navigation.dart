import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:real_estate_ui/common/utils/navigation_stream.dart';
import 'package:real_estate_ui/modules/home/home_constants.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation(
      {super.key,
      required this.currentScreen,
      required this.controller,
      required this.onScreenChanged});

  final int currentScreen;
  final PageController controller;
  final void Function(int index) onScreenChanged;

  @override
  State<StatefulWidget> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  bool _navBarAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 4800));
      setState(() {
        _navBarAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
        offset: _navBarAnimation ? Offset.zero : const Offset(0, 1),
        duration: const Duration(milliseconds: 500),
        child: SafeArea(
          child: Material(
            shape: const StadiumBorder(),
            color: AppColor.darkTextColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: HomeConstants.navItems.map((item) {
                final selected = item.id == widget.currentScreen;

                return GestureDetector(
                  onTap: () {
                    NavStream.pushData(item.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundColor: selected
                          ? AppColor.primaryColor
                          : AppColor.darkTextColor,
                      radius: selected ? 24 : 20,
                      child: Icon(
                        item.icon,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}
