import 'package:flutter/material.dart';
import 'package:real_estate_ui/modules/home/data/model/bottom_navigation_model.dart';
import 'package:real_estate_ui/modules/home/data/model/estate_info.dart';
import 'package:real_estate_ui/modules/home/data/model/widget_animation_config.dart';

class HomeConstants {
  static const String locationName = 'Saint Petersburg';
  static const letsSelectYour = "let's select your";
  static const perfectPlace = 'perfect place';
  static const buy = 'buy';
  static const rent = 'rent';

  static const homeAnimationDifference = 400;

  static List<BottomNavigationModel> navItems = [
    BottomNavigationModel(id: 0, name: 'Search', icon: Icons.search),
    BottomNavigationModel(id: 1, name: 'Message', icon: Icons.message_rounded),
    BottomNavigationModel(id: 2, name: 'Home', icon: Icons.home_filled),
    BottomNavigationModel(
      id: 3,
      name: 'Favorite',
      icon: Icons.favorite_rounded,
    ),
    BottomNavigationModel(id: 4, name: 'Profile', icon: Icons.person),
  ];

  static List<WidgetAnimationConfig> widgetInfo = [
    WidgetAnimationConfig(
      id: 1,
      widget: Section.profile,
    ),
    WidgetAnimationConfig(
      id: 2,
      widget: Section.location,
    ),
    WidgetAnimationConfig(
      id: 3,
      widget: Section.name,
    ),
    WidgetAnimationConfig(
      id: 4,
      widget: Section.intro1,
    ),
    WidgetAnimationConfig(
      id: 5,
      widget: Section.intro2,
    ),
  ];
  static List<EstateInfo> estateList = [
    EstateInfo(
        address: 'Gladkova St., 25',
        image: 'assets/images/place_1.png',
        widgetInfo:
            WidgetPlacementInfo(mainAxisAlignment: 1, crossAxisAligment: 2)),
    EstateInfo(
        address: 'Gubina St., 11',
        image: 'assets/images/place_2.png',
        widgetInfo:
            WidgetPlacementInfo(mainAxisAlignment: 2, crossAxisAligment: 1)),
    EstateInfo(
        address: 'Trefoleva St., 43',
        image: 'assets/images/place_3.png',
        widgetInfo:
            WidgetPlacementInfo(mainAxisAlignment: 1, crossAxisAligment: 1)),
    EstateInfo(
        address: 'Sedova St., 22',
        image: 'assets/images/place_4.png',
        widgetInfo:
            WidgetPlacementInfo(mainAxisAlignment: 1, crossAxisAligment: 1))
  ];
}
