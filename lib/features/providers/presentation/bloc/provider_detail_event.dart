import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_detail_event.freezed.dart';

@freezed
sealed class ProviderDetailEvent with _$ProviderDetailEvent {
  const factory ProviderDetailEvent.started(String id) = ProviderDetailStarted;
  const factory ProviderDetailEvent.retried() = ProviderDetailRetried;
}
