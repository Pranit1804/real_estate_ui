import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/constants/layout_constants.dart';
import 'package:real_estate_ui/common/extensions/screen_utils_extensions.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:real_estate_ui/common/theme/new_theme/text_theme/default_text_themes.dart';

class SearchAppbar extends StatefulWidget {
  final bool animateItems;
  const SearchAppbar({super.key, required this.animateItems});

  @override
  State<SearchAppbar> createState() => _SearchAppbarState();
}

class _SearchAppbarState extends State<SearchAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: AnimatedScale(
            scale: widget.animateItems ? 1 : 0,
            duration: const Duration(milliseconds: 700),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius:
                      BorderRadius.circular(LayoutConstants.dimen_40)),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: LayoutConstants.dimen_12.h),
                    hintText: 'Saint Petersburg',
                    hintStyle: AppTextTheme.bodyLr
                        .copyWith(color: AppColor.darkTextColor),
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColor.darkTextColor,
                    )),
              ),
            ),
          ),
        ),
        SizedBox(width: LayoutConstants.dimen_10.h),
        AnimatedScale(
          scale: widget.animateItems ? 1 : 0,
          duration: const Duration(milliseconds: 700),
          child: Container(
            decoration: const BoxDecoration(
                color: AppColor.white, shape: BoxShape.circle),
            child: const Padding(
              padding: EdgeInsets.all(LayoutConstants.dimen_12),
              child:
                  Icon(Icons.swap_horiz_rounded, color: AppColor.darkTextColor),
            ),
          ),
        )
      ],
    );
  }
}
