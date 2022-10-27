import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/resturant_entity.dart';

abstract class ResturantRepo {
  Future<Either<Failures, List<ResturantData>>> getAllResturant();
}
