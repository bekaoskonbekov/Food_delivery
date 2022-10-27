import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bottom_bar_navigator/bottom_bar_navigator_cubit.dart';

class TabBarMaterialWidget extends StatelessWidget {
  const TabBarMaterialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const placeholder = Opacity(
      opacity: 0,
      child: IconButton(
        onPressed: null,
        icon: Icon(Icons.no_cell),
      ),
    );
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: BlocBuilder<BottomBarNavigatorCubit, BottomBarNabigatorState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTabItem(
                  toolTip: 'Menu',
                  // icon: Icon(
                  //   Icons.menu,
                  //   color: state.index == 0 ? mainColor : Colors.black,
                  // ),
                  icon: Image.asset(state.index == 0
                      ? 'assets/icons/menu-on.png'
                      : 'assets/icons/menu-off.png'),
                  index: 0,
                  onPressed: () =>
                      BlocProvider.of<BottomBarNavigatorCubit>(context)
                          .navigateToScreen(0)),
              _buildTabItem(
                toolTip: 'Offers',
                icon: Image.asset(state.index == 1
                    ? 'assets/icons/offers-on.png'
                    : 'assets/icons/offers-off.png'),
                index: 1,
                onPressed: () =>
                    BlocProvider.of<BottomBarNavigatorCubit>(context)
                        .navigateToScreen(1),
              ),
              placeholder,
              _buildTabItem(
                toolTip: 'Profile',
                icon: Image.asset(state.index == 3
                    ? 'assets/icons/profile-on.png'
                    : 'assets/icons/profile-off.png'),
                index: 3,
                onPressed: () =>
                    BlocProvider.of<BottomBarNavigatorCubit>(context)
                        .navigateToScreen(3),
              ),
              _buildTabItem(
                toolTip: 'Settings',
                icon: Image.asset(state.index == 4
                    ? 'assets/icons/more-on.png'
                    : 'assets/icons/more-off.png'),
                index: 4,
                onPressed: () =>
                    BlocProvider.of<BottomBarNavigatorCubit>(context)
                        .navigateToScreen(4),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabItem(
      {required Widget icon,
      required int index,
      required String toolTip,
      required VoidCallback onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      tooltip: toolTip,
    );
  }
}
