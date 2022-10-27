import 'package:dartz/dartz.dart';

import '../../data/repositories/user_repo_impl.dart';

class AddToCartUseCase {
  final UserRepoImpl userRepoImpl;

  AddToCartUseCase({required this.userRepoImpl});
  Future<Unit> call({required Map<String, dynamic> productMap}) async {
    return await userRepoImpl.addToCart(productMap: productMap);
  }
}
