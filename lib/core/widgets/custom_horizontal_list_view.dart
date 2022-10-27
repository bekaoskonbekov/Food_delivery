import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/size_config.dart';


class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 15,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: SizeConfig.defaultSize!, left: 21),
          child: Column(
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 1,
              ),
              const Text(
                'Offers',
                style: TextStyle(
                  color: primaryFontColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
