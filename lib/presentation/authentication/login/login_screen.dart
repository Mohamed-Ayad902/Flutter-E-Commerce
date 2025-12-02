import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/assets/app_assets.dart';
import 'package:flutter_ecommerce/core/extensions/context_extensions.dart';
import 'package:flutter_ecommerce/core/extensions/error_code_extension.dart';
import 'package:flutter_ecommerce/presentation/authentication/create/create_account_cubit.dart';
import 'package:flutter_ecommerce/presentation/authentication/create/create_account_screen.dart';
import 'package:flutter_ecommerce/presentation/authentication/login/login_contract.dart';
import 'package:flutter_ecommerce/presentation/theme/window_size_class.dart';

import '../../../di/app_modules.dart';
import '../../components/button.dart';
import '../../components/text_field.dart';
import '../../theme/app_theme.dart';
import '../common/common_widgets.dart';
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
    final strings = context.localization;

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
                    headerSection(
                      context,
                      strings.loginAccountTitle,
                      strings.loginAccountSubtitle,
                    ),
                    SizedBox(height: dimens.large),
                    _textFieldsSection(
                      context: context,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      state: state,
                      cubit: cubit,
                    ),
                    SizedBox(height: dimens.small),
                    AppTextButton(
                      text: strings.forgotPassword,
                      onPressed: () {},
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                    SizedBox(height: dimens.mediumLarge),
                    AppButton(
                      text: strings.signIn,
                      onPressed: cubit.submitLogin,
                    ),
                    SizedBox(height: dimens.small),
                    _signUp(context),
                    SizedBox(height: dimens.medium),
                    orDividerText(context),
                    SizedBox(height: dimens.medium),
                    socialLoginSection(context),
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

Widget _textFieldsSection({
  required BuildContext context,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required LoginState state,
  required LoginCubit cubit,
}) {
  final dimens = AppTheme.dimensOf(context);
  final strings = context.localization;
  final orientation = AppTheme.orientationOf(context);

  final emailField = AppTextField(
    labelText: strings.emailAddress,
    hintText: strings.enterEmailAddress,
    leadingIconPath: AppAssets.email,
    controller: emailController,
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

Widget _signUp(BuildContext context) {
  final colors = AppTheme.colorsOf(context);
  final strings = context.localization;
  return AppTextButton(
    textColor: colors.outline,
    text: strings.dontHaveAccount,
    onPressed: () => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider<CreateAccountCubit>(
          create: (_) => getIt<CreateAccountCubit>(),
          child: CreateAccountScreen(),
        ),
      ),
    ),
  );
}