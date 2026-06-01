// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProviderModel _$ProviderModelFromJson(Map<String, dynamic> json) =>
    _ProviderModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      category: json['category'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      rating: (json['rating'] as num?)?.toDouble(),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      bio: json['bio'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ProviderModelToJson(_ProviderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'category': instance.category,
      'country': instance.country,
      'city': instance.city,
      'rating': instance.rating,
      'phone': instance.phone,
      'email': instance.email,
      'website': instance.website,
      'bio': instance.bio,
      'imageUrl': instance.imageUrl,
    };
