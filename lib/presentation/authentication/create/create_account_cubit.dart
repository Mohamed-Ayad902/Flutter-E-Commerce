import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/validation/field.dart';
import '../../../core/validation/forms_validator.dart';
import '../../../core/validation/validation.dart';
import 'create_account_contract.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountState());

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
}