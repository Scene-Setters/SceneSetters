import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/domain/entity/share_entity.dart';
import 'package:sajhasync/features/home/domain/use_case/share_use_case.dart';
import 'package:sajhasync/features/home/presentation/state/share_state.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/my_snackbar.dart';

final shareViewModelProvider =
    StateNotifierProvider<ShareViewModel, ShareState>(
  (ref) => ShareViewModel(
    ref.read(shareUseCaseProvider),
  ),
);

class ShareViewModel extends StateNotifier<ShareState> {
  final ShareUseCase shareUseCase;

  ShareViewModel(
    this.shareUseCase,
  ) : super(ShareState.initial());

  getSharedFlats() async {
    state = state.copyWith(isLoading: true);

    final result = await shareUseCase.getSharedFlats();
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (shareFlats) => state = state.copyWith(
        isLoading: false,
        shareFlats: shareFlats,
        error: null,
      ),
    );
  }

  getSharedFlatsById(String id) async {
    state = state.copyWith(isLoading: true);

    final result = await shareUseCase.getSharedFlatsByUserId(id);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (shareFlatsByUserId) => state = state.copyWith(
        isLoading: false,
        shareFlatsByUserId: shareFlatsByUserId,
        error: null,
      ),
    );
  }

  Future<void> uploadFlat(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await shareUseCase.uploadFlat(file!);
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

  Future<void> addShareRooms(ShareEntity share, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    var data = await shareUseCase.addFlatRooms(share);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showSnackBar(message: l.error, context: context, color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        Navigator.popAndPushNamed(context, AppRoute.dashRoute);
        showSnackBar(
          message: 'Property added successfully for share',
          context: context,
        );
      },
    );
  }
}
