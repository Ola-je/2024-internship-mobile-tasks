import '../../../../core/failure/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecase.dart';
import '../entities/auth.dart';
import '../repositories/auth_repository.dart';
class SignUp{
  final AuthRepository repository;
    SignUp({required this.repository});

  @override
  Future<Either<Failure, bool>> call(Auth user) async{
    return await repository.signUp(user);
  }
}