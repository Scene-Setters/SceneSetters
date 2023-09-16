import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/user_entity.dart';

part 'auth_api_model.g.dart';

final authApiModelProvider = Provider<AuthApiModel>((ref) {
  return AuthApiModel(
    fullname: '',
    email: '',
    password: '',
    phone: '',
  );
});

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: 'fullname')
  final String? fullname;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'age')
  final int? age;

  AuthApiModel({
    this.fullname,
    this.email,
    this.password,
    this.phone,
    this.age,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // convert AuthApiModel to AuthEntity
  UserEntity toEntity() => UserEntity(
        fullname: fullname,
        email: email,
        password: password,
        phone: phone,
        age: age,
      );

  // Convert AuthApiModel list to AuthEntity list
  List<UserEntity> listFromJson(List<AuthApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'AuthApiModel(fullname: $fullname, email: $email, password: $password, phone: $phone, age: $age)';
  }
}
