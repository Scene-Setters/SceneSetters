import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sajhasync/features/home/domain/entity/rent_entity.dart';
import 'package:sajhasync/features/home/domain/entity/search_entity.dart';

part 'search_api_model.g.dart';

final allSearchApiModelProvider = Provider<SearchApiModel>(
  (ref) => SearchApiModel.empty(),
);

@JsonSerializable()
class SearchApiModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String city;
  final String area;
  final String exactLocation;
  final double price;
  final int capacity;
  final List<String> amenities;
  final List<String> photos;
  final OwnerApiModel owner;
  final String type;
  final bool isPaid;
  final int viewersCount;
  final bool? isBookmarked;
  final String preference;

  const SearchApiModel({
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

  factory SearchApiModel.fromJson(Map<String, dynamic> json) =>
      _$SearchApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchApiModelToJson(this);

  factory SearchApiModel.empty() => const SearchApiModel(
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

  SearchEntity toEntity() => SearchEntity(
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

  SearchApiModel fromEntity(SearchEntity entity) => SearchApiModel(
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

  List<SearchEntity> toEntityList(List<SearchApiModel> models) {
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
