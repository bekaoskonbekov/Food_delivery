import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool back;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.back = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.r,
        right: 10.r,
        top: 15.r,
      ),
      child: Row(
        children: [
          back ? const Icon(Icons.arrow_back) : Container(),
          SizedBox(
            width: 5.w,
          ),
          Text(
            title,
            style: TextStyle(
                color: primaryFontColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w400),
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Image.asset('assets/icons/shopping-cart.png'),
          ),
        ],
      ),
    );
  }
}
