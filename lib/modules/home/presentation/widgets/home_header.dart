import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/constants/layout_constants.dart';
import 'package:real_estate_ui/common/extensions/screen_utils_extensions.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:real_estate_ui/common/theme/new_theme/text_theme/default_text_themes.dart';
import 'package:real_estate_ui/modules/home/data/model/widget_animation_config.dart';
import 'package:real_estate_ui/modules/home/home_constants.dart';
import 'package:real_estate_ui/modules/home/presentation/widgets/circular_text_widget.dart';
import 'package:real_estate_ui/modules/home/presentation/widgets/sliding_text.dart';
import 'package:real_estate_ui/modules/home/services/animation_controller_service.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late AnimationControllerService _animationControllerService;
  late ValueNotifier<List<WidgetAnimationConfig>> _animateNotifer;
  @override
  void initState() {
    super.initState();
    _animationControllerService = AnimationControllerService()..init();
    _animateNotifer = _animationControllerService.animateNotifer;
  }

  @override
  void didUpdateWidget(covariant HomeHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: LayoutConstants.dimen_380.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.symmetric(
            vertical: LayoutConstants.dimen_8.w,
            horizontal: LayoutConstants.dimen_12.h,
          ),
          child: ValueListenableBuilder(
              valueListenable: _animateNotifer,
              builder: (context, _, __) {
                return Column(
                  children: [
                    _buildAppbar(),
                    SizedBox(height: LayoutConstants.dimen_12.h),
                    _buildIntroWidget(),
                    SizedBox(height: LayoutConstants.dimen_32.h),
                    _buildEstateInfoWidget(),
                  ],
                );
              }),
        ),
      ),
    );
  }

  WidgetAnimationConfig _getWidgetInfo(Section section) {
    return _animateNotifer.value
        .firstWhere((element) => element.widget == section);
  }

  Widget _buildAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: _getWidgetInfo(Section.location).animationStatus ==
                  AnimationState.completed
              ? 1
              : 0,
          child: Row(
            children: [
              const Icon(
                Icons.location_on,
                color: AppColor.lightTextColor,
              ),
              Text(
                HomeConstants.locationName,
                style: AppTextTheme.bodyLr,
              ),
            ],
          ),
        ),
        AnimatedScale(
          duration: const Duration(milliseconds: 500),
          scale: _getWidgetInfo(Section.profile).animationStatus ==
                  AnimationState.completed
              ? 1
              : 0,
          child: Container(
            height: LayoutConstants.dimen_48.h,
            width: LayoutConstants.dimen_48.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person),
          ),
        ),
      ],
    );
  }

  Widget _buildIntroWidget() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _getWidgetInfo(Section.name).animationStatus ==
                    AnimationState.completed
                ? 1
                : 0,
            child: Text(
              'Hi, Marina',
              style: AppTextTheme.bodySm.copyWith(
                color: AppColor.lightTextColor,
              ),
            ),
          ),
        ),
        SlidingText(
          animationDuration: const Duration(milliseconds: 500),
          animate: _getWidgetInfo(Section.intro1).animationStatus ==
              AnimationState.completed,
          text: HomeConstants.letsSelectYour,
          alignment: Alignment.topLeft,
        ),
        SlidingText(
          animationDuration: const Duration(milliseconds: 500),
          animate: _getWidgetInfo(Section.intro2).animationStatus ==
              AnimationState.completed,
          text: HomeConstants.perfectPlace,
          alignment: Alignment.topLeft,
        ),
      ],
    );
  }

  Widget _buildEstateInfoWidget() {
    return Row(
      children: [
        Expanded(
          child: CircularTextWidget(
            title: HomeConstants.buy.toUpperCase(),
            count: 1034,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: LayoutConstants.dimen_8.h),
        Expanded(
          child: CircularTextWidget(
            title: HomeConstants.rent.toUpperCase(),
            count: 2212,
            color: AppColor.white,
            textColor: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(LayoutConstants.dimen_20),
          ),
        ),
      ],
    );
  }
}
