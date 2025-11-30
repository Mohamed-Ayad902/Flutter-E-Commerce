import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/theme/typographies.dart';

import 'colors.dart';
import 'dimens.dart';
import 'window_size_class.dart';

class AppTheme extends InheritedWidget {
  final Dimensions dimens;
  final OrientationMode orientation;
  final WindowSizeClass windowSizeClass;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const AppTheme({
    super.key,
    required this.dimens,
    required this.orientation,
    required this.windowSizeClass,
    required this.colorScheme,
    required this.textTheme,
    required super.child,
  });

  static AppTheme of(BuildContext context) {
    final res = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(res != null, 'No AppTheme found in context. Wrap your app with AppThemeWidget');
    return res!;
  }

  static Dimensions dimensOf(BuildContext context) => of(context).dimens;
  static OrientationMode orientationOf(BuildContext context) => of(context).orientation;
  static WindowSizeClass windowSizeClassOf(BuildContext context) => of(context).windowSizeClass;
  static ColorScheme colorsOf(BuildContext context) => of(context).colorScheme;
  static TextTheme textThemeOf(BuildContext context) => of(context).textTheme;

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return oldWidget.dimens != dimens ||
        oldWidget.orientation != orientation ||
        oldWidget.colorScheme != colorScheme ||
        oldWidget.textTheme != textTheme;
  }
}

/// Top-level widget that computes sizes and wires Theme
class AppThemeWidget extends StatelessWidget {
  final Widget child;
  final bool dynamicColor; // unused here, kept for parity

  const AppThemeWidget({
    super.key,
    required this.child,
    this.dynamicColor = false,
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final windowClass = computeWindowSizeClass(mq);
    final isLandscape = mq.orientation == Orientation.landscape;

    // choose dimensions based on the smaller axis (to match your Compose logic)
    final sizeThatMatters = isLandscape ? windowClass.height : windowClass
        .width;

    final dims = switch (sizeThatMatters) {
      WindowSmall() => smallDimensions,
      WindowCompact() => compactDimensions,
      WindowMedium() => mediumDimensions,
      WindowLarge() => largeDimensions,
    };

    // follow system brightness
    final platformBrightness = mq.platformBrightness;
    final bool darkTheme = platformBrightness == Brightness.dark;

    final colorScheme = darkTheme ? darkColorScheme : lightColorScheme;
    final textTheme = textThemeFor(sizeThatMatters);

    final theme = ThemeData.from(
      colorScheme: colorScheme,
      textTheme: textTheme,
    );

    // Provide both a Theme widget (so Theme.of works) and AppTheme for dims/orientation/colors/text
    return AppTheme(
      dimens: dims,
      orientation: isLandscape ? OrientationMode.landscape : OrientationMode
          .portrait,
      windowSizeClass: windowClass,
      colorScheme: colorScheme,
      textTheme: textTheme,
      child: Theme(data: theme, child: child),
    );
  }
}