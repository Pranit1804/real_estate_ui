class EstateInfo {
  final String address;
  final String image;
  final WidgetPlacementInfo widgetInfo;
  EstateInfo({
    required this.address,
    required this.image,
    required this.widgetInfo,
  });
}

class WidgetPlacementInfo {
  final int mainAxisAlignment;
  final int crossAxisAligment;

  WidgetPlacementInfo({
    required this.mainAxisAlignment,
    required this.crossAxisAligment,
  });
}
