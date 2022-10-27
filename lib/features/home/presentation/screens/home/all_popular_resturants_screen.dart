import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../domain/entities/resturant_entity.dart';
import '../../widgets/popular_item_container_widget.dart';

class AllPopularResturantsScreen extends StatelessWidget {
  final List<ResturantData> resturants;
  const AllPopularResturantsScreen({Key? key, required this.resturants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimationLimiter(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0),
              itemCount: resturants.length,
              itemBuilder: (context, index) =>
                  AnimationConfiguration.staggeredList(
                      position: index,
                      delay: const Duration(milliseconds: 100),
                      child: SlideAnimation(
                        duration: const Duration(microseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        verticalOffset: -250,
                        child: ScaleAnimation(
                          duration: const Duration(milliseconds: 1500),
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
        ),
      ),
    );
  }
}
