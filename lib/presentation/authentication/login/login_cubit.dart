import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/core/validation/validation.dart';

import '../../../core/validation/field.dart';
import '../../../core/validation/forms_validator.dart';
import 'login_contract.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
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

  void submitLogin() {
    if (!state.isLoading && _isFormsValid()) {
      emit(state.copyWith(isLoading: true));
      print("Submitting login for: ${state.email.value}");
    } else {
      print("Form is invalid, cannot submit.");
    }
  }

  bool _isFormsValid() =>
      state.email.result is Valid && state.password.result is Valid;
}