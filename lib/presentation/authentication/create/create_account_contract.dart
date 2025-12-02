import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/core/exceptions/exceptions.dart';

import '../../../core/validation/field.dart';

class CreateAccountState extends Equatable {
  final FormField<String> name;
  final FormField<String> email;
  final FormField<String> password;
  final FormField<String> rePassword;
  final bool isLoading;

  const CreateAccountState({
    this.name = const FormField<String>(''),
    this.email = const FormField<String>(''),
    this.password = const FormField<String>(''),
    this.rePassword = const FormField<String>(''),
    this.isLoading = false,
  });

  CreateAccountState copyWith({
    FormField<String>? name,
    FormField<String>? email,
    FormField<String>? password,
    FormField<String>? rePassword,
    bool? isLoading,
  }) {
    return CreateAccountState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [name, email, password, rePassword, isLoading];
}


enum CreateAccountFields {
  name,
  email,
  password,
  rePassword,
}

// -------------- O N E - T I M E - E V E N T S --------------

sealed class CreateAccountEffects {}

class AccountCreated extends CreateAccountEffects {}
class Error extends CreateAccountEffects {
  final CustomException exception;

  Error(this.exception);
}