import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponseEntity {
  final String? message;


  SignUpResponseEntity({
    this.message,
  });

  factory SignUpResponseEntity.fromJson(Map<String, dynamic> json) => _$SignUpResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseEntityToJson(this);
}
