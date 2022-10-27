import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomResturantNameWidget extends StatelessWidget {
  const CustomResturantNameWidget({
    Key? key,
    required this.resturantName,
    this.color = primaryFontColor,
  }) : super(key: key);

  final String resturantName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      resturantName,
      style:
          TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 20.sp),
    );
  }
}
