import 'dart:async';

import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically
import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/extensions/common_extension.dart';
import 'package:real_estate_ui/modules/home/data/model/widget_animation_config.dart';
import 'package:real_estate_ui/modules/home/home_constants.dart';

class AnimationControllerService {
  Timer? timer;
  late ValueNotifier<List<WidgetAnimationConfig>> animateNotifer;

  init() {
    List<WidgetAnimationConfig> widgetsInfo = HomeConstants.widgetInfo;
    widgetsInfo = widgetsInfo.resetWidgetInfo();
    animateNotifer = ValueNotifier(widgetsInfo);
    timer = Timer.periodic(
        const Duration(milliseconds: HomeConstants.homeAnimationDifference),
        (timer) {
      WidgetAnimationConfig? widget = widgetsInfo.firstWhereOrNull(
          (element) => element.animationStatus == AnimationState.stale);
      if (widget == null) {
        timer.cancel();
        widgetsInfo = HomeConstants.widgetInfo;
        return;
      }
      widgetsInfo = _updateAndReplaceItem(widget, widgetsInfo);
      animateNotifer.value = widgetsInfo;
      animateNotifer.notifyListeners();
    });
  }

  List<WidgetAnimationConfig> _updateAndReplaceItem(
      WidgetAnimationConfig widget, List<WidgetAnimationConfig> widgetsInfo) {
    widget.updateAnimationStatus(AnimationState.completed);
    int index = widgetsInfo.indexWhere((element) => element.id == widget.id);
    widgetsInfo[index] = widget;
    return widgetsInfo;
  }
}
