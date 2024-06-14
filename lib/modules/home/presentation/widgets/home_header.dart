import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/constants/layout_constants.dart';
import 'package:real_estate_ui/common/extensions/screen_utils_extensions.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:real_estate_ui/common/theme/new_theme/text_theme/default_text_themes.dart';
import 'package:real_estate_ui/modules/home/home_constants.dart';
import 'package:real_estate_ui/modules/home/presentation/widgets/circular_text_widget.dart';
import 'package:real_estate_ui/modules/home/presentation/widgets/sliding_text.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: LayoutConstants.dimen_420.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.symmetric(
            vertical: LayoutConstants.dimen_10.w,
            horizontal: LayoutConstants.dimen_18.h,
          ),
          child: Column(
            children: [
              _buildAppbar(),
              _buildIntroWidget(),
              SizedBox(height: LayoutConstants.dimen_36.h),
              _buildEstateInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: LayoutConstants.dimen_20.w,
                  right: LayoutConstants.dimen_8.w),
              child: const Icon(
                Icons.location_on,
                color: AppColor.lightTextColor,
              ),
            ),
            Text(
              HomeConstants.locationName,
              style: AppTextTheme.bodyLr,
            ),
          ],
        ),
        Container(
          height: LayoutConstants.dimen_48.h,
          width: LayoutConstants.dimen_48.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person),
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
            opacity: true ? 1 : 0,
            child: Text(
              'Hi, Marina',
              style: AppTextTheme.bodySm.copyWith(
                color: AppColor.lightTextColor,
              ),
            ),
          ),
        ),
        const SlidingText(
          animationDuration: Duration(milliseconds: 500),
          text: HomeConstants.letsSelectYour,
          alignment: Alignment.topLeft,
        ),
        const SlidingText(
          animationDuration: Duration(milliseconds: 500),
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
