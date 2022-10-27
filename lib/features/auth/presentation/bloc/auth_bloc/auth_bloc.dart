import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/uses_case/create_user.dart';
import '../../../domain/uses_case/sign_in_user.dart';
import '../../../domain/uses_case/sign_out_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CreateUseCase createUseCase;
  final SignInUseCase signInUseCase;
  final SignOutUseCase signOutUseCase;
  AuthBloc({
    required this.createUseCase,
    required this.signInUseCase,
    required this.signOutUseCase,
  }) : super(AuthInit()) {
    on<AuthEvent>((event, emit) async {
      if (event is CreateUserEvent) {
        emit(AuthLoading());
        final newUser =
            await createUseCase(event.email, event.password, event.name);
        newUser.fold(
            (failure) => emit(
                  ErrorCreateOrSignInUserState(
                    failure.message,
                  ),
                ),
            (r) => emit(SuccessCreateOrSignInUserState()));
      } else if (event is SignInUserEvent) {
        emit(AuthLoading());
        final user = await signInUseCase(event.email, event.password);
        emit(_emitFailureOrSucces(user));
      } else if (event is SignOutEvent) {
        await signOutUseCase();
        emit(AuthLoading());

        emit(SignOutState());
      }
    });
  }

  AuthState _emitFailureOrSucces(Either<Failures, UserData> user) {
    return user.fold(
        (failure) => ErrorCreateOrSignInUserState(
              failure.message,
            ),
        (user) => SuccessCreateOrSignInUserState());
  }
}
