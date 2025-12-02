import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/core/extensions/context_extensions.dart';

import '../../../assets/app_assets.dart';
import '../../components/button.dart';
import '../../theme/app_theme.dart';
import '../../theme/window_size_class.dart';

Widget orDividerText(BuildContext context) {
  final colors = AppTheme.colorsOf(context);
  final typo = AppTheme.textThemeOf(context);
  final strings = context.localization;

  return Align(
    alignment: Alignment.center,
    child: Text(
      strings.orUsingOtherMethod,
      style: typo.bodyMedium?.copyWith(color: colors.outline),
    ),
  );
}

Widget socialLoginSection(BuildContext context,{bool isLogin = true}) {
  final dimens = AppTheme.dimensOf(context);
  final strings = context.localization;
  final orientation = AppTheme.orientationOf(context);

  final googleButton = AppSocialButton(
    text: isLogin ? strings.signInWithGoogle : strings.signupWithGoogle,
    iconPath: AppAssets.google,
    onPressed: () {},
  );
  final facebookButton = AppSocialButton(
    text: isLogin ? strings.signInWithFacebook : strings.signUpWithFacebook,
    iconPath: AppAssets.facebook,
    onPressed: () {},
  );

  if (orientation == OrientationMode.portrait) {
    return Column(
      children: [
        googleButton,
        SizedBox(height: dimens.small),
        facebookButton,
      ],
    );
  } else {
    return Row(
      children: [
        Expanded(child: googleButton),
        SizedBox(width: dimens.small),
        Expanded(child: facebookButton),
      ],
    );
  }
}

Widget headerSection(
    BuildContext context, String titleText, String description) {
  final dimens = AppTheme.dimensOf(context);
  final colors = AppTheme.colorsOf(context);
  final typo = AppTheme.textThemeOf(context);
  final orientation = AppTheme.orientationOf(context);

  final title = Text(titleText, style: typo.titleLarge);
  final subtitle = Text(
    description,
    style: typo.bodyMedium?.copyWith(color: colors.outline),
  );

  if (orientation == OrientationMode.landscape) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        title,
        Padding(
          padding: EdgeInsets.only(left: dimens.small),
          child: subtitle,
        ),
      ],
    );
  } else {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [title, subtitle],
    );
  }
}