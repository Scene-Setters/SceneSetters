import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/core/network/remote/http_service.dart';
import 'package:sajhasync/core/shared_prefs/user_shared_prefs.dart';
import 'package:sajhasync/features/home/data/dto/get_search_by_address.dart';
import 'package:sajhasync/features/home/data/model/search_api_model.dart';
import 'package:sajhasync/features/home/domain/entity/search_entity.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/data/model/auth_api_model.dart';

final searchRemoteDataSourceProvider = Provider(
  (ref) => SearchRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    authApiModel: ref.read(authApiModelProvider),
    searchApiModel: ref.read(allSearchApiModelProvider),
    userSearchPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class SearchRemoteDataSource {
  final Dio dio;
  final SearchApiModel searchApiModel;
  final AuthApiModel authApiModel;
  final UserSharedPrefs userSearchPrefs;

  SearchRemoteDataSource({
    required this.dio,
    required this.authApiModel,
    required this.searchApiModel,
    required this.userSearchPrefs,
  });

  Future<Either<Failure, List<SearchEntity>>> getSearchByAddress(
      String address) async {
    try {
      String? token;
      await userSearchPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );
      String rentDetails = ApiEndpoints.getSearchByAddress;

      var response = await dio.get(
        rentDetails,
        queryParameters: {'query': address},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      print(response);

      if (response.statusCode == 200) {
        GetSearchByAddressDTO getAllRentsDTO =
            GetSearchByAddressDTO.fromJson(response.data);

        final searchEntities = searchApiModel.toEntityList(getAllRentsDTO.data);

        return Right(searchEntities);
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
