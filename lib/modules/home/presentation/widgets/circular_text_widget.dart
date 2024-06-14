import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/constants/layout_constants.dart';
import 'package:real_estate_ui/common/extensions/screen_utils_extensions.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:real_estate_ui/common/theme/new_theme/text_theme/default_text_themes.dart';

class CircularTextWidget extends StatefulWidget {
  const CircularTextWidget({
    super.key,
    required this.title,
    required this.count,
    this.shape,
    this.borderRadius,
    this.color,
    this.textColor,
  });

  final String title;
  final int count;
  final BoxShape? shape;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Color? textColor;

  @override
  State<CircularTextWidget> createState() => _CircularTextWidgetState();
}

class _CircularTextWidgetState extends State<CircularTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animateCount;

  bool _animateSize = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animateCount = StepTween(
      begin: 0,
      end: widget.count,
    ).animate(_animationController);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      if (mounted) {
        setState(() {
          _animateSize = true;
        });
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 500),
      scale: _animateSize ? 1 : 0,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(LayoutConstants.dimen_20),
        decoration: BoxDecoration(
          shape: widget.shape ?? BoxShape.rectangle,
          color: widget.color ?? AppColor.primaryColor,
          borderRadius: widget.borderRadius,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: LayoutConstants.dimen_18.h,
            left: LayoutConstants.dimen_16.w,
            right: LayoutConstants.dimen_16.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: AppTextTheme.bodyLr.copyWith(
                  color: widget.textColor ?? AppColor.white,
                ),
              ),
              SizedBox(height: LayoutConstants.dimen_24.h),
              AnimatedBuilder(
                  animation: _animateCount,
                  builder: (context, child) {
                    return FittedBox(
                      child: Text(
                        '${_animateCount.value}',
                        style: AppTextTheme.display3XLSB.copyWith(
                          fontWeight: FontWeight.bold,
                          color: widget.textColor ?? AppColor.white,
                        ),
                      ),
                    );
                  }),
              Text(
                'offers',
                style: AppTextTheme.bodySm.copyWith(
                  color: widget.textColor ?? AppColor.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
