import 'package:flutter_ecommerce/di/storage_module.dart';
import 'package:flutter_ecommerce/presentation/authentication/login/di/login_module.dart';
import 'package:get_it/get_it.dart';

import '../core/feature/onboarding/di/onboarding_module.dart';
import 'firebase_module.dart';

final getIt = GetIt.instance;

Future<void> provideDependencies({bool autoStartGetNotes = false}) async {
  await registerStorageModule(getIt);
  await registerFirebaseModule(getIt);

  await registerOnboardingModule(getIt);
  await registerLoginModule(getIt);
}