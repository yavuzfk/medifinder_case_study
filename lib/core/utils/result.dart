import 'package:medifinder_case_study/core/error/failure.dart';

/// Repository / usecase dönüş tipi.
/// Pattern matching ile tüketilir:
/// switch (result) {
///   case Success(:final data): ...
///   case ResultFailure(:final failure): ...
/// }
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
