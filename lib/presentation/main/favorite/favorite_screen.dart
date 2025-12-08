import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/base/base_view.dart';
import 'package:flutter_ecommerce/presentation/main/favorite/favorite_cubit.dart';

class FavoriteScreen extends BaseScreen<FavoriteCubit> {
  const FavoriteScreen({super.key});

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Favorite Screen"),
      ),
    );
  }
}