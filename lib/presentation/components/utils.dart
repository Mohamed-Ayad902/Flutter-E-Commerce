import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class DotsIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;
  final Color selectedColor;
  final Color unselectedColor;
  final int duration;

  const DotsIndicator({
    super.key,
    required this.pageCount,
    required this.currentPage,
    required this.selectedColor,
    required this.unselectedColor,
    this.duration = 250,
  });

  @override
  Widget build(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: Duration(milliseconds: duration),
          margin: EdgeInsets.symmetric(horizontal: dimens.extraSmall / 2),
          width: isActive ? dimens.smallMedium : dimens.small,
          height: isActive ? dimens.small : dimens.extraSmall,
          decoration: BoxDecoration(
            color: isActive ? selectedColor : unselectedColor,
            borderRadius: BorderRadius.circular(dimens.medium),
          ),
        );
      }),
    );
  }
}
