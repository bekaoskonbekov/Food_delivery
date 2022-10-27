import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/domain/entities/user_entity.dart';

abstract class UserRepo {
  Future<Either<Failures, UserData>> getUserData();
  Future<Either<Failures, Unit>> updateUserImage({required String imageUrl});
  Future<Unit> addToCart(
      {required Map<String, dynamic> productMap});
}
