import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/data/dataSource/rent_remote_data_source.dart';
import 'package:sajhasync/features/home/domain/entity/rent_entity.dart';
import 'package:sajhasync/features/home/domain/repository/rent_repository.dart';

import '../../../../core/failure/failure.dart';

final rentRemoteRepoProvider = Provider(
  (ref) => RentRemoteRepositoryImpl(
    rentremoteDataSource: ref.read(rentRemoteDataSourceProvider),
  ),
);

class RentRemoteRepositoryImpl implements IRentRepository {
  final RentRemoteDataSource rentremoteDataSource;

  RentRemoteRepositoryImpl({
    required this.rentremoteDataSource,
  });

  @override
  Future<Either<Failure, List<RentEntity>>> getRentedFlats() {
    return rentremoteDataSource.getRentedFlats();
  }

  @override
  Future<Either<Failure, List<RentEntity>>> getRentedFlatsByUserId(String id) {
    return rentremoteDataSource.getRentsById(id);
  }

  @override
  Future<Either<Failure, bool>> visitRooms(String id) {
    return rentremoteDataSource.visitRoom(id);
  }

  @override
  Future<Either<Failure, bool>> addRentRooms(RentEntity rent) {
    return rentremoteDataSource.addRentRooms(rent);
  }

  @override
  Future<Either<Failure, String>> uploadFlat(File file) {
    return rentremoteDataSource.uploadFlat(file);
  }
}
