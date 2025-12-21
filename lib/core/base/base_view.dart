import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/app_modules.dart';

abstract class BaseScreen<T extends Bloc<dynamic, dynamic>> extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      // to trigger initial intents we add ..
      create: (_) {
        final bloc = getIt<T>();
        final intent = onInit();

        if (intent is List) {
          for (var event in intent) {
            bloc.add(event);
          }
        } else if (intent != null) {
          bloc.add(intent);
        }

        return bloc;
      },
      child: body(context),
    );
  }

  // to return the starting Intent
  dynamic onInit();

  Widget body(BuildContext context);
}
