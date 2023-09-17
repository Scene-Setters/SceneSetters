import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/profile_entity.dart';

part 'profile_api_model.g.dart';

final profileApiModelProvider = Provider<ProfileApiModel>(
  (ref) => const ProfileApiModel.empty(),
);

@JsonSerializable()
class ProfileApiModel extends Equatable {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'fullname')
  final String fullname;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'age')
  final int age;

  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;

  const ProfileApiModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.password,
    required this.age,
    required this.phoneNumber,
  });

  const ProfileApiModel.empty()
      : this(
          id: '',
          fullname: '',
          email: '',
          password: '',
          age: 0,
          phoneNumber: '',
        );

  Map<String, dynamic> toJson() => _$ProfileApiModelToJson(this);

  factory ProfileApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileApiModelFromJson(json);

  ProfileEntity toEntity() => ProfileEntity(
        id: id,
        fullname: fullname,
        email: email,
        password: password,
        age: age,
        phoneNumber: phoneNumber,
      );

  ProfileApiModel fromEntity(ProfileEntity entity) => ProfileApiModel(
        id: id,
        fullname: fullname,
        email: email,
        password: password,
        age: age,
        phoneNumber: phoneNumber,
      );

  List<ProfileEntity> toEntityList(List<ProfileApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        id,
        fullname,
        email,
        password,
        age,
        phoneNumber,
      ];
}
