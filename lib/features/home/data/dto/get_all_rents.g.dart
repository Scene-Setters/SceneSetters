// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_rents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllRentsDTO _$GetAllRentsDTOFromJson(Map<String, dynamic> json) =>
    GetAllRentsDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => RentApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllRentsDTOToJson(GetAllRentsDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
