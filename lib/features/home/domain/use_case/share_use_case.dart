import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/domain/entity/share_entity.dart';

import '../../../../core/failure/failure.dart';
import '../repository/share_repository.dart';

final shareUseCaseProvider = Provider<ShareUseCase>(
  (ref) => ShareUseCase(
    sharedRepository: ref.read(shareRepositoryProvider),
  ),
);

class ShareUseCase {
  final ISharedRepository sharedRepository;

  ShareUseCase({
    required this.sharedRepository,
  });

  Future<Either<Failure, List<ShareEntity>>> getSharedFlats() async {
    return await sharedRepository.getSharedFlats();
  }

  Future<Either<Failure, List<ShareEntity>>> getSharedFlatsByUserId(
      String id) async {
    return await sharedRepository.getSharedFlatsByUserId(id);
  }
}
