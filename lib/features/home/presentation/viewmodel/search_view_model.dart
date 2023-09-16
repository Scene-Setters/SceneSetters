import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/domain/use_case/search_use_case.dart';
import 'package:sajhasync/features/home/presentation/state/search_state.dart';

final searchViewModelProvider =
    StateNotifierProvider<SearchViewModel, SearchState>(
  (ref) => SearchViewModel(
    ref.read(searchUseCaseProvider),
  ),
);

class SearchViewModel extends StateNotifier<SearchState> {
  final SearchUseCase searchUseCase;

  SearchViewModel(
    this.searchUseCase,
  ) : super(SearchState.initial());

  getSearchByAddress(String address) async {
    state = state.copyWith(isLoading: true);

    final result = await searchUseCase.getSearchByAddress(address);
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (searchFlats) => state = state.copyWith(
        isLoading: false,
        searchFlats: searchFlats,
        error: null,
      ),
    );
  }
}
