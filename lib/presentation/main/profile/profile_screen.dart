import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/base/base_view.dart';
import 'package:flutter_ecommerce/presentation/main/profile/profile_cubit.dart';

class ProfileScreen extends BaseScreen<ProfileCubit> {
  const ProfileScreen({super.key});

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile Screen"),
      ),
    );
  }
}