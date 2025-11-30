import 'package:flutter/widgets.dart';

enum OrientationMode { portrait, landscape }

sealed class WindowSize {
  const WindowSize();
}

class WindowSmall extends WindowSize {
  final int dp;
  const WindowSmall(this.dp);
}
class WindowCompact extends WindowSize {
  final int dp;
  const WindowCompact(this.dp);
}
class WindowMedium extends WindowSize {
  final int dp;
  const WindowMedium(this.dp);
}
class WindowLarge extends WindowSize {
  final int dp;
  const WindowLarge(this.dp);
}

class WindowSizeClass {
  final WindowSize width;
  final WindowSize height;

  const WindowSizeClass({required this.width, required this.height});
}

WindowSizeClass computeWindowSizeClass(MediaQueryData mq) {
  final width = mq.size.width;
  final height = mq.size.height;

  WindowSize pick(int value) {
    if (value <= 360) return WindowSmall(value);
    if (value <= 480) return WindowCompact(value);
    if (value <= 720) return WindowMedium(value);
    return WindowLarge(value);
  }

  return WindowSizeClass(
    width: pick(width.round()),
    height: pick(height.round()),
  );
}
