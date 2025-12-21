import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/core/base/base_view.dart';
import 'package:flutter_ecommerce/presentation/main/home/home_bloc.dart';

import 'home_contract.dart';

class HomeScreen extends BaseScreen<HomeBloc> {
  const HomeScreen({super.key});

  @override
  List<HomeIntents> onInit() =>[GetProfile(), GetProducts()];

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listenWhen: (prev, curr) => false,
        listener: (context, state) {

        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome ${state.user?.name ?? 'User'}"),
                ElevatedButton(
                  onPressed: () => context.read<HomeBloc>().add(GetProducts()),
                  child: const Text("Load Products"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}