import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../home/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failures, List<ProductData>>> getPopularProducts();

  Future<Either<Failures, List<ProductData>>> productSearch(String search);

  Future<Either<Failures, List<ProductData>>> getCategoryProducts(String name);
}
