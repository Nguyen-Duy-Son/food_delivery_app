import 'package:food_delivery_app/core/dto/sign_in/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponseEntity {
   String? accessToken;
   String? refreshToken;
   UserEntity? user;

  SignInResponseEntity({
    this.accessToken,
    this.refreshToken,
    this.user,
  });

  factory SignInResponseEntity.fromJson(Map<String, dynamic> json) => _$SignInResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseEntityToJson(this);
}
