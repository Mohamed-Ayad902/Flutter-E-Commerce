import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/core/extensions/context_extensions.dart';
import 'package:flutter_ecommerce/core/extensions/error_code_extension.dart';
import 'package:flutter_ecommerce/presentation/authentication/create/create_account_contract.dart';
import 'package:flutter_ecommerce/presentation/authentication/create/create_account_cubit.dart';

import '../../../assets/app_assets.dart';
import '../../components/button.dart';
import '../../components/text_field.dart';
import '../../theme/app_theme.dart';
import '../../theme/window_size_class.dart';
import '../common/common_widgets.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);
    final cubit = BlocProvider.of<CreateAccountCubit>(context);
    final strings = context.localization;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(dimens.smallMedium),
          child: SingleChildScrollView(
            child: BlocBuilder<CreateAccountCubit, CreateAccountState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerSection(context, strings.createAccount,
                        strings.startShoppingAfterAccount),
                    SizedBox(height: dimens.large),
                    _TextFieldsSection(
                      nameController: _nameController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      rePasswordController: _rePasswordController,
                      state: state,
                      cubit: cubit,
                    ),
                    SizedBox(height: dimens.extraLarge),
                    AppButton(
                      text: strings.createAccount,
                      onPressed: () {},
                    ),
                    SizedBox(height: dimens.medium),
                    orDividerText(context),
                    SizedBox(height: dimens.medium),
                    socialLoginSection(context,isLogin: false)
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

class _TextFieldsSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final CreateAccountState state;
  final CreateAccountCubit cubit;

  const _TextFieldsSection({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.rePasswordController,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final dimens = AppTheme.dimensOf(context);
    final strings = context.localization;
    final orientation = AppTheme.orientationOf(context);

    final nameField = AppTextField(
      labelText: strings.username,
      hintText: strings.createUsername,
      leadingIconPath: AppAssets.profile,
      controller: nameController,
      errorText: state.name.result.localizedErrorMessage(context),
      onChanged: (value) =>
          cubit.updateTextField(CreateAccountFields.name, value),
    );

    final emailField = AppTextField(
      labelText: strings.emailAddress,
      hintText: strings.enterEmailAddress,
      leadingIconPath: AppAssets.email,
      controller: emailController,
      errorText: state.email.result.localizedErrorMessage(context),
      onChanged: (value) =>
          cubit.updateTextField(CreateAccountFields.email, value),
    );

    final passwordField = AppTextField(
      labelText: strings.password,
      obscureText: true,
      errorText: state.password.result.localizedErrorMessage(context),
      hintText: strings.createPassword,
      leadingIconPath: AppAssets.lock,
      controller: passwordController,
      onChanged: (value) =>
          cubit.updateTextField(CreateAccountFields.password, value),
    );

    final rePasswordField = AppTextField(
      labelText: strings.rePassword,
      obscureText: true,
      errorText: state.rePassword.result.localizedErrorMessage(context),
      hintText: strings.rePasswordConfirm,
      leadingIconPath: AppAssets.lock,
      controller: rePasswordController,
      onChanged: (value) =>
          cubit.updateTextField(CreateAccountFields.rePassword, value),
    );

    if (orientation == OrientationMode.portrait) {
      return Column(
        children: [
          nameField,
          SizedBox(height: dimens.medium),
          emailField,
          SizedBox(height: dimens.medium),
          passwordField,
          SizedBox(height: dimens.medium),
          rePasswordField,
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: nameField),
              SizedBox(width: dimens.medium),
              Expanded(child: emailField),
            ],
          ),
          SizedBox(height: dimens.medium),
          Row(
            children: [
              Expanded(child: passwordField),
              SizedBox(width: dimens.medium),
              Expanded(child: rePasswordField),
            ],
          )
        ],
      );
    }
  }
}
