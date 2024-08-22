import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/auth.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final SignIn signIn;
  final SignUp signUp;

  AuthBloc(
   {required this.signIn, required this.signUp}
  ) : super(AuthInitial()) {

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      final Either<Failure, bool> result = await signUp.call(event.user);
    result.fold(
      (failure) => emit(ErrorState('Failed to sign a user')),
      (check) => emit(UserSignedUp(check)),
    );

    });

    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());

      final result = await signIn.call(event.user);

      result.fold(
        (failure) => emit(ErrorState('Failed to login')),
        (check) => emit(UserSignedIn(check)),
      );
    });

    on<AuthInitialEvent>((event, emit){
      emit(AuthInitial());
    });
  }
}
