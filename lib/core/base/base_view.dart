import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/app_modules.dart';

abstract class BaseScreen<T extends Cubit<dynamic>> extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (_) => getIt<T>(),
      child: body(context),
    );
  }

  Widget body(BuildContext context);
}
