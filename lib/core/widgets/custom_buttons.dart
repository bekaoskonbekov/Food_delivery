import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';
import '../constants/size_config.dart';

class FilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double textSize;
  const FilledButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.textSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: SizeConfig.screenWidth! - 34,
        height: 56.h,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: textSize.sp,
                fontFamily: 'Metropolis-Medium'),
          ),
        ),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const BorderButton({Key? key, required this.text, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: SizeConfig.screenWidth! - 34,
        height: 56.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: mainColor,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: mainColor,
              fontSize: 16.sp,
              fontFamily: 'Metropolis-Medium'),
        )),
      ),
    );
  }
}

class CusttomIconButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback? onPressed;
  final Color color;
  final bool withText;
  final double padding;
  const CusttomIconButton({
    Key? key,
    this.withText = true,
    this.padding = 20,
    required this.color,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
          width: SizeConfig.screenWidth! - 34,
          height: 56.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              withText
                  ? SizedBox(
                      width: padding,
                    )
                  : Container(),
              withText
                  ? Text(
                      text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'Metropolis-Medium'),
                    )
                  : Container(),
            ],
          )),
    );
  }
}

class CustomRoundedIconButton extends StatelessWidget {
  const CustomRoundedIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.height = 33,
    this.width = 33,
  }) : super(key: key);
  final double width;
  final double height;
  final Widget icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      splashColor: primaryFontColor,
      child: Container(
        alignment: Alignment.center,
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0.1.r,
              offset: Offset(2.r, 2.r),
              blurRadius: 5.r,
            ),
          ],
        ),
        child: icon,
      ),
    );
  }
}
