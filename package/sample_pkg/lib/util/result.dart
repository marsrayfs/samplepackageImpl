library standalone_pkg;

abstract class Result<T> {}

class Success<T> extends Result {
  final T data;

  Success({
    required this.data,
  });
}

class SuccessNoData extends Result {}

class Failure<T> extends Result {
  final T error;

  Failure(this.error);
}
