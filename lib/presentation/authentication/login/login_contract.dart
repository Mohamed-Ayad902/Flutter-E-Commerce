import 'package:equatable/equatable.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../core/validation/field.dart';

class LoginState extends Equatable {
  final FormField<String> email;
  final FormField<String> password;
  final bool isLoading;

  const LoginState({
    required this.email,
    required this.password,
    this.isLoading = false,
  });

  LoginState copyWith({
    FormField<String>? email,
    FormField<String>? password,
    bool? isLoading,
  }) {
    final newEmail = email ?? this.email;
    final newPassword = password ?? this.password;

    return LoginState(
      email: newEmail,
      password: newPassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [email, password, isLoading];
}

enum LoginFields {
  email,
  password,
}

// -------------- O N E - T I M E - E V E N T S --------------

sealed class LoginEffects {}

class LoginSuccess extends LoginEffects {}
class VerifyAccount extends LoginEffects {}
class Error extends LoginEffects {
  final CustomException exception;

  Error(this.exception);
}