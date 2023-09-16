import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/core/network/remote/http_service.dart';
import 'package:sajhasync/features/home/data/dto/get_all_rents.dart';
import 'package:sajhasync/features/home/data/model/rent_api_model.dart';
import 'package:sajhasync/features/home/domain/entity/rent_entity.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../../auth/data/model/auth_api_model.dart';

final rentRemoteDataSourceProvider = Provider(
  (ref) => RentRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    authApiModel: ref.read(authApiModelProvider),
    rentApiModel: ref.read(allRentApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class RentRemoteDataSource {
  final Dio dio;
  final RentApiModel rentApiModel;
  final AuthApiModel authApiModel;
  final UserSharedPrefs userSharedPrefs;

  RentRemoteDataSource({
    required this.dio,
    required this.authApiModel,
    required this.rentApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, List<RentEntity>>> getRentedFlats() async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );
      var response = await dio.get(
        ApiEndpoints.getRentedRooms,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        GetAllRentsDTO getAllRentsDTO = GetAllRentsDTO.fromJson(response.data);

        final rentEntities = rentApiModel.toEntityList(getAllRentsDTO.data);

        return Right(rentEntities);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }
}
