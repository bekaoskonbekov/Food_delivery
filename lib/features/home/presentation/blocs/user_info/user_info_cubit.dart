import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../../../domain/uses_cases/add_to_cart.dart';
import '../../../domain/uses_cases/get_user_data.dart';
import '../../../domain/uses_cases/update_user_image.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  GetUserDataUsesCase getUserDataUsesCase;
  UpdateUserImageUseCase updateUserImageUseCase;
  AddToCartUseCase addToCartUseCase;
  UserInfoCubit({
    required this.getUserDataUsesCase,
    required this.updateUserImageUseCase,
    required this.addToCartUseCase,
  }) : super(UserInfoState());

  Future<void> getUserData() async {
    final userData = await getUserDataUsesCase.call();
    userData.fold(
        (l) async => emit(state.copyWith(userstatus: UserStatus.userError)),
        (r) async {
      emit(state.copyWith(userData: r));
      emit(state.copyWith(userstatus: UserStatus.userLoaded));
    });
  }

  Future<void> updateUserImage(String imageUrl) async {
    final userImage = await updateUserImageUseCase(imageUrl: imageUrl);
    userImage.fold(
        (l) async => emit(state.copyWith(userstatus: UserStatus.userError)),
        (r) async {
      emit(state.copyWith(userstatus: UserStatus.userLoading));
      await getUserData();
      emit(state.copyWith(userstatus: UserStatus.userLoaded));
    });
  }

  // Future<void> addToCart(
  //     {required ProductDataModel productData, required int count}) async {
  //   final Map<String, dynamic> productMap = {
  //     'product': productData.toJson(),
  //     'count': count,
  //   };
  //   await addToCartUseCase(productMap: productMap);
  //   emit(state.copyWith(cartStatus: CartStatus.addedToCartSuccess));
  // }

  incrementCount() {
    state.count += 1;
    emit(state.copyWith(count: state.count));
  }

  decrementCount() {
    if (state.count > 1) {
      state.count -= 1;
      emit(state.copyWith(count: state.count));
    }
  }
}
