import 'package:sajhasync/features/home/domain/entity/share_entity.dart';

class ShareState {
  final bool isLoading;
  final List<ShareEntity> shareFlats;
  final String? error;

  ShareState({
    required this.isLoading,
    required this.shareFlats,
    required this.error,
  });

  factory ShareState.initial() {
    return ShareState(
      isLoading: false,
      shareFlats: [],
      error: null,
    );
  }

  ShareState copyWith({
    bool? isLoading,
    final List<ShareEntity>? shareFlats,
    String? error,
  }) {
    return ShareState(
      isLoading: isLoading ?? this.isLoading,
      shareFlats: shareFlats ?? this.shareFlats,
      error: error ?? this.error,
    );
  }
}
