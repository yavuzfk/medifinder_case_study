import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_type.dart';

part 'provider_filter.freezed.dart';

@freezed
abstract class ProviderFilter with _$ProviderFilter {
  const factory ProviderFilter({
    @Default('') String query,
    ProviderType? type,
    String? country,
    String? city,
    String? category,
  }) = _ProviderFilter;
}
