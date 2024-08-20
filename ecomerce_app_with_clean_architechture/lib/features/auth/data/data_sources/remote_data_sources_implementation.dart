import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../models/auth_model.dart';
import 'remote_data_sources.dart';

class RemoteDataSourcesImplementation implements RemoteDataSources{
  final http.Client client;
  final String baseUrl;

  RemoteDataSourcesImplementation({required this.client, required this.baseUrl});

  @override
  Future<Either<Failure, Auth>> signIn(String email, String password) async{
    final baseUrl = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/login';
    final response = await client.post(Uri.parse(baseUrl),
    body: {
      'email': email,
      'password': password,
    },
    );

    if (response.statusCode == 200){
      final responseBody = AuthModel.fromJson(json.decode(response.body)); 
      return Right(responseBody);
    }
    else{
      throw Left(Failure('Failed to login'));
    }
  }

  @override
  Future<Either<Failure, Auth>> signUp(Auth user) async {
    final baseUrl = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/register';
    final response = await client.post(Uri.parse(baseUrl),
    body: {
      'name': user.name,
        'email': user.email,
        'password': user.password,
    });

    if (response.statusCode == 200){
      final responseBody = AuthModel.fromJson(json.decode(response.body));
      return Right(responseBody);
    }
    else{
      throw Failure('Failed to register user');
    }
  }
  
  @override
  Future<Either<Failure, Auth>> getUserByEmail(String email) async{
    try{
      final response = await client.get(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/users?email=$email'));
      if (response.statusCode == 200){
        final userData = json.decode(response.body);

        if (userData.isNotEmpty){
          final user = AuthModel.fromJson(userData[0]);
          return Right(user);
        }
        else{
          return Left(Failure('User not found'));
        }
      }
      else{
        return Left(Failure('failed to fetch user: ${response.reasonPhrase}'));
      }
    }
    catch(e) {
      return Left(Failure('failed to fetch user: ${e.toString()}'));
    }
  }

}