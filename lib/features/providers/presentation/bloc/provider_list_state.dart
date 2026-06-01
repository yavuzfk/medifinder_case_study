import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';

part 'provider_list_state.freezed.dart';

@freezed
sealed class ProviderListState with _$ProviderListState {
  const factory ProviderListState.initial() = ProviderListInitial;
  const factory ProviderListState.loading() = ProviderListLoading;
  const factory ProviderListState.loaded(List<Provider> providers) =
      ProviderListLoaded;
  const factory ProviderListState.empty() = ProviderListEmpty;
  const factory ProviderListState.error(String message) = ProviderListError;
}
