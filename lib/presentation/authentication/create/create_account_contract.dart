import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/core/exceptions/exceptions.dart';

class CreateAccountState extends Equatable {
  @override
  List<Object?> get props => [];
}

// -------------- O N E - T I M E - E V E N T S --------------

sealed class CreateAccountEffects {}

class AccountCreated extends CreateAccountEffects {}
class Failure extends CreateAccountEffects {
  final CustomException exception;

  Failure(this.exception);
}