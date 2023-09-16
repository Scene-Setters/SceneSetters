import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sajhasync/features/home/domain/entity/share_entity.dart';

part 'share_api_model.g.dart';

final allShareApiModelProvider = Provider<ShareApiModel>(
  (ref) => ShareApiModel.empty(),
);

@JsonSerializable()
class ShareApiModel extends Equatable {
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

  const ShareApiModel({
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

  factory ShareApiModel.fromJson(Map<String, dynamic> json) =>
      _$ShareApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShareApiModelToJson(this);

  factory ShareApiModel.empty() => const ShareApiModel(
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

  ShareEntity toEntity() {
    return ShareEntity(
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

  ShareApiModel fromEntity(ShareEntity entity) {
    return ShareApiModel(
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

  List<ShareEntity> toEntityList(List<ShareApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
