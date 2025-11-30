import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/presentation/onboarding/onboarding_contract.dart';

import '../../core/feature/onboarding/domain/usecases/change_is_first_time_usecase.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final _effectController = StreamController<OnboardingEffects>.broadcast();
  final ChangeIsFirstTimeUC changeIsFirstTimeUC;

  Stream<OnboardingEffects> get effects => _effectController.stream;

  OnboardingCubit({required this.changeIsFirstTimeUC}) : super(OnboardingState());

  void finishOnboarding() async {
    await for (final res in changeIsFirstTimeUC.call()) {}
  }
}
