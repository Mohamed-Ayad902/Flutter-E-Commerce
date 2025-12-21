import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/base/base_view.dart';
import 'package:flutter_ecommerce/presentation/main/cart/cart_bloc.dart';

import 'cart_contract.dart';

class CartScreen extends BaseScreen<CartBloc> {
  const CartScreen({super.key});

  @override
  CartIntents? onInit() => null;

  @override
  Widget body(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Cart Screen")),
    );
  }
}