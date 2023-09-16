import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/domain/entity/rent_entity.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/rent_remote_repo_impl.dart';

final rentRepositoryProvider = Provider<IRentRepository>(
  (ref) {
    return ref.watch(rentRemoteRepoProvider);
  },
);

abstract class IRentRepository {
  Future<Either<Failure, List<RentEntity>>> getRentedFlats();
  Future<Either<Failure, List<RentEntity>>> getRentedFlatsByUserId(String id);
  Future<Either<Failure, bool>> visitRooms(String id);
}
