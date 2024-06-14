import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/constants/layout_constants.dart';
import 'package:real_estate_ui/common/extensions/screen_utils_extensions.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';

class NeumorphicSlideButton extends StatefulWidget {
  const NeumorphicSlideButton(
      {super.key, required this.address, required this.alignment});

  final String address;
  final AlignmentGeometry alignment;

  @override
  State<NeumorphicSlideButton> createState() => _NeumorphicSlideButtonState();
}

class _NeumorphicSlideButtonState extends State<NeumorphicSlideButton> {
  bool _animateButton = false;
  bool _animateAddress = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final delay = Random().nextInt(1000) + 3700;
      await Future.delayed(Duration(milliseconds: delay));
      if (mounted) {
        setState(() {
          _animateButton = true;
        });
      }
      await Future.delayed(const Duration(milliseconds: 400));
      if (mounted) {
        setState(() {
          _animateAddress = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: LayoutConstants.dimen_40.h,
        width:
            _animateButton ? constraints.maxWidth : LayoutConstants.dimen_40.w,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: AppColor.secondaryColor.withOpacity(0.3)),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: LayoutConstants.dimen_28,
              sigmaY: LayoutConstants.dimen_28,
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    alignment: widget.alignment,
                    child: AnimatedOpacity(
                      opacity: _animateAddress ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(widget.address),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    right: _animateButton
                        ? 0
                        : constraints.maxWidth - LayoutConstants.dimen_40,
                    duration: const Duration(milliseconds: 400),
                    child: const CircleAvatar(
                      radius: LayoutConstants.dimen_18,
                      backgroundColor: AppColor.white,
                      child: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: AppColor.darkTextColor,
                        size: LayoutConstants.dimen_16,
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      );
    });
  }
}
