import '../../../../core/failure/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecase.dart';
import '../entities/auth.dart';
import '../repositories/auth_repository.dart';
class SignUp implements UseCase<Auth, SignUpParam>{
  final AuthRepository repository;
    SignUp(this.repository);

  @override
  Future<Either<Failure, Auth>> call(SignUpParam param) async{
    return await repository.signUp(param.product);
  }
}

class SignUpParam {
  final Auth product;

  const SignUpParam(this.product);
}