import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/categories_repo.dart';
import '../entities/category_entity.dart';

class GetAllCategoriesUseCase {
  final CategoryRepoImpl categoryRepoImpl;

  GetAllCategoriesUseCase({required this.categoryRepoImpl});
  Future<Either<Failures, List<CategoryData>>> call() async {
    return await categoryRepoImpl.getCategories();
  }
}
