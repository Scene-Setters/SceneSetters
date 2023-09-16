import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sajhasync/features/home/data/model/rent_api_model.dart';
import 'package:sajhasync/features/home/domain/entity/share_entity.dart';

import '../../domain/entity/rent_entity.dart';

part 'share_api_model.g.dart';

final allShareApiModelProvider = Provider<ShareApiModel>(
  (ref) => ShareApiModel.empty(),
);

@JsonSerializable()
class ShareApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;

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

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'isPaid')
  final bool isPaid;

  @JsonKey(name: 'viewersCount')
  final int viewersCount;

  @JsonKey(name: 'isBookmarked')
  final bool? isBookmarked;

  @JsonKey(name: 'preference')
  final String preference;

  @JsonKey(name: 'owner')
  final OwnerApiModel owner; // Include the owner property here

  const ShareApiModel({
    required this.id,
    required this.title,
    required this.description,
    required this.city,
    required this.area,
    required this.exactLocation,
    required this.price,
    required this.capacity,
    required this.amenities,
    required this.photos,
    required this.owner,
    required this.type,
    required this.isPaid,
    required this.viewersCount,
    this.isBookmarked,
    required this.preference,
  });

  factory ShareApiModel.fromJson(Map<String, dynamic> json) =>
      _$ShareApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShareApiModelToJson(this);

  factory ShareApiModel.empty() => const ShareApiModel(
        id: '',
        title: '',
        description: '',
        city: '',
        area: '',
        exactLocation: '',
        price: 0.0,
        capacity: 0,
        amenities: [],
        photos: [],
        owner: OwnerApiModel(
          id: '',
          phoneNumber: '',
          fullname: '',
        ),
        type: '',
        isPaid: false,
        viewersCount: 0,
        isBookmarked: false,
        preference: '',
      );

  ShareEntity toEntity() => ShareEntity(
        id: id,
        title: title,
        description: description,
        city: city,
        area: area,
        exactLocation: exactLocation,
        price: price,
        capacity: capacity,
        amenities: amenities,
        photos: photos,
        owner: Owner(
          id: owner.id,
          phoneNumber: owner.phoneNumber,
          fullname: owner.fullname,
        ),
        type: type,
        isPaid: isPaid,
        viewersCount: viewersCount,
        isBookmarked: isBookmarked,
        preference: preference,
      );

  ShareApiModel fromEntity(ShareEntity entity) => ShareApiModel(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        city: entity.city,
        area: entity.area,
        exactLocation: entity.exactLocation,
        price: entity.price,
        capacity: entity.capacity,
        amenities: entity.amenities,
        photos: entity.photos,
        owner: OwnerApiModel(
          id: entity.owner.id,
          phoneNumber: entity.owner.phoneNumber,
          fullname: entity.owner.fullname,
        ),
        type: entity.type,
        isPaid: entity.isPaid,
        viewersCount: entity.viewersCount,
        isBookmarked: entity.isBookmarked,
        preference: entity.preference,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        city,
        area,
        exactLocation,
        price,
        capacity,
        amenities,
        photos,
        owner,
        type,
        isPaid,
        viewersCount,
        isBookmarked,
        preference,
      ];

  List<ShareEntity> toEntityList(List<ShareApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
