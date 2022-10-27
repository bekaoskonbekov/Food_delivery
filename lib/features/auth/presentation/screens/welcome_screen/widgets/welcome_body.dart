import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/size_config.dart';
import '../../../../../../core/constants/strings/routes.dart';
import '../../../../../../core/widgets/custom_buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: SizeConfig.screenHeight! - 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/Organe-top-shape.png',
                ),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: SizeConfig.screenHeight! / 3,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.h,
            ),
            SizedBox(
              width: SizeConfig.screenWidth! - 52,
              child: Text(
                'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep',
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.5.h,
                    fontSize: 15.sp,
                    //fontFamily: 'Metropolis-Medium',
                    color: secondaryFontColor),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            FilledButton(
              text: 'Login',
              onPressed: () => Navigator.pushNamed(context, loginScreen),
            ),
            SizedBox(
              height: 20.h,
            ),
            BorderButton(
              text: 'Create an Account',
              onPressed: () => Navigator.pushNamed(context, signUpScreen),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ],
    );
  }
}
