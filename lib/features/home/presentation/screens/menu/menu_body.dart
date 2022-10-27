import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_searchbar_field.dart';
import 'widgets/menu_item.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Menu'),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.r),
            child: CustomSearchBarField(),
          ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: SizedBox(
              height: 485.h,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  leftSideWidget(),
                  Positioned(
                      left: 20.r,
                      top: 30.r,
                      right: 10.r,
                      child: MenuBodyItem(cardShape: CardShape.circle)),
                  const Positioned(
                      left: 20,
                      top: 147,
                      right: 10,
                      child: MenuBodyItem(cardShape: CardShape.rectangle)),
                  const Positioned(
                      left: 20,
                      top: 264,
                      right: 10,
                      child: MenuBodyItem(cardShape: CardShape.circle)),
                  const Positioned(
                      left: 20,
                      top: 381,
                      right: 10,
                      child: MenuBodyItem(cardShape: CardShape.rotated)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container leftSideWidget() {
    return Container(
      height: 485,
      width: 97,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}
