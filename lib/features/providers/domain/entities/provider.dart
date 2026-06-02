import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_type.dart';

part 'provider.freezed.dart';

@freezed
abstract class Provider with _$Provider {
  const factory Provider({
    required String id,
    required String name,
    required ProviderType type,
    required String category,
    required String country,
    required String city,
    double? rating,
    String? phone,
    String? email,
    String? website,
    String? bio,
    String? imageUrl,
  }) = _Provider;
}
