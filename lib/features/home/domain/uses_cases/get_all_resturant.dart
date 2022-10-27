import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/resturant_repo.dart';
import '../entities/resturant_entity.dart';

class GetAllResturantsUseCase {
  final ResturantRepoImpl resturantRepoImpl;

  GetAllResturantsUseCase({required this.resturantRepoImpl});

  Future<Either<Failures, List<ResturantData>>> call() async {
    return await resturantRepoImpl.getAllResturant();
  }
}
