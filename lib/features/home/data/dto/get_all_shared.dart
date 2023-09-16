import 'package:json_annotation/json_annotation.dart';
import 'package:sajhasync/features/home/data/model/rent_api_model.dart';
import 'package:sajhasync/features/home/data/model/share_api_model.dart';

part 'get_all_shared.g.dart';

@JsonSerializable()
class GetAllSharedDTO {
  final List<ShareApiModel> data;

  const GetAllSharedDTO({
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllSharedDTOToJson(this);

  factory GetAllSharedDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllSharedDTOFromJson(json);
}
