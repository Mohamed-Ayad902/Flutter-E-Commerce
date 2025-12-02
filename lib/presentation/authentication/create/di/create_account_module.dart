import 'package:flutter_ecommerce/presentation/authentication/create/create_account_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> registerCreateAccountModule(GetIt getIt) async {
  getIt.registerFactory<CreateAccountCubit>(() => CreateAccountCubit());
}
