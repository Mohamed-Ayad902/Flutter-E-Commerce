import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/core/feature/authentication/domain/login_uc.dart';
import 'package:flutter_ecommerce/core/utils/resources.dart';
import 'package:flutter_ecommerce/core/validation/validation.dart';

import '../../../core/feature/authentication/domain/login_request.dart';
import '../../../core/validation/field.dart';
import '../../../core/validation/forms_validator.dart';
import 'login_contract.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUc _loginUc;
  final _effectController = StreamController<LoginEffects>.broadcast();
  Stream<LoginEffects> get effects => _effectController.stream;

  LoginCubit(this._loginUc)
      : super(LoginState(
          email: FormField<String>(''),
          password: FormField<String>(''),
        ));

  void updateTextField(LoginFields fieldType, String value) {
    ValidationResult result;
    FormField<String> updatedField;

    switch (fieldType) {
      case LoginFields.email:
        result = FormValidators.validateEmail(value);
        updatedField = state.email.copyWith(value: value, result: result);
        emit(state.copyWith(email: updatedField));
        break;

      case LoginFields.password:
        result = FormValidators.validatePassword(value);
        updatedField = state.password.copyWith(value: value, result: result);
        emit(state.copyWith(password: updatedField));
        break;
    }
  }

  void login() async {
    _validateAllFields();

    if (!state.isLoading && _isFormsValid()) {
      await for (final res in _loginUc.call(body: LoginRequest(state.email.value,state.password.value))){
        switch(res){
          case Loading<bool>():
            emit(state.copyWith(isLoading: res.loading));
            break;
          case Success<bool>():
            _effectController.add(res.data ? LoginSuccess() : VerifyAccount());
            break;
          case Failure<bool>():
            _effectController.add(Error(res.exception));
            break;
        }
      }
    }
  }

  void _validateAllFields() {
    final emailResult = FormValidators.validateEmail(state.email.value);
    final passwordResult =
    FormValidators.validatePassword(state.password.value);

    emit(state.copyWith(
      email: state.email.copyWith(result: emailResult),
      password: state.password.copyWith(result: passwordResult),
    ));
  }

  bool _isFormsValid() =>
      state.email.result is Valid && state.password.result is Valid;
}