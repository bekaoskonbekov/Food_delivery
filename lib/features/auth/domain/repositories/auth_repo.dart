import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, Unit>> createNewUser(
      String email, String password, String name);
  Future<Either<Failures, UserData>> signIn(String email, String password);
  Future<Either<Failures, Unit>> signOut();
}
