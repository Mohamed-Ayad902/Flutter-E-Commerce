import 'package:flutter_ecommerce/di/storage_module.dart';
import 'package:get_it/get_it.dart';

import '../core/feature/authentication/di/auth_module.dart';
import '../core/feature/onboarding/di/onboarding_module.dart';
import '../presentation/main/bottom_nav_cubit.dart';
import 'firebase_module.dart';

final getIt = GetIt.instance;

Future<void> provideDependencies({bool autoStartGetNotes = false}) async {
  await registerStorageModule(getIt);
  await registerFirebaseModule(getIt);

  await registerOnboardingModule(getIt);
  await registerAuthenticationModule(getIt);
  getIt.registerFactory<BottomNavCubit>(() => BottomNavCubit());
}