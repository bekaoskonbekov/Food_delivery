import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../data/repositories/user_repo_impl.dart';

class GetUserDataUsesCase {
  UserRepoImpl userRepo;
  GetUserDataUsesCase({required this.userRepo});

  Future<Either<Failures, UserData>> call() async {
    return await userRepo.getUserData();
  }
}
