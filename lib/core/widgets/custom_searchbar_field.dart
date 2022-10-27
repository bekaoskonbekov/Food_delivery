import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class CustomSearchBarField extends StatelessWidget {
  const CustomSearchBarField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/icons/search.png'),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
            child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'Search food',
            hintStyle: TextStyle(
              color: placeholderColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        )),
      ],
    );
  }
}
