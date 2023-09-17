import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/core/network/remote/http_service.dart';
import 'package:sajhasync/features/home/data/dto/get_all_shared.dart';
import 'package:sajhasync/features/home/data/model/share_api_model.dart';
import 'package:sajhasync/features/home/domain/entity/share_entity.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../../auth/data/model/auth_api_model.dart';

final shareRemoteDataSourceProvider = Provider(
  (ref) => ShareRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    authApiModel: ref.read(authApiModelProvider),
    shareApiModel: ref.read(allShareApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class ShareRemoteDataSource {
  final Dio dio;
  final ShareApiModel shareApiModel;
  final AuthApiModel authApiModel;
  final UserSharedPrefs userSharedPrefs;

  ShareRemoteDataSource({
    required this.dio,
    required this.authApiModel,
    required this.shareApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, List<ShareEntity>>> getSharedFlats() async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );
      var response = await dio.get(
        ApiEndpoints.getSharedRooms,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        GetAllSharedDTO getAllSharedDTO =
            GetAllSharedDTO.fromJson(response.data);

        final shareEntities = shareApiModel.toEntityList(getAllSharedDTO.data);

        return Right(shareEntities);
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

  Future<Either<Failure, List<ShareEntity>>> getSharedById(String id) async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );
      String shareDetails = '${ApiEndpoints.getAllPostsById}/$id';

      var response = await dio.get(
        shareDetails,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        GetAllSharedDTO getAllRentsDTO =
            GetAllSharedDTO.fromJson(response.data);

        final shareEntities = shareApiModel.toEntityList(getAllRentsDTO.data);

        return Right(shareEntities);
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

  Future<Either<Failure, bool>> addSharedRooms(ShareEntity share) async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r),
          );

      var response = await dio.post(
        ApiEndpoints.postSharedRooms,
        data: {
          "title": share.title,
          "description": share.description,
          "city": share.city,
          "area": share.area,
          "longitude": share.longitude,
          "latitude": share.latitude,
          "price": share.price,
          "capacity": share.capacity,
          "amenities": share.amenities,
          "preference": share.preference,
          "photo": share.photos,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, String>> uploadFlat(
    File image,
  ) async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'photo': await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
        },
      );

      Response response = await dio.post(
        ApiEndpoints.uploadFlatCover,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return Right(response.data["data"]);
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}
