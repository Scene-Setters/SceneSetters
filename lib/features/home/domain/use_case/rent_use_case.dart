import 'package:dartz/dartz.dart';
import 'package:sajhasync/features/home/domain/entity/rent_entity.dart';
import 'package:sajhasync/features/home/domain/repository/rent_repository.dart';

import '../../../../core/failure/failure.dart';

class RentUseCase {
  final IRentRepository rentRepository;

  RentUseCase({
    required this.rentRepository,
  });

  Future<Either<Failure, List<RentEntity>>> getRentedFlats() async {
    return await rentRepository.getRentedFlats();
  }
}
