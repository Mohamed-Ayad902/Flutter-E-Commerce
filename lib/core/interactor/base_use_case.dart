import 'dart:async';

import '../exceptions/exception_mapper.dart';
import '../exceptions/exceptions.dart';
import '../utils/resources.dart';

/// Base UseCase that exposes a Stream<Resource<Domain>> and centralizes
/// error mapping via ExceptionMapper.map(...)
abstract class UseCase<Domain, Body> {
  /// Returns a stream of Resource<Domain>
  Stream<Resource<Domain>> call({Body? body, bool multipleInvoke = false});

  /// Optionally used when you want to listen with a callback
  void invokeWithCallback(void Function(Resource<Domain>) onResult,
      {Body? body, bool multipleInvoke = false}) {
    call(body: body, multipleInvoke: multipleInvoke).listen(onResult);
  }

  Stream<Domain> execute(Body? body);

  Resource<Domain>? validateResponseModel(Domain domain, Body? body) => null;

  Resource<Domain>? validateFailureResponse(CustomException exception, Body? body) => null;

  /// Default Success wrapper (can be overridden by validateResponseModel)
  Resource<Domain> invokeSuccessState(Domain domain, Body? body) {
    return validateResponseModel(domain, body) ?? Success(domain);
  }

  Resource<Domain> _invokeFailureState(CustomException exception, Body? body) {
    return validateFailureResponse(exception, body) ?? Failure(exception);
  }

  /// runStream centralizes error handling for all use cases
  ///
  /// It maps thrown errors to a [CustomException] via [ExceptionMapper.map], notifies the caller
  /// via [onResult], emits a Loading(false) to stop any loading UI, then rethrows the mapped
  /// error on the transformed stream.
  Stream<T> runStream<T>(Stream<T> requestExecution, Body? body,
      {required void Function(Resource<Domain>) onResult}) {
    final transformer = StreamTransformer<T, T>.fromHandlers(
      handleError: (error, stack, sink) {
        final instaException = error is CustomException
            ? error
            : ExceptionMapper.map(error, stack);

        onResult(_invokeFailureState(instaException, body));
        onResult(Loading(loading: false));
        sink.addError(instaException, stack);
      },
    );

    return requestExecution.transform(transformer);
  }
}