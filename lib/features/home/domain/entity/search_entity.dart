import 'package:equatable/equatable.dart';

import 'rent_entity.dart';

class SearchEntity extends Equatable {
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
  final Owner owner;
  final String latitude;
  final bool isPaid;
  final int viewersCount;
  final bool? isBookmarked;
  final String preference;

  const SearchEntity({
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

  SearchEntity.empty()
      : this(
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
          owner: const Owner(
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
}
