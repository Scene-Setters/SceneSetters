// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_search_by_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSearchByAddressDTO _$GetSearchByAddressDTOFromJson(
        Map<String, dynamic> json) =>
    GetSearchByAddressDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => SearchApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSearchByAddressDTOToJson(
        GetSearchByAddressDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
