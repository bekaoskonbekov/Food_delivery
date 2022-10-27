part of 'user_info_cubit.dart';

enum UserStatus {
  userLoading,
  userLoaded,
  userError,
}

enum FavoriteStatus {
  addedToFavoritesSuccess,
  addedToFavoritesError,
  removedFromFavoritesSuccess,
  removedFromFavoritesError,
}

enum CartStatus {
  addedToCartSuccess,
  addedToCartError,
  removedFromCartSuccess,
  removedFromCartError,
}

class UserInfoState extends Equatable {
  final UserStatus userstatus;
  final UserData userData;
  final CartStatus? cartStatus;
  final FavoriteStatus? favoriteStatus;
  int count;
  UserInfoState({
    this.userstatus = UserStatus.userLoading,
    this.count = 1,
    this.userData = const UserData(
      id: '',
      name: '',
      email: '',
      password: '',
      phone: '',
      city: '',
      cartProducts: [],
      favorites: [],
      street: '',
      governorate: '',
      imageUrl: '',
      memberSince: '',
      postalCode: '',
    ),
    this.cartStatus,
    this.favoriteStatus,
  });

  @override
  List<Object> get props => [
        userstatus,
      ];

  UserInfoState copyWith({
    int? count,
    UserStatus? userstatus,
    UserData? userData,
    CartStatus? cartStatus,
    FavoriteStatus? favoriteStatus,
  }) {
    return UserInfoState(
        count: count ?? this.count,
        userData: userData ?? this.userData,
        userstatus: userstatus ?? this.userstatus,
        cartStatus: cartStatus ?? this.cartStatus,
        favoriteStatus: favoriteStatus ?? this.favoriteStatus);
  }
}
