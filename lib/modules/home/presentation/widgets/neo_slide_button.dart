import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/constants/layout_constants.dart';
import 'package:real_estate_ui/common/extensions/screen_utils_extensions.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:real_estate_ui/common/theme/new_theme/text_theme/default_text_themes.dart';

class NeumorphicSlideButton extends StatefulWidget {
  const NeumorphicSlideButton(
      {super.key, required this.address, required this.alignment});

  final String address;
  final AlignmentGeometry alignment;

  @override
  State<NeumorphicSlideButton> createState() => _NeumorphicSlideButtonState();
}

class _NeumorphicSlideButtonState extends State<NeumorphicSlideButton> {
  ValueNotifier<bool> _animateButton = ValueNotifier(false);
  ValueNotifier<bool> _animateAddress = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final delay = Random().nextInt(400) + 3700;
      await Future.delayed(Duration(milliseconds: delay));
      if (mounted) {
        setState(() {
          _animateButton.value = true;
        });
      }
      await Future.delayed(const Duration(milliseconds: 300));
      if (mounted) {
        setState(() {
          _animateAddress.value = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ValueListenableBuilder(
          valueListenable: _animateButton,
          builder: (context, _, __) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: LayoutConstants.dimen_40.h,
              width: _animateButton.value
                  ? constraints.maxWidth
                  : LayoutConstants.dimen_40.w,
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
                        ValueListenableBuilder(
                            valueListenable: _animateAddress,
                            builder: (context, _, __) {
                              return Container(
                                alignment: widget.alignment,
                                child: AnimatedOpacity(
                                  opacity: _animateAddress.value ? 1 : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      widget.address,
                                      style: AppTextTheme.bodyMm,
                                    ),
                                  ),
                                ),
                              );
                            }),
                        AnimatedPositioned(
                          right: _animateButton.value
                              ? 0
                              : constraints.maxWidth - LayoutConstants.dimen_40,
                          duration: const Duration(milliseconds: 400),
                          child: const CircleAvatar(
                            radius: LayoutConstants.dimen_25,
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
    });
  }
}
