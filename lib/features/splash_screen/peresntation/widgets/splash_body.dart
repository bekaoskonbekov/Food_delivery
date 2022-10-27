import 'package:flutter/material.dart';

import '../../../../core/constants/size_config.dart';
import '../../../../core/constants/strings/routes.dart';
import '../../../../core/injection_container.dart';
import '../../../auth/data/data_resources/auth_local_data_sources.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? fadingController;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    fadingController = Tween<double>(begin: 0.2, end: 1).animate(controller!);
    controller?.repeat(reverse: true);
    goToNextScreen();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Image.asset('assets/images/Background.png'),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: FadeTransition(
              opacity: fadingController!,
              child: Image.asset('assets/images/logo-with-shadow.png')),
        )
      ],
    );
  }

  void goToNextScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (inj<AuthLocalDataSourceImpl>().getCasheUserId() == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, welcomeScreen, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, homeScreen, (route) => false);
        }
      },
    );
  }
}
