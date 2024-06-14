import 'package:real_estate_ui/modules/home/data/model/estate_info.dart';

class HomeConstants {
  static const String locationName = 'Saint Petersburg';
  static const letsSelectYour = "let's select your";
  static const perfectPlace = 'perfect place';
  static const buy = 'buy';
  static const rent = 'rent';
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
