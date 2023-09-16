// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_shared.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllSharedDTO _$GetAllSharedDTOFromJson(Map<String, dynamic> json) =>
    GetAllSharedDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => ShareApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllSharedDTOToJson(GetAllSharedDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
