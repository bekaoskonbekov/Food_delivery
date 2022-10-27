import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../domain/entities/category_entity.dart';
import '../blocs/products/products_cubit.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categoryList.length,
            itemBuilder: (context, index) {
              return _buildListItem(categoryData: state.categoryList[index]);
            },
          );
        },
      ),
    );
  }

  Column _buildListItem({required CategoryData categoryData}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 13.r),
          width: 80.w,
          height: 90.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.black,
          ),
          child: ClipRRect(
            child: CachedNetworkImage(
              key: UniqueKey(),
              imageUrl: categoryData.image,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          categoryData.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: primaryFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
