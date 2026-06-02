import 'package:medifinder_case_study/core/error/failure.dart';

sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

final class ResultFailure<T> extends Result<T> {
  const ResultFailure(this.failure);
  final Failure failure;
}

typedef Cached<T> = ({T value, bool fromCache});
