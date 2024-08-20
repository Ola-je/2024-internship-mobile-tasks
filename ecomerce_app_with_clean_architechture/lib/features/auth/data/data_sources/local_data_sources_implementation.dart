import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/auth.dart';
import 'package:dartz/dartz.dart';

import '../models/auth_model.dart';
import 'local_data_sources.dart';

class LocalDataSourcesImplementation implements LocalDataSources{
  final SharedPreferences sharedPreferences;
  static const CACHED_USER = 'CACHED_USER';

  LocalDataSourcesImplementation({required this.sharedPreferences}); 

  @override
  Future<void> cacheUser(Auth user) async{
    final userModel = AuthModel(
      name: user.name, 
      email: user.email, 
      password: user.password);

    final userJson = userModel.toJson();
    await sharedPreferences.setString(CACHED_USER, json.encode(userJson));
  }

  @override
  Future<Either<Failure, Auth>> getCachedUser(String email, String password) async {
    try{
      final userData = await sharedPreferences.getString(CACHED_USER);
      if (userData != null){
        final Map <String, dynamic> userMap = json.decode(userData);
        var user = AuthModel.fromJson(userMap);

        if (user.email == email && user.password == password){
          return right(user);
        }
        else{
          return Left(Failure('Enter the correct credentials'));
        }

      }
      else{
        return Left(Failure('Access token not found'));
      }
    }
    catch (e){
      return Left(Failure('Failed to get user: ${e.toString()}'));
    }

  }
  
}