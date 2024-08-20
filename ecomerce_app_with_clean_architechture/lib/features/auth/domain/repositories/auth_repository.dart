import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/auth.dart';
import '../usecases/sign_in.dart';

abstract class AuthRepository{
  Future<Either<Failure, Auth>> signIn(Auth auth);
  Future<Either<Failure, Auth>> signUp(Auth auth);
}