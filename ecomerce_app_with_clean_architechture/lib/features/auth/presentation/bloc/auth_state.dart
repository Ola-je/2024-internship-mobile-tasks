part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}

final class UserSignedIn extends AuthState{
  final bool isSignedIn;
  const UserSignedIn(this.isSignedIn);
}

final class UserSignedUp extends AuthState{
  final bool isSignedUp;
  const UserSignedUp(this.isSignedUp);
}

final class ErrorState extends AuthState{
  final String message;
  const ErrorState(this.message);
}