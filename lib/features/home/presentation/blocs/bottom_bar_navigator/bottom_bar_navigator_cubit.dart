import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../screens/home/home_body.dart';
import '../../screens/profile/profile_body.dart';
import '../../screens/menu/menu_body.dart';
import '../../screens/more_settings/more_settings_body.dart';
import '../../screens/offers/offers_body.dart';

part 'bottom_bar_navigator_state.dart';

class BottomBarNavigatorCubit extends Cubit<BottomBarNabigatorState> {
  BottomBarNavigatorCubit() : super(BottomBarNabigatorState());

  void navigateToScreen(int index) {
    emit(state.copyWith(index));
  }
}
