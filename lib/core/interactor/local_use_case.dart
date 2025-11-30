import 'dart:async';


import '../utils/resources.dart';
import 'base_use_case.dart';

abstract class UseCaseLocal<Domain, Body> extends UseCase<Domain, Body> {
  @override
  Stream<Resource<Domain>> call({Body? body, bool multipleInvoke = false}) async* {
    late StreamSubscription<Domain> sub;
    final controller = StreamController<Resource<Domain>>();


    if (!multipleInvoke) controller.add(Loading<Domain>());


    // run stream and pipe values
    final stream = runStream<Domain>(execute(body), body, onResult: (r) {
      // on failure -> push it immediately
      if (r is Failure<Domain>) controller.add(r);
    });


    sub = stream.listen((domain) {
      controller.add(invokeSuccessState(domain, body));
      if (!multipleInvoke) controller.add(Loading<Domain>(loading: false));
    }, onError: (e) {
      // already handled in runStream's transformer
    });


    yield* controller.stream;


    await sub.cancel();
    await controller.close();
  }
}