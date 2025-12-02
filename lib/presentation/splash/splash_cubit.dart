import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/core/utils/logger.dart';
import '../../core/feature/onboarding/domain/usecases/get_current_user_id_usecase.dart';
import '../../core/feature/onboarding/domain/usecases/get_is_first_time_usecase.dart';
import '../../core/utils/resources.dart';
import 'splash_contract.dart';

class SplashCubit extends Cubit<SplashState> {
  final _effectController = StreamController<SplashSideEffects>.broadcast();
  final GetIsFirstTimeUC _getIsFirstTimeUC;
  final GetCurrentUserIdUsecase _getCurrentUserIdUsecase;

  Stream<SplashSideEffects> get effects => _effectController.stream;

  SplashCubit({
    required GetIsFirstTimeUC getIsFirstTimeUC,
    required GetCurrentUserIdUsecase getCurrentUserIdUsecase
  }) : _getCurrentUserIdUsecase = getCurrentUserIdUsecase, _getIsFirstTimeUC = getIsFirstTimeUC, super(SplashState()) {
    _checkNavigationFlow();
  }

  void _checkNavigationFlow() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    final isLoggedIn = await _checkIsLoggedIn();

    if (isLoggedIn) {
      _effectController.add(NavigateToHome());
      return;
    } else {

      await for (final res in _getIsFirstTimeUC.call()) {
        switch (res) {
          case Loading<bool>():
            continue;

          case Success<bool>(data: final isFirstTime):
            if (isFirstTime) {
              _effectController.add(NavigateToOnboarding());
            } else {
              _effectController.add(NavigateToLogin());
            }
            return;

          case Failure<bool>():
            _effectController.add(NavigateToLogin());
            return;
        }
      }

      // fallback in case stream closes
      _effectController.add(NavigateToLogin());
    }
  }

  Future<bool> _checkIsLoggedIn() async {
    await for (final res in _getCurrentUserIdUsecase.call()){
      switch (res){
        case Loading<String?>():
          break;
        case Success<String?>(data: final userId):
          logInfo("_checkIsLoggedIn: $userId");
          return userId != null;
        case Failure<String?>():
          return false;
      }
    }
    return false;
  }

}