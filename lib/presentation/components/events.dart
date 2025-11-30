import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

void showCustomSnackBar(BuildContext context,String message, Color color, IconData icon) {
  final dimens = AppTheme.dimensOf(context);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          SizedBox(width: dimens.small),
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
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dimens.small),
      ),
      margin: EdgeInsets.all(dimens.smallMedium),
      duration: const Duration(seconds: 3),
    ),
  );
}