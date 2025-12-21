import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/base/base_view.dart';
import 'package:flutter_ecommerce/presentation/main/favorite/favorite_bloc.dart';

import 'favorite_contract.dart';

class FavoriteScreen extends BaseScreen<FavoriteBloc> {
  const FavoriteScreen({super.key});

  @override
  FavoriteIntents? onInit() => null;

  @override
  Widget body(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Favorite Screen")),
    );
  }
}