import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_resources/auth_local_data_sources.dart';
import '../data_resources/auth_remote_data_sources.dart';
import '../model/user_model.dart';

class AuthRepoImp implements AuthRepo {
  final AuthLocalDataSourceImpl authLocalDataSourceImpl;
  AuthRepoImp({required this.authLocalDataSourceImpl});

// Create User Repo
  @override
  Future<Either<Failures, Unit>> createNewUser(
      String email, String password, String name) async {
    try {
      await AuthRemoteDataSourcesImpl.instance
          .createUser(email, password, name);
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(RegisterFailure.fromCode(e.code));
    }
  }

// Sign In Repo
  @override
  Future<Either<Failures, UserDataModel>> signIn(
    String email,
    String password,
  ) async {
    try {
      final signIn =
          await AuthRemoteDataSourcesImpl.instance.signIn(email, password);
      final UserDataModel user = UserDataModel(
        id: signIn.user!.uid,
        name: signIn.user!.displayName!,
        email: signIn.user!.email!,
        password: password,
        memberSince: signIn.user!.metadata.creationTime.toString(),
      );
      await authLocalDataSourceImpl.casheUserId(user.id);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(LoginFailure.fromCode(e.code));
    }
  }

// Sign Out Repo
  @override
  Future<Either<Failures, Unit>> signOut() async {
    try {
      await AuthRemoteDataSourcesImpl.instance.signOut();
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      //Todo signOutFailure
      return Left(LoginFailure.fromCode(e.code));
    }
  }
}
