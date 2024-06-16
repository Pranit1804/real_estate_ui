import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/constants/layout_constants.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:real_estate_ui/common/theme/new_theme/text_theme/default_text_themes.dart';

class MapMarker extends StatefulWidget {
  const MapMarker({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _MapMarkerState();
}

class _MapMarkerState extends State<MapMarker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(LayoutConstants.dimen_40),
            topRight: Radius.circular(LayoutConstants.dimen_40),
            bottomRight: Radius.circular(LayoutConstants.dimen_40),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.dimen_32,
          vertical: LayoutConstants.dimen_40,
        ),
        child: Text(
          widget.title,
          style: AppTextTheme.display3XLSB,
        ),
      ),
    );
  }
}
