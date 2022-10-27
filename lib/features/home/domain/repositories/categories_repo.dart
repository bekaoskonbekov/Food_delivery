import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/category_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failures, List<CategoryDataModel>>> getCategories();
}
