import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/assets/app_assets.dart';
import 'package:flutter_ecommerce/core/base/base_view.dart';
import 'package:flutter_ecommerce/presentation/main/home/home_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../theme/app_theme.dart';
import 'home_contract.dart';

class HomeScreen extends BaseScreen<HomeBloc> {
  const HomeScreen({super.key});

  @override
  List<HomeIntents> onInit() =>[GetProfile(), GetProducts()];

  @override
  Widget body(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);
    final colors = AppTheme.colorsOf(context);
    final typo = AppTheme.textThemeOf(context);
    final strings = context.localization;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(dimens.smallMedium),
        child: Scaffold(
          body: BlocListener<HomeBloc, HomeState>(
            listenWhen: (prev, curr) => false,
            listener: (context, state) {},
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _profileSection(context, state),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<HomeBloc>().add(GetProducts()),
                      child: const Text("Load Products"),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget _profileSection(BuildContext context, HomeState state) {
  final dimens = AppTheme.dimensOf(context);
  final colors = AppTheme.colorsOf(context);
  final typo = AppTheme.textThemeOf(context);
  final strings = context.localization;

  return Row(
    children: [
      CircleAvatar(
        radius: dimens.medium,
        backgroundImage: AssetImage(AppAssets.books),
      ),
      SizedBox(width: dimens.small),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.welcomeUser(state.user?.name.split(' ').first ?? ''),
            style: typo.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            strings.goShopping,
            style: typo.bodyMedium?.copyWith(color: colors.outline),
          ),
        ],
      ),
      const Spacer(),
      SvgPicture.asset(AppAssets.search),
      SizedBox(width: dimens.small),
      SvgPicture.asset(AppAssets.notifications),
    ],
  );
}