import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';
import '../constants/size_config.dart';

class HeadLineText extends StatelessWidget {
  final String title;
  final String subTitle;
  const HeadLineText({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Metropolis-SemiBold',
              fontSize: 30.sp,
              color: primaryFontColor,
            ),
          ),
          SizedBox(
            height: 10.5.h,
          ),
          SizedBox(
            width: SizeConfig.screenWidth! - 66,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5.h,
                fontFamily: 'Metropolis-Medium',
                fontSize: 14.sp,
                color: secondaryFontColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
