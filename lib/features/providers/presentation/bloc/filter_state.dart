import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/filter_options.dart';

part 'filter_state.freezed.dart';

@freezed
sealed class FilterState with _$FilterState {
  const factory FilterState.loading() = FilterLoading;
  const factory FilterState.error(String message) = FilterError;
  const factory FilterState.ready({
    required FilterOptions options,
    String? country,
    String? city,
    String? category,
  }) = FilterReady;
}
