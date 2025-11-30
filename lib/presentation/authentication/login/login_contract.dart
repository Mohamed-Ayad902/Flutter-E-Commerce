import 'package:equatable/equatable.dart';

import '../../../core/exceptions/exceptions.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

// -------------- O N E - T I M E - E V E N T S --------------

sealed class LoginEffects {}

class AccountCreated extends LoginEffects {}
class Failure extends LoginEffects {
  final CustomException exception;

  Failure(this.exception);
}