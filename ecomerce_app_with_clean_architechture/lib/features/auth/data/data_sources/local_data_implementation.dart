import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/auth.dart';
import 'package:dartz/dartz.dart';

import '../models/auth_model.dart';
import 'local_data.dart';

class LocalDataImplementation implements LocalData{
  final SharedPreferences sharedPreferences;

  LocalDataImplementation({required this.sharedPreferences});
  
  @override
  Future<void> clearToken() async {
    await sharedPreferences.remove('auth_token');
  }
  
  @override
  Future<String?> getToken() async {
   await sharedPreferences.getString('auth_token');
  }
  
  @override
  Future<void> saveToken(String token) async {
    await sharedPreferences.setString('auth_token', token);
  } 

}