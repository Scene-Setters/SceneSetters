// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareApiModel _$ShareApiModelFromJson(Map<String, dynamic> json) =>
    ShareApiModel(
      title: json['title'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
      area: json['area'] as String,
      exactLocation: json['exactLocation'] as String,
      price: (json['price'] as num).toDouble(),
      capacity: json['capacity'] as int,
      amenities:
          (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      preference: json['preference'] as String,
    );

Map<String, dynamic> _$ShareApiModelToJson(ShareApiModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'city': instance.city,
      'area': instance.area,
      'exactLocation': instance.exactLocation,
      'price': instance.price,
      'capacity': instance.capacity,
      'amenities': instance.amenities,
      'photos': instance.photos,
      'preference': instance.preference,
    };
