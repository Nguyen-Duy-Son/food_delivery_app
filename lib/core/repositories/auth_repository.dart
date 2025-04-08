import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/data_source/object_response.dart';
import 'package:food_delivery_app/core/data_source/response_models.dart';
import 'package:food_delivery_app/core/dto/sign_in/sign_in_request.dart';
import 'package:food_delivery_app/core/dto/sign_in/sign_in_response.dart';
import 'package:food_delivery_app/core/dto/sign_up/sign_up_request.dart';
import 'package:food_delivery_app/core/dto/sign_up/sign_up_response.dart';

abstract class AuthRepository {
  Future<Either<ErrorModel, ObjectResponse<SignInResponseEntity>>> signIn({ required SignInRequestEntity signInRequestEntity,CancelToken? cancelToken});
  Future<Either<ErrorModel, ObjectResponse<SignUpResponseEntity>>> signUp({ required SignUpRequestEntity signUpRequestEntity,CancelToken? cancelToken});

}