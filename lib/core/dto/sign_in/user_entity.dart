import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  String? id;
  String? email;
  String? fullName;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? role;
  bool? isVerifiedEmail;

  UserEntity({
    this.id,
    this.email,
    this.fullName,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.role,
    this.isVerifiedEmail,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
