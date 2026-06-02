import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_options.freezed.dart';

@freezed
abstract class FilterOptions with _$FilterOptions {
  const factory FilterOptions({
    required List<String> countries,
    required Map<String, List<String>> citiesByCountry,
    required List<String> categories,
  }) = _FilterOptions;
}
