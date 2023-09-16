import 'package:sajhasync/features/home/domain/entity/search_entity.dart';

class SearchState {
  final bool isLoading;
  final List<SearchEntity> searchFlats;

  final String? error;

  SearchState({
    required this.isLoading,
    required this.searchFlats,
    required this.error,
  });

  factory SearchState.initial() {
    return SearchState(
      isLoading: false,
      searchFlats: [],
      error: null,
    );
  }

  SearchState copyWith({
    bool? isLoading,
    final List<SearchEntity>? searchFlats,
    final List<SearchEntity>? searchFlatsByUserId,
    String? error,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      searchFlats: searchFlats ?? this.searchFlats,
      error: error ?? this.error,
    );
  }
}
