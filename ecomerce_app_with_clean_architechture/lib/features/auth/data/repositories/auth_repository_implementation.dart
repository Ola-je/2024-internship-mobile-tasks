import '../../../../core/failure/failure.dart';
import '../../../../core/network/network_info_implementation.dart';
import '../../domain/entities/auth.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/auth_repository.dart';
import '../data_sources/local_data_sources.dart';
import '../data_sources/remote_data_sources.dart';

class AuthRepositoryImplementation implements AuthRepository{
  final RemoteDataSources remoteDataSources;
  final LocalDataSources localDataSources;
  final NetworkInfo networkInfo;

  AuthRepositoryImplementation({required this.remoteDataSources, required this.localDataSources, required this.networkInfo});

  @override
Future<Either<Failure, Auth>> signIn(String email, String password) async {
  try {
    final cachedUser = await localDataSources.getCachedUser(email, password);
    return await cachedUser.fold(
      (failure) {
        return Left(Failure('error retrieving cached user ${failure.toString()}'));
      },
      (data) async {
        if (data != null) {
          return Right(data);
        } else {
          if (await networkInfo.isConnected) {
            final remoteUser = await remoteDataSources.signIn(email, password);
            return await remoteUser.fold(
              (failure) {
                return Left(Failure('Failed to sign in remotely: ${failure.toString()}'));
              },
              (userData) async {
                await localDataSources.cacheUser(userData);
                return Right(userData); // Changed from 'data' to 'userData'
              },
            );
          } else {
            return Left(Failure('Connect to a network and try again')); // Added 'Left' to return a Failure
          }
        }
      },
    );
  } catch (e) {
    return Left(Failure('Failed to sign in ${e.toString()}'));
  }
}

  @override
  Future<Either<Failure, Auth>> signUp(Auth user) async{
    try{
      if (await networkInfo.isConnected){
        final existingUser = await remoteDataSources.getUserByEmail(user.email);

        return await existingUser.fold((failure) async {
          final remoteUser = await remoteDataSources.signUp(user);

          return await remoteUser.fold(
            (failure){
              return Left(Failure('failed to register user ${failure.toString()}'));
        }, 
          (userData) async {
            await localDataSources.cacheUser(userData);
            return Right(userData);
          });
      }
      ,(userData){
        return Left(Failure('User is already registered'));
      },);
      }
      else{
        return Left(Failure('No internet connection'));
      }
    }
    catch (e){
      return Left(Failure('failed to register: ${e.toString()}'));
    }
  }

}