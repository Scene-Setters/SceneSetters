import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sajhasync/features/home/domain/entity/rent_entity.dart';

part 'rent_api_model.g.dart';

final allRentApiModelProvider = Provider<RentApiModel>(
  (ref) => RentApiModel.empty(),
);

@JsonSerializable()
class RentApiModel extends Equatable {
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'city')
  final String city;

  @JsonKey(name: 'area')
  final String area;

  @JsonKey(name: 'exactLocation')
  final String exactLocation;

  @JsonKey(name: 'price')
  final double price;

  @JsonKey(name: 'capacity')
  final int capacity;

  @JsonKey(name: 'amenities')
  final List<String> amenities;

  @JsonKey(name: 'photos')
  final List<String> photos;

  @JsonKey(name: 'preference')
  final String preference;

  const RentApiModel({
    required this.title,
    required this.description,
    required this.city,
    required this.area,
    required this.exactLocation,
    required this.price,
    required this.capacity,
    required this.amenities,
    required this.photos,
    required this.preference,
  });

  factory RentApiModel.fromJson(Map<String, dynamic> json) =>
      _$RentApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentApiModelToJson(this);

  factory RentApiModel.empty() => const RentApiModel(
        title: '',
        description: '',
        city: '',
        area: '',
        exactLocation: '',
        price: 0.0,
        capacity: 0,
        amenities: [],
        photos: [],
        preference: '',
      );

  @override
  List<Object?> get props => [
        title,
        description,
        city,
        area,
        exactLocation,
        price,
        capacity,
        amenities,
        photos,
        preference,
      ];

  RentEntity toEntity() {
    return RentEntity(
      title: title,
      description: description,
      city: city,
      area: area,
      exactLocation: exactLocation,
      price: price,
      capacity: capacity,
      amenities: amenities,
      photos: photos,
      preference: preference,
    );
  }

  RentApiModel fromEntity(RentEntity entity) {
    return RentApiModel(
      title: entity.title,
      description: entity.description,
      city: entity.city,
      area: entity.area,
      exactLocation: entity.exactLocation,
      price: entity.price,
      capacity: entity.capacity,
      amenities: entity.amenities,
      photos: entity.photos,
      preference: entity.preference,
    );
  }

  List<RentEntity> toEntityList(List<RentApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
