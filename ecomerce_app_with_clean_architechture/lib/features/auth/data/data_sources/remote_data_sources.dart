import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/auth.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_up.dart';

abstract class RemoteDataSources{
  Future<Either<Failure, Auth>> signIn(String email, String password);
  Future<Either<Failure, Auth>> signUp(Auth user);
}