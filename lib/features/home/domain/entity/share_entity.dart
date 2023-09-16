import 'package:equatable/equatable.dart';

class ShareEntity extends Equatable {
  final String title;
  final String description;
  final String city;
  final String area;
  final String exactLocation;
  final double price;
  final int capacity;
  final List<String> amenities;
  final List<String> photos;
  final String preference;

  const ShareEntity({
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

  ShareEntity.empty()
      : this(
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
}
