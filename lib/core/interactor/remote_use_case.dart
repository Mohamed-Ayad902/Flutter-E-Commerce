import 'dart:async';


import '../utils/resources.dart';
import 'base_use_case.dart';

abstract class UseCaseRemote<Domain, Body> extends UseCase<Domain, Body> {
  @override
  Stream<Resource<Domain>> call({Body? body, bool multipleInvoke = false}) async* {
    final controller = StreamController<Resource<Domain>>();


    if (!multipleInvoke) controller.add(Loading<Domain>());


    final stream = runStream<Domain>(execute(body), body, onResult: (r) {
      if (r is Failure<Domain>) controller.add(r);
    });


    final sub = stream.listen((domain) {
      controller.add(invokeSuccessState(domain, body));
      if (!multipleInvoke) controller.add(Loading<Domain>(loading: false));
    }, onError: (_) {});


    yield* controller.stream;


    await sub.cancel();
    await controller.close();
  }
}