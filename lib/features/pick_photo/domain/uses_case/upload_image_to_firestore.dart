import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/pick_photo_repo_imp.dart';

class UploadImageToFireStorgeUseCase {
  final PickPhotoRepoImpl pickPhotoRepoImpl;

  UploadImageToFireStorgeUseCase({required this.pickPhotoRepoImpl});
  Future<Either<Failures, String>> call({required String imageName}) async {
    return await pickPhotoRepoImpl.uploadImageToFireStore(imageName: imageName);
  }
}
