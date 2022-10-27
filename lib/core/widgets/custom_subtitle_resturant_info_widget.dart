import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class CustomSubTitleResturantInfoWidget extends StatelessWidget {
  final String info, category;
  const CustomSubTitleResturantInfoWidget(
      {Key? key, required this.info, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 162.w,
      child: Row(
        children: [
          Text(
            info,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: placeholderColor,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Text(
            '.',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 0,
              color: mainColor,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            child: Text(
              category,
              textAlign: TextAlign.left,
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: placeholderColor,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
