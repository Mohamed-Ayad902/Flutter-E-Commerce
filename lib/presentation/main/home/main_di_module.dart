import 'package:flutter_ecommerce/presentation/main/home/home_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bottom_nav_bloc.dart';

Future<void> registerMainModule(GetIt getIt) async {
  getIt.registerFactory<BottomNavBloc>(() => BottomNavBloc());

  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt(), getIt()));
}
