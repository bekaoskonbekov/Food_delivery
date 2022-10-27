import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failures {
  final String messageError;

  EmptyCacheFailure({required this.messageError})
      : super(message: messageError);
  @override
  List<Object?> get props => [
        messageError,
      ];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class Failures implements Exception {
  final String message;

  const Failures({
    required this.message,
  });
}

class RegisterFailure extends Failures {
  const RegisterFailure(String message) : super(message: message);

  factory RegisterFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const RegisterFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const RegisterFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const RegisterFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const RegisterFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const RegisterFailure(
          'Please enter a stronger password.',
        );
      default:
        return const RegisterFailure(
          'An unknown error occurred! try again later.',
        );
    }
  }
}

class LoginFailure extends Failures {
  const LoginFailure(String message) : super(message: message);

  factory LoginFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LoginFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LoginFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LoginFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LoginFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LoginFailure(
          'An unknown error occurred! try again later.',
        );
    }
  }
}
