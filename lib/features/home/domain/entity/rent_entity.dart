import 'package:equatable/equatable.dart';

class RentEntity extends Equatable {
  String title;
  String description;
  String city;
  String area;
  String exactLocation;
  double price;
  int capacity;
  List<String> amenities;
  List<String> photos;
  String preference;

  RentEntity({
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

  RentEntity.empty()
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
