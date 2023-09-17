import 'package:sajhasync/features/home/domain/entity/share_entity.dart';

class ShareState {
  final bool isLoading;
  final List<ShareEntity> shareFlats;
  final List<ShareEntity> shareFlatsByUserId;
  final String? error;
  final String? imageName;

  ShareState({
    required this.isLoading,
    required this.shareFlats,
    required this.shareFlatsByUserId,
    required this.error,
    this.imageName,
  });

  factory ShareState.initial() {
    return ShareState(
      isLoading: false,
      shareFlats: [],
      shareFlatsByUserId: [],
      error: null,
      imageName: null,
    );
  }

  ShareState copyWith({
    bool? isLoading,
    final List<ShareEntity>? shareFlats,
    final List<ShareEntity>? shareFlatsByUserId,
    String? error,
    String? imageName,
  }) {
    return ShareState(
      isLoading: isLoading ?? this.isLoading,
      shareFlats: shareFlats ?? this.shareFlats,
      shareFlatsByUserId: shareFlatsByUserId ?? this.shareFlatsByUserId,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
    );
  }
}
