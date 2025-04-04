import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/data_source/client_provider.dart';
import 'package:food_delivery_app/core/data_source/object_response.dart';
import 'package:food_delivery_app/core/data_source/response_models.dart';
import 'package:food_delivery_app/core/dto/sign_in/sign_in_request.dart';
import 'package:food_delivery_app/core/dto/sign_in/sign_in_response.dart';
import 'package:food_delivery_app/core/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<ErrorModel, ObjectResponse<SignInResponseEntity>>> signIn(
      {required SignInRequestEntity signInRequestEntity,
      CancelToken? cancelToken}) async {
    try {
      final response = await RestClientProvider.apiClient!.signIn(
        signInRequestEntity,
        cancelToken,
      );
      //TODO: handler response models => entity
      return Right(response);
    } catch (e) {
      if (e is DioError) {
        final errorData = e.response?.data;
        final message = errorData is Map && errorData['error'] is Map
            ? errorData['error']['message']
            : e.message;

        return Left(ErrorModel(message: message ?? 'Unknown error'));
      }

      return Left(ErrorModel(message: e.toString()));
    }
  }
}
