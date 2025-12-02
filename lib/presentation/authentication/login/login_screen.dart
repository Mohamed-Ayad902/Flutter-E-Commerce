import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/assets/app_assets.dart';
import 'package:flutter_ecommerce/core/extensions/context_extensions.dart';
import 'package:flutter_ecommerce/core/extensions/error_code_extension.dart';
import 'package:flutter_ecommerce/presentation/authentication/login/login_contract.dart';

import '../../components/button.dart';
import '../../components/text_field.dart';
import '../../theme/app_theme.dart';
import 'login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);
    final colors = AppTheme.colorsOf(context);
    final typo = AppTheme.textThemeOf(context);
    final strings = context.localization;

    final cubit = BlocProvider.of<LoginCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(dimens.smallMedium),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(strings.loginAccountTitle, style: typo.titleLarge),
                  Text(strings.loginAccountSubtitle,
                      style: typo.bodyMedium?.copyWith(color: colors.outline)),
                  SizedBox(height: dimens.large),
                  AppTextField(
                    labelText: strings.emailOrPhoneNumber,
                    hintText: strings.emailOrPhoneNumber,
                    leadingIconPath: AppAssets.email,
                    controller: _emailController,
                    errorText:
                        state.email.result.localizedErrorMessage(context),
                    onChanged: (value) =>
                        cubit.updateTextField(LoginFields.email, value),
                  ),
                  SizedBox(height: dimens.medium),
                  AppTextField(
                    labelText: strings.password,
                    obscureText: true,
                    errorText:
                        state.password.result.localizedErrorMessage(context),
                    hintText: strings.createPassword,
                    leadingIconPath: AppAssets.lock,
                    controller: _passwordController,
                    onChanged: (value) =>
                        cubit.updateTextField(LoginFields.password, value),
                  ),
                  SizedBox(height: dimens.small),
                  AppTextButton(
                    text: strings.forgotPassword,
                    onPressed: () => {},
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                  SizedBox(height: dimens.mediumLarge),
                  AppButton(
                    text: strings.signIn,
                    onPressed: () => {},
                  ),
                  SizedBox(height: dimens.small),
                  AppTextButton(
                    textColor: colors.outline,
                    text: strings.dontHaveAccount,
                    onPressed: () => {},
                  ),
                  SizedBox(height: dimens.medium),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      strings.orUsingOtherMethod,
                      style: typo.bodyMedium?.copyWith(color: colors.outline),
                    ),
                  ),
                  SizedBox(height: dimens.medium),
                  AppSocialButton(
                    text: strings.signInWithGoogle,
                    iconPath: AppAssets.google,
                    onPressed: () {},
                  ),
                  SizedBox(height: dimens.small),
                  AppSocialButton(
                    text: strings.signInWithFacebook,
                    iconPath: AppAssets.facebook,
                    onPressed: () {},
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
