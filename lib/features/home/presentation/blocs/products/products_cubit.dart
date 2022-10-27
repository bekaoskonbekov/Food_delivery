import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/resturant_entity.dart';
import '../../../domain/uses_cases/get_all_categories.dart';
import '../../../domain/uses_cases/get_all_resturant.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetAllResturantsUseCase getAllResturantsUseCase;
  ProductsCubit(this.getAllCategoriesUseCase, this.getAllResturantsUseCase)
      : super(ProductsState());

  getAllCategories() async {
    final ga = await getAllCategoriesUseCase();
    ga.fold(
        (failure) => emit(state.copyWith(productStatus: ProductStatus.error)),
        (categories) {
      listKey.currentState?.insertItem(categories.length);
      emit(state.copyWith(categoryList: categories));
      emit(state.copyWith(productStatus: ProductStatus.loaded));
    });
  }

  getAllResturants() async {
    final resturants = await getAllResturantsUseCase();
    resturants.fold(
        (failure) => emit(state.copyWith(
            resturantStatus: ResturantStatus.error,
            message: failure.message)), (resturants) {
      emit(state.copyWith(
          resturantStatus: ResturantStatus.loaded, resturantData: resturants));
    });
  }

  getData() async {
    await getAllCategories();
    await getAllResturants();
  }
}
