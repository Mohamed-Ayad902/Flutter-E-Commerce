import 'package:flutter_ecommerce/di/storage_module.dart';
import 'package:get_it/get_it.dart';

import '../core/feature/onboarding/di/onboarding_module.dart';
import 'firebase_module.dart';

final getIt = GetIt.instance;

Future<void> provideDependencies({bool autoStartGetNotes = false}) async {
  await registerStorageModule(getIt);
  await registerOnboardingModule(getIt);
  await registerFirebaseModule(getIt);
}