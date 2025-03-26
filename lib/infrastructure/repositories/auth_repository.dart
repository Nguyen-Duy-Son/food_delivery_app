import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/data_source/client_provider.dart';
import 'package:food_delivery_app/core/data_source/object_response.dart';
import 'package:food_delivery_app/core/data_source/response_models.dart';
import 'package:food_delivery_app/core/dto/login.dart';
import 'package:food_delivery_app/core/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {

  @override
  Future<Either<ErrorModel, ObjectResponse<LoginResponseModel>>> login({CancelToken? cancelToken}) async {
    try {

      final response = await RestClientProvider.apiClient!.login(
        {
          "locale": "vn",
          "password": "Abc@12345",
          "phone_number": "0914642838",
          "client_id": "nothinghere",
          "csrf": "",
          "player_id": "",
        },
        cancelToken,
      );

      //TODO: handler response models => entity
      return Right(response);
    } catch (e) {
      if (e is DioError) {
        return Left(ErrorModel(message: e.error.toString()));
      }
      return Left(ErrorModel(message: e.toString()));
    }
  }
}
