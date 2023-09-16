import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/data/dataSource/search_remote_data_source.dart';
import 'package:sajhasync/features/home/domain/entity/search_entity.dart';
import 'package:sajhasync/features/home/domain/repository/search_repository.dart';

import '../../../../core/failure/failure.dart';

final searchRemoteRepoProvider = Provider(
  (ref) => SearchRemoteRepositoryImpl(
    searchRemoteDataSource: ref.read(searchRemoteDataSourceProvider),
  ),
);

class SearchRemoteRepositoryImpl implements ISearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRemoteRepositoryImpl({
    required this.searchRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<SearchEntity>>> getSearchByAddress(
      String address) {
    return searchRemoteDataSource.getSearchByAddress(address);
  }
}
