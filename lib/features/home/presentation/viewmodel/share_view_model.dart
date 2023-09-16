import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/domain/use_case/share_use_case.dart';
import 'package:sajhasync/features/home/presentation/state/share_state.dart';

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
}
