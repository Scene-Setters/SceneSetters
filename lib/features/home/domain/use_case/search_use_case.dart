import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/domain/entity/search_entity.dart';

import '../../../../core/failure/failure.dart';
import '../repository/search_repository.dart';

final searchUseCaseProvider = Provider<SearchUseCase>(
  (ref) => SearchUseCase(
    searchdRepository: ref.read(searchRepositoryProvider),
  ),
);

class SearchUseCase {
  final ISearchRepository searchdRepository;

  SearchUseCase({
    required this.searchdRepository,
  });

  Future<Either<Failure, List<SearchEntity>>> getSearchByAddress(
      String address) async {
    return await searchdRepository.getSearchByAddress(address);
  }
}
