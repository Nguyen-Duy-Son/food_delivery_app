import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequestEntity {
  final String? email;
  final String? password;
  final String? fullName;


  SignUpRequestEntity({
    this.email,
    this.password,
    this.fullName,
  });

  factory SignUpRequestEntity.fromJson(Map<String, dynamic> json) => _$SignUpRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestEntityToJson(this);
}
