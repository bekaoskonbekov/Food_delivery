import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/auth_repo_imp.dart';

class CreateUseCase {
  CreateUseCase({required this.authRepo});
  AuthRepoImp authRepo;

  Future<Either<Failures, Unit>> call(
      String email, String password, String name) async {
    return await authRepo.createNewUser(email, password, name);
  }
}
