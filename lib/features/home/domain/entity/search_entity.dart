import 'package:equatable/equatable.dart';

import 'rent_entity.dart';

class SearchEntity extends Equatable {
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
  final Owner owner;
  final String type;
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

  SearchEntity.empty()
      : this(
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
          owner: const Owner(
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
}