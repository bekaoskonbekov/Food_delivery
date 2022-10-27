import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/strings/routes.dart';
import '../../../../../../core/widgets/custom_buttons.dart';
import '../../../blocs/bottom_bar_navigator/bottom_bar_navigator_cubit.dart';

enum CardShape {
  rectangle,
  circle,
  rotated,
}

class MenuBodyItem extends StatelessWidget {
  final CardShape cardShape;
  const MenuBodyItem({Key? key, required this.cardShape}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87.h,
      width: 333.w,
      child: Stack(
        children: [
          Positioned(
            left: 20.r,
            right: 30.r,
            child: itemInfo(),
          ),
          Positioned(
            left: 0.r,
            top: 0.r,
            bottom: 0.r,
            child: itemImage(cardShape),
          ),
          Positioned(
            right: 12.r,
            top: 0,
            bottom: 0,
            child: CustomRoundedIconButton(
                icon: const RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.arrow_back,
                    color: mainColor,
                  ),
                ),
                onTap: () => Navigator.pushNamed(
                      context,
                      detailsItemScreen,
                      arguments:
                          BlocProvider.of<BottomBarNavigatorCubit>(context),
                    )),
          )
        ],
      ),
    );
  }

  Container itemInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          bottomLeft: Radius.circular(50.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5.r),
            offset: Offset(2.r, 3.r),
            blurRadius: 7.r,
          ),
        ],
      ),
      child: SizedBox(
        width: 280.w,
        height: 87.h,
        child: Row(
          children: [
            SizedBox(
              width: 90.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Food'),
                SizedBox(
                  height: 10.h,
                ),
                Text('120 items'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget itemImage(CardShape cardShape) {
    if (cardShape == CardShape.circle) {
      return Container(
        height: 70.h,
        width: 70.w,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  spreadRadius: 0.5.r,
                  offset: Offset(2.5.r, 0.1.r),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 5.r),
              BoxShadow(
                  color: mainColor,
                  spreadRadius: 5.r,
                  offset: Offset(-30.r, 0.1.r),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 15.r),
            ],
            color: Colors.black,
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/images/1.png'), fit: BoxFit.fill)),
      );
    } else if (cardShape == CardShape.rectangle) {
      return Container(
        height: 70.h,
        width: 70.w,
        margin: EdgeInsets.only(top: 10.r, bottom: 10.r),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  spreadRadius: 0.5,
                  offset: Offset(2.5.r, 0.1.r),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 5.r),
              BoxShadow(
                  color: mainColor,
                  spreadRadius: 5.r,
                  offset: Offset(-30.r, 0.1.r),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 15.r),
            ],
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            image: const DecorationImage(
                image: AssetImage('assets/images/1.png'), fit: BoxFit.fill)),
      );
    } else if (cardShape == CardShape.rotated) {
      return Transform.rotate(
        angle: 2.2,
        child: Container(
          height: 70.h,
          width: 70.w,
          margin: EdgeInsets.only(top: 10.r, bottom: 10.r),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  spreadRadius: 0.5.r,
                  offset: Offset(-2.r, -1.r),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 5.r,
                ),
              ],
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              image: const DecorationImage(
                  image: AssetImage('assets/images/1.png'), fit: BoxFit.fill)),
        ),
      );
    }
    return const Text('some thing went wrong ');
  }
}
