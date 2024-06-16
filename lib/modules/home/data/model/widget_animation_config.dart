enum Section {
  location,
  profile,
  name,
  intro1,
  intro2,
}

enum AnimationState { stale, started, inProgress, completed }

class WidgetAnimationConfig {
  final int id;
  final Section widget;
  AnimationState animationStatus;

  WidgetAnimationConfig({
    required this.id,
    required this.widget,
    this.animationStatus = AnimationState.stale,
  });

  void updateAnimationStatus(AnimationState state) => animationStatus = state;

  @override
  bool operator ==(Object other) {
    return other is WidgetAnimationConfig && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
