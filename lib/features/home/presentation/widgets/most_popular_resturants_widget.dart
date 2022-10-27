import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_headline_text_widget.dart';
import 'most_popular_card_widget.dart';

class MostPopularResturantsWidget extends StatelessWidget {
  const MostPopularResturantsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.r, right: 15.r),
          child: CustomHeadLineText(title: 'Most Popular', onPressed: () {}),
        ),
        SizedBox(
          height: 30.h,
        ),
        _mostPopularListViewWidget()
      ],
    );
  }

  Widget _mostPopularListViewWidget() {
    return SizedBox(
      height: 205.h,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0.r),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return MostPopularCardWidget();
          },
        ),
      ),
    );
  }
}
