import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/auth.dart';
import '../usecases/sign_in.dart';

abstract class AuthRepository{
  Future<Either<Failure, bool>> signIn(Auth user);
  Future<Either<Failure, bool>> signUp(Auth user);
  Future<void> logout();
  Future<Either<Failure, String?>> getToken();
}