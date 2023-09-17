import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/config/router/app_route.dart';
import 'package:sajhasync/features/home/domain/entity/rent_entity.dart';
import 'package:sajhasync/features/home/domain/use_case/rent_use_case.dart';
import 'package:sajhasync/features/home/presentation/state/rent_state.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';

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

  Future<void> uploadFlat(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await rentUseCase.uploadFlat(file!);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (imageName) {
        state =
            state.copyWith(isLoading: false, error: null, imageName: imageName);
      },
    );
  }

  Future<void> addRentRooms(RentEntity rent, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    var data = await rentUseCase.addRentRooms(rent);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showSnackBar(message: l.error, context: context, color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        Navigator.popAndPushNamed(context, AppRoute.dashRoute);
        showSnackBar(
          message: 'Property added successfully for rent',
          context: context,
        );
      },
    );
  }
}
