import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request.g.dart';

@JsonSerializable()
class SignInRequestEntity {
  final String? email;
  final String? password;

  SignInRequestEntity({
    this.email,
    this.password,
  });

  factory SignInRequestEntity.fromJson(Map<String, dynamic> json) => _$SignInRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestEntityToJson(this);
}
