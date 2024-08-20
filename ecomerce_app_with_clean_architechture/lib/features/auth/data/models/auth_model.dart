
import '../../domain/entities/auth.dart';

class AuthModel extends Auth{
  const AuthModel({
    required String name,
    required String  email,
    required String password,
  }) : super(
    name: name,
    email: email,
    password: password,
  );

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    name: json['name'],
    email: json['email'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
  };

  Auth toEntity() {
    return Auth(
      name: name,
      email: email,
      password: password,
    );
  }
}