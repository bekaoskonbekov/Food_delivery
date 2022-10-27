part of 'products_cubit.dart';

enum ProductStatus {
  loading,
  loaded,
  error,
}

enum ResturantStatus {
  loading,
  loaded,
  error,
}

class ProductsState extends Equatable {
  final ProductStatus productStatus;
  final ResturantStatus resturantStatus;
  final List<CategoryData> categoryList;

  final List<ResturantData> resturantData;
  final String message;
  const ProductsState({
    this.message = 'Lolll',
    this.productStatus = ProductStatus.loading,
    this.resturantStatus = ResturantStatus.loading,
    this.categoryList = const [],
    this.resturantData = const [],
  });

  ProductsState copyWith({
    ProductStatus? productStatus,
    List<CategoryData>? categoryList,
    ResturantStatus? resturantStatus,
    List<ResturantData>? resturantData,
    String? message,
  }) {
    return ProductsState(
      productStatus: productStatus ?? this.productStatus,
      categoryList: categoryList ?? this.categoryList,
      resturantData: resturantData ?? this.resturantData,
      resturantStatus: resturantStatus ?? this.resturantStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [
        productStatus,
        categoryList,
        resturantData,
        resturantStatus,
      ];
}
