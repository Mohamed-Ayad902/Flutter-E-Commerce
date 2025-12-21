import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/core/base/base_view.dart';
import 'package:flutter_ecommerce/core/extensions/context_extensions.dart';
import 'package:flutter_ecommerce/presentation/main/bottom_nav_bloc.dart';
import 'package:flutter_ecommerce/presentation/main/favorite/favorite_screen.dart';
import 'package:flutter_ecommerce/presentation/main/profile/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../assets/app_assets.dart';
import '../theme/app_theme.dart';
import 'cart/cart_screen.dart';
import 'home/home_screen.dart';

class MainScreen extends BaseScreen<BottomNavBloc> {
  const MainScreen({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget body(BuildContext context) {
    final strings = context.localization;

    return Scaffold(
      body: BlocBuilder<BottomNavBloc, int>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, currentIndex) {
          return IndexedStack(
            index: currentIndex,
            children: _screens,
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBloc, int>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, currentIndex) {
            return CustomBottomNavBar(
              currentIndex: currentIndex,
              onTap: (index) => context.read<BottomNavBloc>().add(SelectTab(index)),
              items: [
                NavBarItemData(
                  selectedIcon: AppAssets.homeFilled,
                  unselectedIcon: AppAssets.homeNotFilled,
                  label: strings.home,
                ),
                NavBarItemData(
                  selectedIcon: AppAssets.cartFilled,
                  unselectedIcon: AppAssets.cartNotFilled,
                  label: strings.myCart,
                ),
                NavBarItemData(
                  selectedIcon: AppAssets.favoriteFilled,
                  unselectedIcon: AppAssets.favoriteNotFilled,
                  label: strings.favorite,
                ),
                NavBarItemData(
                  selectedIcon: AppAssets.profileFilled,
                  unselectedIcon: AppAssets.profileNotFilled,
                  label: strings.myProfile,
                ),
              ],
            );
          }),
    );
  }

  @override
  BottomNavBlocIntents? onInit() => null;
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<NavBarItemData> items;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);
    final colors = AppTheme.colorsOf(context);
    final typo = AppTheme.textThemeOf(context);

    return Padding(
      padding: EdgeInsets.all(dimens.medium),
      child: Row(
        children: List.generate(
          items.length,
          (index) {
            final item = items[index];
            final isActive = index == currentIndex;

            return Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(dimens.medium)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(dimens.small),
                    splashColor: colors.primary.withValues(alpha: 0.2),
                    onTap: () => onTap(index),
                    child: Padding(
                      padding: EdgeInsets.all(dimens.small),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            isActive ? item.selectedIcon : item.unselectedIcon,
                            colorFilter: ColorFilter.mode(
                              isActive ? colors.primary : colors.outline,
                              BlendMode.srcIn,
                            ),
                            width: dimens.medium,
                            height: dimens.medium,
                          ),
                          Text(
                            item.label,
                            style: typo.bodySmall?.copyWith(
                              color: isActive ? colors.primary : colors.outline,
                              fontWeight: isActive
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}

class NavBarItemData {
  final String selectedIcon;
  final String unselectedIcon;
  final String label;

  const NavBarItemData({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
  });
}
