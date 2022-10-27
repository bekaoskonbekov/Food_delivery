import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/categories_repo.dart';
import '../data_sources/remote_products_data_sources.dart';
import '../models/category_model.dart';

class CategoryRepoImpl extends CategoriesRepo {
  CategoryRepoImpl();

  @override
  Future<Either<Failures, List<CategoryDataModel>>> getCategories() async {
    try {
      final List<CategoryDataModel> categories = [];
      final data = await ProductsRemoteDataSourcesImpl.instance.getCategories();
      for (var category in data) {
        categories.add(CategoryDataModel.fromJson(category.data()));
      }
      return Right(categories);
    } on PlatformException catch (e) {
      return left(Failures(message: e.code));
    }
  }
}
