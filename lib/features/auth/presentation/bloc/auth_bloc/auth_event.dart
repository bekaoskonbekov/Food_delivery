part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends AuthEvent {
  final String email;
  final String name;
  final String password;

  const CreateUserEvent(this.email, this.password, this.name);
  @override
  List<Object> get props => [email, password, name];
}

class SignInUserEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInUserEvent(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}

class SignOutEvent extends AuthEvent{}
