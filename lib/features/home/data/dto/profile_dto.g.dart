// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileDetials _$GetProfileDetialsFromJson(Map<String, dynamic> json) =>
    GetProfileDetials(
      data: (json['data'] as List<dynamic>)
          .map((e) => ProfileApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProfileDetialsToJson(GetProfileDetials instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
