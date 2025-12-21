import 'package:equatable/equatable.dart';

class ProfileState extends Equatable{
  @override
  List<Object?> get props => [];

}

// -------------- U S E R - I N T E N T S --------------

abstract class ProfileIntents {}

class GetProfile implements ProfileIntents {}

// -------------- O N E - T I M E - E V E N T S --------------

sealed class ProfileEffects {}
