import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  @override
  List<Object?> get props => [];
}

// -------------- O N E - T I M E - E V E N T S --------------

sealed class OnboardingEffects {}

class NavigateToLogin extends OnboardingEffects {}