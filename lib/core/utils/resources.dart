import '../exceptions/exceptions.dart';

sealed class Resource<T> {
  const Resource();
}

class Loading<T> extends Resource<T> {
  final bool loading;
  final T? partialData;
  const Loading({this.loading = true, this.partialData});
}

class Success<T> extends Resource<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Resource<T> {
  final CustomException exception;
  const Failure(this.exception);
}

// helpers
extension ResourceX<T> on Resource<T> {
  bool get isLoading => this is Loading<T> && (this as Loading<T>).loading;
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;
}