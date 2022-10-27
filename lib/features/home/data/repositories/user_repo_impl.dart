import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/data/data_resources/auth_local_data_sources.dart';
import '../../../auth/data/model/user_model.dart';
import '../../domain/repositories/user_repo.dart';
import '../data_sources/remote_user_data_sources.dart';

class UserRepoImpl extends UserRepo {
  final AuthLocalDataSourceImpl userLocalData;

  UserRepoImpl({required this.userLocalData});
  @override
  Future<Either<Failures, UserDataModel>> getUserData() async {
    try {
      final userId = userLocalData.getCasheUserId();
      final data = await UserRemoteDataSourcesImpl.instance.getUserData(userId);
      final UserDataModel user =
          UserDataModel.fromJson(data.data() as Map<String, dynamic>);
      return Right(user);
    } on FirebaseException catch (e) {
      return Left(EmptyCacheFailure(messageError: e.code));
    }
  }

  @override
  Future<Either<Failures, Unit>> updateUserImage(
      {required String imageUrl}) async {
    try {
      final userId = userLocalData.getCasheUserId();
      await UserRemoteDataSourcesImpl.instance
          .updateUserImage(imageUrl: imageUrl, userId: userId);
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(EmptyCacheFailure(messageError: e.code));
    }
  }

  @override
  Future<Unit> addToCart({
    required Map<String, dynamic> productMap,
  }) async {
    try {
      final userId = userLocalData.getCasheUserId();
      final data = await UserRemoteDataSourcesImpl.instance
          .addToCart(product: productMap, userId: userId);
      return Future.value(unit);
    } catch (e) {
      throw e;
    }
  }
}
