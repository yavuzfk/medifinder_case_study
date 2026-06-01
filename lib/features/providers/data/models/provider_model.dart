import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_type.dart';

part 'provider_model.freezed.dart';
part 'provider_model.g.dart';

@freezed
abstract class ProviderModel with _$ProviderModel {
  const factory ProviderModel({
    required String id,
    required String name,
    required String type, // JSON'da string; entity'de enum'a map'lenir
    required String category,
    required String country,
    required String city,
    double? rating,
    String? phone,
    String? email,
    String? website,
    String? bio,
    String? imageUrl,
  }) = _ProviderModel;

  // metot eklediğimiz için zorunlu (freezed 3.x)
  const ProviderModel._();

  factory ProviderModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderModelFromJson(json);

  Provider toEntity() => Provider(
        id: id,
        name: name,
        type: _parseType(type),
        category: category,
        country: country,
        city: city,
        rating: rating,
        phone: phone,
        email: email,
        website: website,
        bio: bio,
        imageUrl: imageUrl,
      );
}

ProviderType _parseType(String value) => switch (value) {
      'clinic' => ProviderType.clinic,
      'hospital' => ProviderType.hospital,
      _ => ProviderType.doctor,
    };
