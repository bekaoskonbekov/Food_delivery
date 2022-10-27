import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/size_config.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/custom_rating_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_resturant_name_widget.dart';
import '../../../../core/widgets/custom_subtitle_resturant_info_widget.dart';

class PopularItemContainerWidget extends StatelessWidget {
  final String imageUrl;
  final String resturantName;
  final String resturantType;
  final String slug;
  const PopularItemContainerWidget({
    Key? key,
    required this.imageUrl,
    required this.resturantName,
    required this.resturantType,
    required this.slug,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth,
          height: 200.h,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => const LoadingWidget(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.r, bottom: 5.r, left: 15.r),
          height: 70.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomResturantNameWidget(resturantName: resturantName),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  const CustomRatingWidget(
                    showTextRating: true,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomSubTitleResturantInfoWidget(
                      info: resturantType, category: slug),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
