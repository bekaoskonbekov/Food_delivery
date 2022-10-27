import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_rating_widget.dart';
import '../../../../core/widgets/custom_resturant_name_widget.dart';
import '../../../../core/widgets/custom_subtitle_resturant_info_widget.dart';

class MostPopularCardWidget extends StatelessWidget {
  const MostPopularCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 15.r),
          height: 135.h,
          width: 228.w,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15.r),
              image: const DecorationImage(
                  image: AssetImage('assets/images/onBoarding-1.png'))),
        ),
        SizedBox(
          height: 15.h,
        ),
        const CustomResturantNameWidget(resturantName: 'Café De Bambaa'),
        SizedBox(
          height: 5.h,
        ),
        Row(
          children: [
            const CustomSubTitleResturantInfoWidget(
                info: 'Café', category: 'Western Food'),
            SizedBox(
              width: 15.w,
            ),
            const CustomRatingWidget(
              showTextRating: false,
            ),
          ],
        ),
      ],
    );
  }
}
