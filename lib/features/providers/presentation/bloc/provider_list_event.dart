import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';

part 'provider_list_event.freezed.dart';

@freezed
sealed class ProviderListEvent with _$ProviderListEvent {
  const factory ProviderListEvent.started() = ProviderListStarted;
  const factory ProviderListEvent.searchChanged(String query) =
      ProviderListSearchChanged;
  const factory ProviderListEvent.filterChanged(ProviderFilter filter) =
      ProviderListFilterChanged;
  const factory ProviderListEvent.refreshed() = ProviderListRefreshed;
}
