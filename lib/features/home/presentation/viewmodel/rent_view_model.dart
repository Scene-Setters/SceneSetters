import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/domain/use_case/rent_use_case.dart';
import 'package:sajhasync/features/home/presentation/state/rent_state.dart';

final rentViewModelProvider = StateNotifierProvider<RentViewModel, RentState>(
  (ref) => RentViewModel(
    ref.read(rentUseCaseProvider),
  ),
);

class RentViewModel extends StateNotifier<RentState> {
  final RentUseCase rentUseCase;

  RentViewModel(
    this.rentUseCase,
  ) : super(RentState.initial());

  getRentedFlats() async {
    state = state.copyWith(isLoading: true);

    final result = await rentUseCase.getRentedFlats();
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (rentRooms) => state = state.copyWith(
        isLoading: false,
        rentRooms: rentRooms,
        error: null,
      ),
    );
  }

  getRentedFlatsById(String id) async {
    state = state.copyWith(isLoading: true);

    final result = await rentUseCase.getRentedFlatsByUserId(id);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (rentRoomsByUserId) => state = state.copyWith(
        isLoading: false,
        rentRoomsByUserId: rentRoomsByUserId,
        error: null,
      ),
    );
  }

  visitRooms(String id) async {
    state = state.copyWith(isLoading: true);

    final result = await rentUseCase.visitRooms(id);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (data) => state = state.copyWith(
        isLoading: false,
        error: null,
      ),
    );
  }
}
