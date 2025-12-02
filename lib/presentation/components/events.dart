import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

void showCustomSnackBar(BuildContext context, String message, {int duration = 3,Color? color,IconData? icon}) {
  final dimens = AppTheme.dimensOf(context);
  final colors = AppTheme.colorsOf(context);

  final snackBarColor = color ?? colors.primary;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white, size: 20),
            SizedBox(width: dimens.small),
          ],

          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: snackBarColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dimens.small),
      ),
      margin: EdgeInsets.all(dimens.smallMedium),
      duration: Duration(seconds: duration),
    ),
  );
}