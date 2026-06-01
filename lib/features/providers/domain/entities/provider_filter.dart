import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_filter.freezed.dart';

/// Arama sorgusu + aktif filtreler tek state'te yaşar ve birlikte uygulanır.
@freezed
abstract class ProviderFilter with _$ProviderFilter {
  const factory ProviderFilter({
    @Default('') String query,
    String? country,
    String? city,
    String? category,
  }) = _ProviderFilter;
}
