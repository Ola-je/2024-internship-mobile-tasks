part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent{}
class AuthLoadingEvent extends AuthEvent{}

class SignUpEvent extends AuthEvent{
  Auth user;
  SignUpEvent({required this.user});
}

class SignInEvent extends AuthEvent{
  Auth user;
  SignInEvent({required this.user});
}
