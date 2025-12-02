import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/core/utils/resources.dart';

import '../../../core/feature/authentication/signup/domain/create_account_request.dart';
import '../../../core/feature/authentication/signup/domain/create_account_uc.dart';
import '../../../core/validation/field.dart';
import '../../../core/validation/forms_validator.dart';
import '../../../core/validation/validation.dart';
import 'create_account_contract.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final CreateAccountUC _createAccountUC;
  final _effectController = StreamController<CreateAccountEffects>.broadcast();

  Stream<CreateAccountEffects> get effects => _effectController.stream;

  CreateAccountCubit(this._createAccountUC) : super(CreateAccountState());

  void updateTextField(CreateAccountFields fieldType, String value) {
    ValidationResult result;
    FormField<String> updatedField;

    switch (fieldType) {
      case CreateAccountFields.name:
        result = FormValidators.validateName(value);
        updatedField = state.name.copyWith(value: value, result: result);
        emit(state.copyWith(name: updatedField));
        break;

      case CreateAccountFields.email:
        result = FormValidators.validateEmail(value);
        updatedField = state.email.copyWith(value: value, result: result);
        emit(state.copyWith(email: updatedField));
        break;

      case CreateAccountFields.password:
        result = FormValidators.validatePassword(value);
        updatedField = state.password.copyWith(value: value, result: result);
        emit(state.copyWith(password: updatedField));
        break;

      case CreateAccountFields.rePassword:
        result = FormValidators.validatePasswordConfirmation(state.password.value, value);
        updatedField = state.rePassword.copyWith(value: value, result: result);
        emit(state.copyWith(rePassword: updatedField));
        break;
    }
  }

  void createAccount() async {
    _validateAllFields();

    if (state.name.result is Valid &&
        state.email.result is Valid &&
        state.password.result is Valid &&
        state.rePassword.result is Valid) {
      await for (final res in _createAccountUC.call(
        body: CreateAccountRequest(
            name: state.name.value,
            email: state.email.value,
            password: state.password.value),
      )) {
        switch (res) {
          case Loading<void>():
            emit(state.copyWith(isLoading: res.loading));
            break;
          case Success<void>():
            _effectController.add(AccountCreated());
            emit(state.copyWith(
              name: state.name.copyWith(value: ""),
              email: state.email.copyWith(value: ""),
              password: state.password.copyWith(value: ""),
              rePassword: state.rePassword.copyWith(value: ""),
            ));
            break;
          case Failure<void>():
            _effectController.add(Error(res.exception));
            break;
        }
      }
    }
  }

  void _validateAllFields() {
    final nameResult = FormValidators.validateName(state.name.value);
    final emailResult = FormValidators.validateEmail(state.email.value);
    final passwordResult =
        FormValidators.validatePassword(state.password.value);
    final rePasswordResult = FormValidators.validatePasswordConfirmation(
        state.password.value, state.rePassword.value);

    emit(state.copyWith(
      name: state.name.copyWith(result: nameResult),
      email: state.email.copyWith(result: emailResult),
      password: state.password.copyWith(result: passwordResult),
      rePassword: state.rePassword.copyWith(result: rePasswordResult),
    ));
  }
}