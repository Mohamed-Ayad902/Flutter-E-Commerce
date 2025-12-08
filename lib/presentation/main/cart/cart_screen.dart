import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/base/base_view.dart';
import 'package:flutter_ecommerce/presentation/main/cart/cart_cubit.dart';

class CartScreen extends BaseScreen<CartCubit> {
  const CartScreen({super.key});

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Cart Screen"),
      ),
    );
  }
}
