import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_headline_text_widget.dart';
import '../../../../core/widgets/custom_rating_widget.dart';
import '../../../../core/widgets/custom_resturant_name_widget.dart';

class RecentItemsWidget extends StatelessWidget {
  const RecentItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          CustomHeadLineText(title: 'Recent Items', onPressed: () {}),
          SizedBox(
            height: 26.h,
          ),
          _buildRecentItemsContainerWidget(),
          SizedBox(
            height: 15.h,
          ),
          _buildRecentItemsContainerWidget(),
          SizedBox(
            height: 15.h,
          ),
          _buildRecentItemsContainerWidget(),
        ],
      ),
    );
  }

  Widget _buildRecentItemsContainerWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 75.w,
          height: 75.h,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
              image: AssetImage('assets/images/onBoarding-1.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          width: 22.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomResturantNameWidget(
                resturantName: 'Mulberry Pizza by Josh'),
            SizedBox(
              height: 3.h,
            ),
            //  CustomSubTitleResturantInfoWidget(
            //     info: 'Café', category: 'Western Food'),
            SizedBox(
              height: 3.h,
            ),
            const CustomRatingWidget(showTextRating: true),
          ],
        )
      ],
    );
  }
}
