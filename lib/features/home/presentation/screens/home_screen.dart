import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../blocs/bottom_bar_navigator/bottom_bar_navigator_cubit.dart';
import '../widgets/bottom_appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarNavigatorCubit, BottomBarNabigatorState>(
      builder: (context, state) {
        return Scaffold(
          // To set the floating action button in bottom when keyboard open
          resizeToAvoidBottomInset: false,
          /////////////////////////////////////////////////////////////////
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            backgroundColor: state.index == 2 ? mainColor : placeholderColor,
            onPressed: () =>
                context.read<BottomBarNavigatorCubit>().navigateToScreen(2),
            child: const Icon(Icons.home),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Padding(
            padding: const EdgeInsets.only(
              top: 65,
            ),
            child: state.screens[state.index]['body'],
          ),
          bottomNavigationBar: const TabBarMaterialWidget(),
        );
      },
    );
  }
}
