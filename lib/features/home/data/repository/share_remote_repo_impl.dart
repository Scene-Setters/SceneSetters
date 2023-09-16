import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/data/dataSource/share_remote_data_source.dart';
import 'package:sajhasync/features/home/domain/entity/share_entity.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/repository/share_repository.dart';

final shareRemoteRepoProvider = Provider(
  (ref) => ShareRemoteRepositoryImpl(
    shareRemoteDataSource: ref.read(shareRemoteDataSourceProvider),
  ),
);

class ShareRemoteRepositoryImpl implements ISharedRepository {
  final ShareRemoteDataSource shareRemoteDataSource;

  ShareRemoteRepositoryImpl({
    required this.shareRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<ShareEntity>>> getSharedFlats() {
    return shareRemoteDataSource.getSharedFlats();
  }

  @override
  Future<Either<Failure, List<ShareEntity>>> getSharedFlatsByUserId(String id) {
    return shareRemoteDataSource.getSharedById(id);
  }
}
