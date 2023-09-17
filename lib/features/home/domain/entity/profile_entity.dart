import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String id;
  final String fullname;
  final String email;
  final String password;

  final int age;
  final String phoneNumber;

  const ProfileEntity({
    required this.id,
    required this.fullname,
    required this.email,
    required this.password,
    required this.age,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        id,
        fullname,
        email,
        password,
        age,
        phoneNumber,
      ];

  factory ProfileEntity.fromJson(Map<String, dynamic> json) => ProfileEntity(
        id: json['id'],
        fullname: json['fullname'],
        email: json['email'],
        password: json['password'],
        age: json['age'],
        phoneNumber: json['phoneNumber'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'fullname': fullname,
        'email': email,
        'password': password,
        'age': age,
        'phoneNumber': phoneNumber,
      };

  const ProfileEntity.empty()
      : this(
          id: '',
          fullname: '',
          email: '',
          password: '',
          age: 0,
          phoneNumber: '',
        );
}
