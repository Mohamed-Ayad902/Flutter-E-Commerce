import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/core/extensions/context_extensions.dart';
import 'package:flutter_ecommerce/presentation/authentication/create/create_account_screen.dart';
import 'package:flutter_ecommerce/presentation/authentication/login/login_cubit.dart';
import 'package:flutter_ecommerce/presentation/authentication/login/login_screen.dart';
import 'package:flutter_ecommerce/presentation/splash/splash_contract.dart';
import 'package:flutter_ecommerce/presentation/splash/splash_cubit.dart';

import '../../di/app_modules.dart';
import '../authentication/create/create_account_cubit.dart';
import '../onboarding/onboarding_cubit.dart';
import '../onboarding/onboarding_screen.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription<SplashSideEffects>? _effectsSubscription;

  @override
  void initState() {
    super.initState();
    _effectsSubscription = context.read<SplashCubit>().effects.listen(_handleEffects);
  }

  @override
  void dispose() {
    _effectsSubscription?.cancel();
    super.dispose();
  }

  void _handleEffects(SplashSideEffects effect) {
    if (!mounted) return;

    switch (effect) {
      case NavigateToLogin():
        _navigateToLogin();
        return;
      case NavigateToOnboarding():
        _navigateToOnboarding();
        return;
      case NavigateToHome():
        _navigateToHome();
        return;
    }
  }

  void _navigateToOnboarding() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => BlocProvider<OnboardingCubit>(
          create: (_) => getIt<OnboardingCubit>(),
          child: OnboardingScreen(),
        ),
      ),
    );
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => BlocProvider<CreateAccountCubit>(
          create: (_) => getIt<CreateAccountCubit>(),
          child: CreateAccountScreen(),
        ),
      ),
    );
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => BlocProvider<LoginCubit>(
          create: (_) => getIt<LoginCubit>(),
          child: LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);
    final colors = AppTheme.colorsOf(context);
    final typo = AppTheme.textThemeOf(context);
    final strings = context.localization;

    return Scaffold(
      backgroundColor: colors.primary,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  strings.appName,
                  style: typo.displayMedium?.copyWith(color: Colors.white),
                ),
                Text(
                  strings.appTitle,
                  style: typo.bodyMedium?.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: dimens.smallMedium),
              child: Text(
                strings.appVersion,
                style: typo.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
