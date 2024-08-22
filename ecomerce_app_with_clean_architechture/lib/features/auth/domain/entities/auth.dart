import 'package:equatable/equatable.dart';

class Auth extends Equatable{
  final String name;
  final String email;
  final String password;

  const Auth({
    required this.name,
    required this.email,
    required this.password,
  });
  
  @override
  List<Object?> get props => [name, email, password];

  //  Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //   };
  // }

  // AuthModel toModel() {
  //   return AuthModel(
  //     name: name,
  //     email: email,
  //     password: password,
  //   );
  // }

}