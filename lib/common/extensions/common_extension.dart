import 'package:real_estate_ui/modules/home/data/model/widget_animation_config.dart';

extension WidgetListExtension on List<WidgetAnimationConfig> {
  List<WidgetAnimationConfig> resetWidgetInfo() {
    List<WidgetAnimationConfig> updatedList = this;
    updatedList.forEach((e) => e.animationStatus = AnimationState.stale);
    return updatedList;
  }
}
