import 'package:flutter_ecommerce/core/feature/profile/data/repo/profile_repo.dart';
import 'package:flutter_ecommerce/core/feature/profile/domain/repo/i_profile_repo.dart';
import 'package:flutter_ecommerce/core/feature/profile/domain/usecase/get_profile_uc.dart';
import 'package:get_it/get_it.dart';

Future<void> registerProfileModule(GetIt getIt) async {
  getIt.registerLazySingleton<IProfileRepo>(() => ProfileRepo(getIt(),getIt()));

  getIt.registerLazySingleton<GetProfileUc>(() => GetProfileUc(getIt()));
}