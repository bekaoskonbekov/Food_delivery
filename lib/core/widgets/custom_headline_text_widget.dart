import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class CustomHeadLineText extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomHeadLineText(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: primaryFontColor,
          ),
        ),
        InkWell(
          onTap: onPressed,
          child: Text(
            'View all',
            style: TextStyle(
                color: mainColor, fontSize: 16.sp, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
