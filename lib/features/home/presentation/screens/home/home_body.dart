import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_searchbar_field.dart';
import '../../blocs/user_info/user_info_cubit.dart';
import '../../widgets/category_list_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/most_popular_resturants_widget.dart';
import '../../widgets/popular_resturant_widget.dart';
import '../../widgets/recent_items_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          BlocBuilder<UserInfoCubit, UserInfoState>(
            builder: (context, state) {
              return CustomAppBar(
                title: 'Good Morning ${state.userData.name}',
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.r, vertical: 8.0.r),
            child: const CustomSearchBarField(),
          ),
          SizedBox(
            height: 10.h,
          ),
          const CategoryListWidget(),
          SizedBox(
            height: 40.h,
          ),
          PopularResturantsWidget(),
          SizedBox(
            height: 40.h,
          ),
          const MostPopularResturantsWidget(),
          SizedBox(
            height: 40.h,
          ),
          RecentItemsWidget(),
          SizedBox(
            height: 100.h,
          ),
        ],
      ),
    );
  }
}
