import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/auth.dart';
import '../models/auth_model.dart';

abstract class LocalDataSources{
  Future<Either<Failure, Auth>> getCachedUser(String email, String password);
  Future<void> cacheUser(AuthModel user);
}