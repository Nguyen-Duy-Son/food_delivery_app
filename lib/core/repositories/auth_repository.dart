import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/data_source/object_response.dart';
import 'package:food_delivery_app/core/data_source/response_models.dart';
import 'package:food_delivery_app/core/dto/login.dart';

abstract class AuthRepository {
  Future<Either<ErrorModel, ObjectResponse<LoginResponseModel>>> login({CancelToken? cancelToken});
}