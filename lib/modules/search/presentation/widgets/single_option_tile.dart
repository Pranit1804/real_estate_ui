import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/constants/layout_constants.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';

class SingleOptionTile extends StatelessWidget {
  final bool animateItem;
  final VoidCallback onTap;
  final IconData icon;
  const SingleOptionTile({
    super.key,
    required this.icon,
    required this.animateItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: animateItem ? 1 : 0,
      duration: const Duration(milliseconds: 700),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.lightWhite.withOpacity(0.9),
              shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(LayoutConstants.dimen_12),
            child: Icon(icon, color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
