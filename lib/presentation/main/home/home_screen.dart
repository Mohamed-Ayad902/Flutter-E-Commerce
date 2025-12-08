import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/base/base_view.dart';
import 'package:flutter_ecommerce/presentation/main/home/home_cubit.dart';

class HomeScreen extends BaseScreen<HomeCubit> {
  const HomeScreen({super.key});

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}