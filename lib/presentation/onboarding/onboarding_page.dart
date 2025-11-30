import 'package:flutter/material.dart';

import '../../core/feature/onboarding/domain/models/onboarding_page_data.dart';
import '../theme/app_theme.dart';
import '../theme/window_size_class.dart';

class OnboardingPage extends StatelessWidget {
  final PageData data;

  const OnboardingPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);
    final orientation = AppTheme.orientationOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dimens.smallMedium),
      child: _content(context, orientation),
    );
  }

  Widget _content(BuildContext context, OrientationMode orientation) {
    final dimens = AppTheme.dimensOf(context);
    final colors = AppTheme.colorsOf(context);
    final typo = AppTheme.textThemeOf(context);

    switch (orientation) {
      case OrientationMode.portrait:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(dimens.large),
              child: Image.asset(
                data.imagePath,
                height: dimens.unexpected * 2,
                width: dimens.unexpected + dimens.massive,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: dimens.medium),
            Text(
              data.title,
              style: typo.headlineMedium?.copyWith(color: colors.onSurface),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: dimens.small),
            Text(
              data.description,
              style: typo.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ],
        );
      case OrientationMode.landscape:
        return Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(dimens.small),
                child: Image.asset(
                  data.imagePath,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: dimens.medium),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title,
                      style: typo.headlineMedium
                          ?.copyWith(color: colors.onSurface)),
                  SizedBox(height: dimens.small),
                  Text(data.description,
                      style: typo.bodyMedium
                          ?.copyWith(color: colors.onSurfaceVariant)),
                ],
              ),
            ),
          ],
        );
    }
  }
}
