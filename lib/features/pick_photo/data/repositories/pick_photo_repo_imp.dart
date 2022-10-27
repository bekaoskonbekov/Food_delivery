import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repository/pick_photo_repo.dart';

class PickPhotoRepoImpl extends PickPhotoRepo {
  File? imageFile;

  @override
  Future<Either<Failures, Unit>> pickImage({
    required ImageSource source,
  }) async {
    try {
      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 10);
      if (image == null) return Right(unit);
      final imageTemporary = File(image.path);
      imageFile = imageTemporary;
      return Right(unit);
    } on PlatformException catch (e) {
      //print('Failed to pick image $e');
      return Left(Failures(message: "Failed to pick image : ${e.code}"));
    }
  }

  @override
  Future<Either<Failures, String>> uploadImageToFireStore({
    required String imageName,
  }) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('users/profile_pic')
          .child(imageName + '.jpg');
      await ref.putFile(imageFile!);
      final imageUrl = await ref.getDownloadURL();
      print(imageUrl);
      return Right(imageUrl);
    } on PlatformException catch (e) {
      //print('Failed to upload the image $e');
      return Left(Failures(message: "Failed to upload the image : ${e.code}"));
    }
  }
}
