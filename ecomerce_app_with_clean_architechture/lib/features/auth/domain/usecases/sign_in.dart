import '../../../../core/failure/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecase.dart';
import '../entities/auth.dart';
import '../repositories/auth_repository.dart';
class SignIn implements UseCase<Auth, SignInParam>{
  final AuthRepository repository;
    SignIn(this.repository);

  @override
  Future<Either<Failure, Auth>> call(SignInParam param) async{
    return await repository.signIn(param.product);
  }
}

class SignInParam {
  final Auth product;

  const SignInParam(this.product);
}