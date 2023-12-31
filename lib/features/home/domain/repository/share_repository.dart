import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/domain/entity/share_entity.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/share_remote_repo_impl.dart';

final shareRepositoryProvider = Provider<ISharedRepository>(
  (ref) {
    return ref.watch(shareRemoteRepoProvider);
  },
);

abstract class ISharedRepository {
  Future<Either<Failure, List<ShareEntity>>> getSharedFlats();
  Future<Either<Failure, List<ShareEntity>>> getSharedFlatsByUserId(String id);
  Future<Either<Failure, bool>> addFlatRooms(ShareEntity share);
  Future<Either<Failure, String>> uploadFlat(File file);
}
