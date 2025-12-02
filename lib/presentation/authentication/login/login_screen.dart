import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/assets/app_assets.dart';
import 'package:flutter_ecommerce/core/extensions/context_extensions.dart';
import 'package:flutter_ecommerce/core/extensions/error_code_extension.dart';
import 'package:flutter_ecommerce/presentation/authentication/login/login_contract.dart';
import 'package:flutter_ecommerce/presentation/theme/window_size_class.dart';

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
    final cubit = BlocProvider.of<LoginCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(dimens.smallMedium),
          child: SingleChildScrollView(
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderSection(),
                    SizedBox(height: dimens.large),
                    TextFieldsSection(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      state: state,
                      cubit: cubit,
                    ),
                    SizedBox(height: dimens.small),
                    const ForgotPasswordButton(),
                    SizedBox(height: dimens.mediumLarge),
                    const SignInButton(),
                    SizedBox(height: dimens.small),
                    const SignUpPrompt(),
                    SizedBox(height: dimens.medium),
                    const OrDividerText(),
                    SizedBox(height: dimens.medium),
                    const SocialLoginSection(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}


class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);
    final colors = AppTheme.colorsOf(context);
    final typo = AppTheme.textThemeOf(context);
    final strings = context.localization;
    final orientation = AppTheme.orientationOf(context);

    final title = Text(strings.loginAccountTitle, style: typo.titleLarge);
    final subtitle = Text(
      strings.loginAccountSubtitle,
      style: typo.bodyMedium?.copyWith(color: colors.outline),
    );

    if (orientation == OrientationMode.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          title,
          Padding(
            padding: EdgeInsets.only(left: dimens.small),
            child: subtitle,
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, subtitle],
      );
    }
  }
}

class TextFieldsSection extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginState state;
  final LoginCubit cubit;

  const TextFieldsSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);
    final strings = context.localization;
    final orientation = AppTheme.orientationOf(context);

    final emailField = AppTextField(
      labelText: strings.emailOrPhoneNumber,
      hintText: strings.emailOrPhoneNumber,
      leadingIconPath: AppAssets.email,
      controller: emailController,
      // `context` is used here for localization extension methods
      errorText: state.email.result.localizedErrorMessage(context),
      onChanged: (value) => cubit.updateTextField(LoginFields.email, value),
    );

    final passwordField = AppTextField(
      labelText: strings.password,
      obscureText: true,
      errorText: state.password.result.localizedErrorMessage(context),
      hintText: strings.createPassword,
      leadingIconPath: AppAssets.lock,
      controller: passwordController,
      onChanged: (value) => cubit.updateTextField(LoginFields.password, value),
    );

    if (orientation == OrientationMode.portrait) {
      return Column(
        children: [
          emailField,
          SizedBox(height: dimens.medium),
          passwordField,
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(child: emailField),
          SizedBox(width: dimens.medium),
          Expanded(child: passwordField),
        ],
      );
    }
  }
}

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.localization;
    return AppTextButton(
      text: strings.forgotPassword,
      onPressed: () => {},
      alignment: AlignmentDirectional.centerEnd,
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.localization;
    return AppButton(
      text: strings.signIn,
      onPressed: () => {},
    );
  }
}

class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.colorsOf(context);
    final strings = context.localization;
    return AppTextButton(
      textColor: colors.outline,
      text: strings.dontHaveAccount,
      onPressed: () => {},
    );
  }
}

class OrDividerText extends StatelessWidget {
  const OrDividerText({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.colorsOf(context);
    final typo = AppTheme.textThemeOf(context);
    final strings = context.localization;

    return Align(
      alignment: Alignment.center,
      child: Text(
        strings.orUsingOtherMethod,
        style: typo.bodyMedium?.copyWith(color: colors.outline),
      ),
    );
  }
}

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);
    final strings = context.localization;
    final orientation = AppTheme.orientationOf(context);

    final googleButton = AppSocialButton(
      text: strings.signInWithGoogle,
      iconPath: AppAssets.google,
      onPressed: () {},
    );
    final facebookButton = AppSocialButton(
      text: strings.signInWithFacebook,
      iconPath: AppAssets.facebook,
      onPressed: () {},
    );

    if (orientation == OrientationMode.portrait) {
      return Column(
        children: [
          googleButton,
          SizedBox(height: dimens.small),
          facebookButton,
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(child: googleButton),
          SizedBox(width: dimens.small),
          Expanded(child: facebookButton),
        ],
      );
    }
  }
}
