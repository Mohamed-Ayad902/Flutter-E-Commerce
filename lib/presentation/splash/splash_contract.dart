import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
}

// -------------- O N E - T I M E - E V E N T S --------------

sealed class SplashSideEffects {}

class NavigateToLogin extends SplashSideEffects {}

class NavigateToOnboarding extends SplashSideEffects {}

class NavigateToHome extends SplashSideEffects {}

