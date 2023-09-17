// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareApiModel _$ShareApiModelFromJson(Map<String, dynamic> json) =>
    ShareApiModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
      area: json['area'] as String,
      longitude: json['longitude'] as String,
      price: (json['price'] as num).toDouble(),
      capacity: json['capacity'] as int,
      amenities:
          (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
      photos: json['photos'] as String?,
      owner: OwnerApiModel.fromJson(json['owner'] as Map<String, dynamic>),
      latitude: json['latitude'] as String,
      isPaid: json['isPaid'] as bool,
      viewersCount: json['viewersCount'] as int,
      isBookmarked: json['isBookmarked'] as bool?,
      preference: json['preference'] as String,
    );

Map<String, dynamic> _$ShareApiModelToJson(ShareApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'city': instance.city,
      'area': instance.area,
      'longitude': instance.longitude,
      'price': instance.price,
      'capacity': instance.capacity,
      'amenities': instance.amenities,
      'photos': instance.photos,
      'owner': instance.owner,
      'latitude': instance.latitude,
      'isPaid': instance.isPaid,
      'viewersCount': instance.viewersCount,
      'isBookmarked': instance.isBookmarked,
      'preference': instance.preference,
    };

OwnerApiModel _$OwnerApiModelFromJson(Map<String, dynamic> json) =>
    OwnerApiModel(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String,
      fullname: json['fullname'] as String,
    );

Map<String, dynamic> _$OwnerApiModelToJson(OwnerApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'fullname': instance.fullname,
    };
