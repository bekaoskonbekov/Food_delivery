import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/failure.dart';

abstract class PickPhotoRepo {
  // to pick image from gallery or camera
  Future<Either<Failures, Unit>> pickImage({required ImageSource source});

  Future<Either<Failures, String>> uploadImageToFireStore({
    required String imageName,
  });
}
