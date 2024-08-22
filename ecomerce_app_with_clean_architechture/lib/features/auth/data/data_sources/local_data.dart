import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/auth.dart';
import '../models/auth_model.dart';

abstract class LocalData{
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}