part of 'bottom_bar_navigator_cubit.dart';

class BottomBarNabigatorState extends Equatable {
  List<Map<String, dynamic>> screens = [
    {
      'title': 'Menu',
      'body': MenuBody(),
    },
    {
      'title': 'Offers',
      'body': OffersBody(),
    },
    {
      'title': 'Home',
      'body': HomeBody(),
    },
    {
      'title': 'Profile',
      'body': ProfileBody(),
    },
    {
      'title': 'Settings',
      'body': MoreSettingsBody(),
    },
  ];

  final int index;

  BottomBarNabigatorState({this.index = 2});

  @override
  List<Object> get props => [index];

  BottomBarNabigatorState copyWith(int? pageIndex) {
    return BottomBarNabigatorState(index: pageIndex ?? index);
  }
}
