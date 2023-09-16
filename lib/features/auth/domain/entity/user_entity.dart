import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? fullname;
  final String? email;
  final String? password;
  final String? phone;
  final int? age;

  const UserEntity({
    this.fullname,
    this.email,
    this.password,
    this.phone,
    this.age,
  });

  @override
  List<Object?> get props => [
        fullname,
        email,
        password,
        phone,
        age,
      ];
}
