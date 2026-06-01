import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.server({String? message}) = ServerFailure;
  const factory Failure.cache({String? message}) = CacheFailure;
  const factory Failure.network({String? message}) = NetworkFailure;
  const factory Failure.notFound({String? message}) = NotFoundFailure;
  const factory Failure.unknown({String? message}) = UnknownFailure;
}
