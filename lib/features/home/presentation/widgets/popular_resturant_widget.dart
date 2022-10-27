import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../core/constants/strings/routes.dart';
import '../../../../core/widgets/custom_headline_text_widget.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../domain/entities/resturant_entity.dart';
import '../blocs/products/products_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'popular_item_container_widget.dart';

class PopularResturantsWidget extends StatelessWidget {
  PopularResturantsWidget({Key? key}) : super(key: key);
  List<ResturantData> resturants = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          child: CustomHeadLineText(
            title: 'Popular Resturants',
            onPressed: () => Navigator.pushNamed(
                context, allPopularResturantsScreen,
                arguments: resturants),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
            height: 858.h,
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state.resturantStatus == ResturantStatus.loading) {
                  return const LoadingWidget();
                } else if (state.resturantStatus == ResturantStatus.loaded) {
                  resturants = state.resturantData;
                  return AnimationLimiter(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        itemCount: 3,
                        itemBuilder: (context, index) =>
                            AnimationConfiguration.staggeredList(
                                position: index,
                                delay: const Duration(milliseconds: 100),
                                child: SlideAnimation(
                                  duration: const Duration(microseconds: 2500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  verticalOffset: -250,
                                  child: ScaleAnimation(
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: PopularItemContainerWidget(
                                      resturantName: resturants[index]
                                          .businessname
                                          .capitalizeFirst!, // capitalizeFirst() from get package
                                      imageUrl: resturants[index].image,
                                      slug: resturants[index].slug,
                                      resturantType: resturants[index]
                                          .restaurantType
                                          .capitalizeFirst!,
                                    ),
                                  ),
                                ))),
                  );
                } else {
                  return Text('You are out loading and loaded state');
                }
              },
            )),
      ],
    );
  }
}
