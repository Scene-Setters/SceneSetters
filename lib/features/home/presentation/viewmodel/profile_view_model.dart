import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_case/profile_use_case.dart';
import '../state/profile_state.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>(
  (ref) => ProfileViewModel(
    ref.read(profileUseCaseProvider),
  ),
);

class ProfileViewModel extends StateNotifier<ProfileState> {
  final ProfileUseCase profileUseCase;

  ProfileViewModel(this.profileUseCase) : super(ProfileState.initial()) {
    getUserProfile();
  }

  void resetState() {
    state = ProfileState.initial();
  }

  Future<void> getUserProfile() async {
    state = state.copyWith(isLoading: true);

    final result = await profileUseCase.getUserProfile();
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (user) => state = state.copyWith(
        isLoading: false,
        user: user,
        error: null,
      ),
    );
  }

  void fetchUserProfile() {
    getUserProfile();
  }
}
