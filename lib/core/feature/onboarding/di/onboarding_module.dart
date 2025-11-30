import 'package:get_it/get_it.dart';

import '../../../../presentation/onboarding/onboarding_cubit.dart';
import '../../../../presentation/splash/splash_cubit.dart';
import '../../../storage/storage_file.dart';
import '../data/repository/onboarding_repo.dart';
import '../domain/repository/i_onboarding_repo.dart';
import '../domain/usecases/change_is_first_time_usecase.dart';
import '../domain/usecases/get_current_user_id_usecase.dart';
import '../domain/usecases/get_is_first_time_usecase.dart';

Future<void> registerOnboardingModule(GetIt getIt) async {
  getIt.registerLazySingleton<IOnboardingRepo>(() => OnboardingRepo(getIt<IStorageKeyValueFile>(),getIt()));

  getIt.registerLazySingleton<GetIsFirstTimeUC>(() => GetIsFirstTimeUC(getIt()));
  getIt.registerLazySingleton<ChangeIsFirstTimeUC>(() => ChangeIsFirstTimeUC(getIt()));
  getIt.registerLazySingleton<GetCurrentUserIdUsecase>(() => GetCurrentUserIdUsecase(getIt()));

  getIt.registerFactory<SplashCubit>(() => SplashCubit(
    getIsFirstTimeUC: getIt(),
    getCurrentUserIdUsecase: getIt(),
  ));

  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit(
    changeIsFirstTimeUC: getIt(),
  ));
}