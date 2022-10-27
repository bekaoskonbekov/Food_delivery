import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../blocs/products/products_cubit.dart';

class ResturantsScreen extends StatelessWidget {
  const ResturantsScreen({Key? key}) : super(key: key);
  static const String resturantScreen = '/resturant_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
        if (state.resturantStatus == ResturantStatus.loading) {
          return Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
        } else if (state.resturantStatus == ResturantStatus.error) {
          // return Center(
          //   child: Text(
          //     state.message,
          //     textAlign: TextAlign.center,
          //     style: TextStyle(fontSize: 22),
          //   ),
          // );
          throw state.message;
        } else {
          return ListView.builder(
              itemCount: state.resturantData.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(3),
                  child: Text(state.resturantData[index].phone),
                );
              });
        }
      }),
    );
  }
}
