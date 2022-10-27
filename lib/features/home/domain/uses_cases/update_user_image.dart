import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/user_repo_impl.dart';

class UpdateUserImageUseCase {
  final UserRepoImpl userRepoImpl;

  UpdateUserImageUseCase({required this.userRepoImpl});
  Future<Either<Failures, Unit>> call({required String imageUrl}) async {
    return await userRepoImpl.updateUserImage(imageUrl: imageUrl);
  }
}
