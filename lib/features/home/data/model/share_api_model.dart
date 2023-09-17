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
  final String id;
  final String title;
  final String description;
  final String city;
  final String area;
  final String longitude;
  final double price;
  final int capacity;
  final List<String> amenities;
  final String? photos;
  final OwnerApiModel owner;
  final String latitude;
  final bool isPaid;
  final int viewersCount;
  final bool? isBookmarked;
  final String preference;

  const ShareApiModel({
    required this.id,
    required this.title,
    required this.description,
    required this.city,
    required this.area,
    required this.longitude,
    required this.price,
    required this.capacity,
    required this.amenities,
    this.photos,
    required this.owner,
    required this.latitude,
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
        longitude: '',
        price: 0.0,
        capacity: 0,
        amenities: [],
        photos: '',
        owner: OwnerApiModel(
          id: '',
          phoneNumber: '',
          fullname: '',
        ),
        latitude: '',
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
        longitude: longitude,
        price: price,
        capacity: capacity,
        amenities: amenities,
        photos: photos ?? '',
        owner: Owner(
          id: owner.id,
          phoneNumber: owner.phoneNumber,
          fullname: owner.fullname,
        ),
        latitude: latitude,
        isPaid: isPaid,
        viewersCount: viewersCount,
        isBookmarked: isBookmarked,
        preference: preference,
      );

  ShareApiModel fromEntity(ShareEntity entity) => ShareApiModel(
        id: entity.id!,
        title: entity.title,
        description: entity.description,
        city: entity.city,
        area: entity.area,
        longitude: entity.longitude,
        price: entity.price,
        capacity: entity.capacity,
        amenities: entity.amenities,
        photos: entity.photos,
        owner: OwnerApiModel(
          id: entity.owner!.id,
          phoneNumber: entity.owner!.phoneNumber,
          fullname: entity.owner!.fullname,
        ),
        latitude: entity.latitude,
        isPaid: entity.isPaid!,
        viewersCount: entity.viewersCount!,
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
        longitude,
        price,
        capacity,
        amenities,
        photos,
        owner,
        latitude,
        isPaid,
        viewersCount,
        isBookmarked,
        preference,
      ];

  List<ShareEntity> toEntityList(List<ShareApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}

@JsonSerializable()
class OwnerApiModel extends Equatable {
  final String id;
  final String phoneNumber;
  final String fullname;

  const OwnerApiModel({
    required this.id,
    required this.phoneNumber,
    required this.fullname,
  });

  factory OwnerApiModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerApiModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        phoneNumber,
        fullname,
      ];
}
