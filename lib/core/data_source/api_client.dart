import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/data_source/object_response.dart';
import 'package:food_delivery_app/core/dto/sign_in/sign_in_request.dart';
import 'package:food_delivery_app/core/dto/sign_in/sign_in_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST('/auth/login')
  Future<ObjectResponse<SignInResponseEntity>> signIn(
    @Body() SignInRequestEntity signInRequestEntity,
    @CancelRequest() CancelToken? cancelToken,
  );

  @POST('/auth/register')
  Future<ObjectResponse<SignInResponseEntity>> signUp(
      @Body() SignInRequestEntity signInRequestEntity,
      @CancelRequest() CancelToken? cancelToken,
      );


}
