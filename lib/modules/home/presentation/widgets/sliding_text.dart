import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/theme/new_theme/text_theme/default_text_themes.dart';

class SlidingText extends StatelessWidget {
  final Duration animationDuration;
  final String text;
  final bool animate;
  final Alignment alignment;
  const SlidingText(
      {super.key,
      required this.animationDuration,
      required this.text,
      required this.animate,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Align(
        alignment: alignment,
        child: AnimatedSlide(
          duration: animationDuration,
          offset: animate ? Offset.zero : const Offset(0, 1),
          child: Text(
            text,
            style: AppTextTheme.display2XLR,
          ),
        ),
      ),
    );
  }
}
