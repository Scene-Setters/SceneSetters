import 'package:sajhasync/features/home/domain/entity/rent_entity.dart';

class RentState {
  final bool isLoading;
  final List<RentEntity> rentRooms;
  final String? error;

  RentState({
    required this.isLoading,
    required this.rentRooms,
    required this.error,
  });

  factory RentState.initial() {
    return RentState(
      isLoading: false,
      rentRooms: [],
      error: null,
    );
  }

  RentState copyWith({
    bool? isLoading,
    final List<RentEntity>? rentRooms,
    String? error,
  }) {
    return RentState(
      isLoading: isLoading ?? this.isLoading,
      rentRooms: rentRooms ?? this.rentRooms,
      error: error ?? this.error,
    );
  }
}
