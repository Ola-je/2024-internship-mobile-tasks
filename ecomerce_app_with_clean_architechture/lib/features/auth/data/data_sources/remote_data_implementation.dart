import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import '../../../../core/constatnts/urls/url.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/auth.dart';
import '../models/auth_model.dart';
import 'remote_data.dart';

class RemoteDataImplementation implements RemoteData {
  final http.Client client;

  RemoteDataImplementation({required this.client});

  @override
  Future<Either<Failure, String>> signIn(Auth user) async {
    final url = Uri.parse(Url.Login());
    try {
      final response = await client.post(
        url,
        body: {
          'email': user.email,
          'password': user.password,
        },
      );

      if (response.statusCode == 201) {
        final responseBody = json.decode(response.body);
        final userToken = responseBody['data']['access_token'];

        return Right(userToken);
      } else {
        return Left(Failure('Failed to login: ${response.reasonPhrase}'));
      }
    } catch (e) {
      return Left(Failure('Failed to login: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> signUp(Auth user) async {
    final url = Uri.parse(Url.SignUp());
    try {
      final response = await client.post(
        url,
        body: jsonEncode({
          'name': user.name,
          'email': user.email,
          'password': user.password,
        },),

        headers: {'Content-Type': 'application/json'},
      );

        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        
        return const Right(true);
      } else {
        print('from remote ');
        return Left(Failure('Failed to register user: ${response.reasonPhrase}'));
      }
    } catch (e) {
      return Left(Failure('Failed to register user: ${e.toString()}'));
    }
  }

}