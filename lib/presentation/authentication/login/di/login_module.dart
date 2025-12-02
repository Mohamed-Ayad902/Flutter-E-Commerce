import 'package:flutter_ecommerce/presentation/authentication/login/login_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> registerLoginModule(GetIt getIt) async {
  getIt.registerFactory<LoginCubit>(() => LoginCubit());
}
