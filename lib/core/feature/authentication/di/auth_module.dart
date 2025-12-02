import 'package:flutter_ecommerce/core/feature/authentication/domain/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../../../../presentation/authentication/create/create_account_cubit.dart';
import '../../../../presentation/authentication/login/login_cubit.dart';
import '../data/auth_repo.dart';
import '../domain/create_account_uc.dart';

Future<void> registerAuthenticationModule(GetIt getIt) async {
  getIt.registerLazySingleton<IAuthRepo>(() => AuthRepo(getIt(),getIt()));

  getIt.registerLazySingleton<CreateAccountUC>(() => CreateAccountUC(getIt()));

  getIt.registerFactory<CreateAccountCubit>(() => CreateAccountCubit(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit());

}