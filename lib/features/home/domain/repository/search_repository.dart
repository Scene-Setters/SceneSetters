import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/data/repository/search_remote_repository.dart';
import 'package:sajhasync/features/home/domain/entity/search_entity.dart';

import '../../../../core/failure/failure.dart';

final searchRepositoryProvider = Provider<ISearchRepository>(
  (ref) {
    return ref.watch(searchRemoteRepoProvider);
  },
);

abstract class ISearchRepository {
  Future<Either<Failure, List<SearchEntity>>> getSearchByAddress(
      String address);
}
