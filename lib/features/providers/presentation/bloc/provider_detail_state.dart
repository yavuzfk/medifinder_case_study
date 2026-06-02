import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';

part 'provider_detail_state.freezed.dart';

@freezed
sealed class ProviderDetailState with _$ProviderDetailState {
  const factory ProviderDetailState.loading() = ProviderDetailLoading;
  const factory ProviderDetailState.error(String message) =
      ProviderDetailError;
  const factory ProviderDetailState.loaded(
    Provider provider, {
    @Default(false) bool fromCache,
  }) = ProviderDetailLoaded;
}
