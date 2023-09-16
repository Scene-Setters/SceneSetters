import 'package:json_annotation/json_annotation.dart';
import 'package:sajhasync/features/home/data/model/search_api_model.dart';

part 'get_search_by_address.g.dart';

@JsonSerializable()
class GetSearchByAddressDTO {
  final List<SearchApiModel> data;

  const GetSearchByAddressDTO({
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetSearchByAddressDTOToJson(this);

  factory GetSearchByAddressDTO.fromJson(Map<String, dynamic> json) =>
      _$GetSearchByAddressDTOFromJson(json);
}
