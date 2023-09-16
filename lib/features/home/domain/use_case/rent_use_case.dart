import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/domain/entity/rent_entity.dart';
import 'package:sajhasync/features/home/domain/repository/rent_repository.dart';

import '../../../../core/failure/failure.dart';

final rentUseCaseProvider = Provider<RentUseCase>(
  (ref) => RentUseCase(
    rentRepository: ref.read(rentRepositoryProvider),
  ),
);

class RentUseCase {
  final IRentRepository rentRepository;

  RentUseCase({
    required this.rentRepository,
  });

  Future<Either<Failure, List<RentEntity>>> getRentedFlats() async {
    return await rentRepository.getRentedFlats();
  }

  Future<Either<Failure, List<RentEntity>>> getRentedFlatsByUserId(
      String id) async {
    return await rentRepository.getRentedFlatsByUserId(id);
  }

  Future<Either<Failure, bool>> visitRooms(String id) async {
    return await rentRepository.visitRooms(id);
  }
}
