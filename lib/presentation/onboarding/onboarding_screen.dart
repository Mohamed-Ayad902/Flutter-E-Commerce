import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/core/extensions/context_extensions.dart';

import '../../core/feature/onboarding/domain/models/onboarding_page_data.dart';
import '../../di/app_modules.dart';
import '../authentication/create/create_account_cubit.dart';
import '../authentication/create/create_account_screen.dart';
import '../authentication/login/login_cubit.dart';
import '../authentication/login/login_screen.dart';
import '../components/button.dart';
import '../components/utils.dart';
import '../onboarding/onboarding_cubit.dart';
import '../theme/app_theme.dart';
import '../theme/window_size_class.dart';
import 'onboarding_contract.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  StreamSubscription? _effectsSub;

  void _navigateToCreateAccount() {
    context.read<OnboardingCubit>().finishOnboarding();

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
    context.read<OnboardingCubit>().finishOnboarding();

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
  void initState() {
    super.initState();
    _pageController = PageController();
    _effectsSub = context.read<OnboardingCubit>().effects.listen((eff) {
      switch (eff) {
        case NavigateToLogin():
          if (!mounted) return;
          // here we should navigate to signup login screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => BlocProvider<OnboardingCubit>(
                create: (_) => getIt<OnboardingCubit>(),
                child: OnboardingScreen(),
              ),
            ),
          );
          return;
      }
    });
  }

  @override
  void dispose() {
    _effectsSub?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget _content(PageData data) {
    final dimens = AppTheme.dimensOf(context);
    final colors = AppTheme.colorsOf(context);
    final typo = AppTheme.textThemeOf(context);
    final orientation = AppTheme.orientationOf(context);

    switch (orientation) {
      case OrientationMode.portrait:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(dimens.large),
              child: Image.asset(
                data.imagePath,
                height: dimens.unexpected * 2,
                width: dimens.unexpected + dimens.massive,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: dimens.medium),
            Text(
              data.title,
              style: typo.headlineMedium?.copyWith(color: colors.onSurface),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: dimens.small),
            Text(
              data.description,
              style: typo.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ],
        );
      case OrientationMode.landscape:
        return Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(dimens.small),
                child: Image.asset(
                  data.imagePath,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: dimens.medium),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title,
                      style: typo.headlineMedium
                          ?.copyWith(color: colors.onSurface)),
                  SizedBox(height: dimens.small),
                  Text(data.description,
                      style: typo.bodyMedium
                          ?.copyWith(color: colors.onSurfaceVariant)),
                ],
              ),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);
    final colors = AppTheme.colorsOf(context);
    final strings = context.localization;
    final onboardingPages = context.onboardingPages;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(dimens.small),
          child: Column(
            children: [
              Expanded(
                child: Positioned.fill(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingPages.length,
                    onPageChanged: (page) =>
                        setState(() => _currentPage = page),
                    itemBuilder: (context, index) {
                      final data = onboardingPages[index];
                      return _content(data);
                    },
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DotsIndicator(
                    pageCount: onboardingPages.length,
                    currentPage: _currentPage,
                    selectedColor: colors.primary,
                    unselectedColor: colors.onSurface.withValues(alpha: 0.2),
                  ),
                  SizedBox(height: dimens.medium),
                  AppButton(
                    text: strings.createAccount,
                    onPressed: () => _navigateToCreateAccount(),
                  ),
                  SizedBox(height: dimens.extraSmall),
                  AppTextButton(
                    text: strings.alreadyHaveAccount,
                    onPressed: () => _navigateToLogin(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
