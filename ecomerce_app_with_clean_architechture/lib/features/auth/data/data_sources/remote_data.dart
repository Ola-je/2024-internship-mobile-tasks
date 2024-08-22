import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/auth.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_up.dart';

abstract class RemoteData{
  Future<Either<Failure, String>> signIn(Auth user);
  Future<Either<Failure, bool>> signUp(Auth user);
}