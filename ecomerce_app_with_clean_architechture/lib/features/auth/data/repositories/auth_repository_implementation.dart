import '../../../../core/failure/failure.dart';
import '../../../../core/network/network_info_implementation.dart';
import '../../domain/entities/auth.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/auth_repository.dart';
import '../data_sources/local_data.dart';
import '../data_sources/remote_data.dart';

class AuthRepositoryImplementation implements AuthRepository{
  final RemoteData remoteData;
  final LocalData localData;
  final NetworkInfo networkInfo;

  AuthRepositoryImplementation({required this.remoteData, required this.localData, required this.networkInfo});

@override
Future<Either<Failure, bool>> signIn(Auth user) async {

  if (await networkInfo.isConnected) {
    final remoteUser = await remoteData.signIn(user);
    bool value = false;

    remoteUser.fold(
      (failure) {
        return Left(Failure('Failed to get token: ${failure.toString()}'));
      },
      (token) {
        if (token.isEmpty){
          value = false;
        }
        else{
          localData.saveToken(token);
          value=true;
        }
      });
      return Right(value);
  }
  else{
    return Left(Failure('No internet connection'));
  }

}

@override
Future<Either<Failure, bool>> signUp(Auth user) async {
  if (await networkInfo.isConnected) {
    return remoteData.signUp(user);
  }
  else{
    return Left(Failure('No internet connection'));
  }
}


  @override
  Future<Either<Failure, String?>> getToken() async {
    final token = await localData.getToken();
    if (token != null) {
      return Right(token);
    } else {
      return Left(Failure('No token found'));
    }
  }
  
  @override
  Future<void> logout() async {
    await localData.clearToken();
  }



  // @override
  // Future<Either<Failure, String>> signUp(Auth user) async{
  //   try{
  //     if (await networkInfo.isConnected){
  //       var tokenResult = await remoteData.signIn(user.email, user.password);
  //       return await tokenResult.fold(
  //         (failure) async{
  //           return Left(Failure('User has not registered'));
  //         },
  //         (token) async{
  //           var userData = await remoteData.getUser(token);
  //           return await userData.fold(
  //             (failure){
  //               return Left(Failure('User has not register'));
  //           }, 
  //           (data) async{
  //             await localData.cacheUser(data);
  //             return Right(userData);
  //           }) 

  //         })
          
    //     final existingUser = await remoteData.getUser();

    //     return await existingUser.fold((failure) async {
    //       final remoteUser = await remoteData.signUp(user);

    //       return await remoteUser.fold(
    //         (failure){
    //           return Left(Failure('failed to register user ${failure.toString()}'));
    //     }, 
    //       (userData) async {
            // await localData.cacheUser(userData);
            // return Right(userData);
    //       });
    //   }
    //   ,(userData){
    //     return Left(Failure('User is already registered'));
    //   },);
    //   }
    //   else{
  //   //     return Left(Failure('No internet connection'));
  //     }
  //     }
  //   catch (e){
  //     return Left(Failure('failed to register: ${e.toString()}'));
  //   }
  // }

}