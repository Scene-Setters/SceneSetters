import 'package:sajhasync/features/home/domain/entity/rent_entity.dart';

class RentState {
  final bool isLoading;
  final List<RentEntity> rentRooms;
  final List<RentEntity> rentRoomsByUserId;
  final String? imageName;

  final String? error;

  RentState({
    required this.isLoading,
    required this.rentRooms,
    required this.rentRoomsByUserId,
    required this.error,
    this.imageName,
  });

  factory RentState.initial() {
    return RentState(
      isLoading: false,
      rentRooms: [],
      rentRoomsByUserId: [],
      imageName: null,
      error: null,
    );
  }

  RentState copyWith({
    bool? isLoading,
    final List<RentEntity>? rentRooms,
    final List<RentEntity>? rentRoomsByUserId,
    String? error,
    String? imageName,
  }) {
    return RentState(
      isLoading: isLoading ?? this.isLoading,
      rentRooms: rentRooms ?? this.rentRooms,
      rentRoomsByUserId: rentRoomsByUserId ?? this.rentRoomsByUserId,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
    );
  }
}
