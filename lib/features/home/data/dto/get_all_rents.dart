import 'package:json_annotation/json_annotation.dart';
import 'package:sajhasync/features/home/data/model/rent_api_model.dart';

part 'get_all_rents.g.dart';

@JsonSerializable()
class GetAllRentsDTO {
  final List<RentApiModel> data;

  const GetAllRentsDTO({
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllRentsDTOToJson(this);

  factory GetAllRentsDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllRentsDTOFromJson(json);
}
