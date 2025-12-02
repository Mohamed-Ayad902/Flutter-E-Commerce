import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isFullWidth;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFullWidth = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.colorsOf(context);
    final dimens = AppTheme.dimensOf(context);
    final typo = AppTheme.textThemeOf(context);

    final double? buttonWidth = isFullWidth ? double.infinity : null;

    return SizedBox(
      width: buttonWidth,
      height: dimens.huge,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(dimens.huge)),
          disabledBackgroundColor: colors.primary.withValues(alpha: 0.5),
          disabledForegroundColor: colors.onPrimary.withValues(alpha: 0.7),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: dimens.medium,
                height: dimens.medium,
                child: CircularProgressIndicator(
                  color: colors.onPrimary,
                  strokeWidth: 2.0,
                ),
              )
            : Text(
                text,
                style: typo.titleMedium?.copyWith(color: colors.onPrimary),
              ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;
  final AlignmentGeometry alignment;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.alignment = Alignment.center,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.colorsOf(context);
    final typo = AppTheme.textThemeOf(context);

    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: alignment,
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: colors.primary,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style:
                typo.bodyMedium?.copyWith(color: textColor ?? colors.primary),
          ),
        ),
      ),
    );
  }
}

class AppSocialButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor; // Optional icon color override

  const AppSocialButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);
    final typo = AppTheme.textThemeOf(context);
    final colors = AppTheme.colorsOf(context);

    return SizedBox(
      width: double.infinity,
      height: dimens.huge,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: colors.surfaceContainerHighest),
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dimens.huge),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              height: dimens.medium,
              width: dimens.medium,
            ),
            Padding(
              padding: EdgeInsets.only(left: dimens.small),
              child: Text(
                text,
                style: typo.bodyLarge?.copyWith(
                    color: colors.onSurface, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
