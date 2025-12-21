import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/base/base_view.dart';
import 'package:flutter_ecommerce/presentation/main/profile/profile_bloc.dart';

class ProfileScreen extends BaseScreen<ProfileBloc> {
  const ProfileScreen({super.key});

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile Screen"),
      ),
    );
  }

  @override
  onInit() => null;
}