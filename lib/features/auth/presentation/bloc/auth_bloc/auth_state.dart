part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInit extends AuthState {}

class AuthLoading extends AuthState {}

class SuccessCreateOrSignInUserState extends AuthState {}

class ErrorCreateOrSignInUserState extends AuthState {
  final String message;

  const ErrorCreateOrSignInUserState(this.message);

  @override
  List<Object> get props => [message];
}

class SignOutState extends AuthState {}
