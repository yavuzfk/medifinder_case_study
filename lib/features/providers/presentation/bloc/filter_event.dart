import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';

part 'filter_event.freezed.dart';

@freezed
sealed class FilterEvent with _$FilterEvent {
  // initial: listeden gelen mevcut filtre (pre-population)
  const factory FilterEvent.started(ProviderFilter initial) = FilterStarted;
  const factory FilterEvent.countrySelected(String? country) =
      FilterCountrySelected;
  const factory FilterEvent.citySelected(String? city) = FilterCitySelected;
  const factory FilterEvent.categorySelected(String? category) =
      FilterCategorySelected;
  const factory FilterEvent.cleared() = FilterCleared;
}
