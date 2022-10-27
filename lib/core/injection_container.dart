import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/data/data_resources/auth_local_data_sources.dart';
import '../features/auth/data/data_resources/auth_remote_data_sources.dart';
import '../features/auth/data/repositories/auth_repo_imp.dart';
import '../features/auth/domain/uses_case/create_user.dart';
import '../features/auth/domain/uses_case/sign_in_user.dart';
import '../features/auth/domain/uses_case/sign_out_user.dart';
import '../features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../features/google_map/domain/uses_case/get_current_location.dart';
import '../features/google_map/domain/uses_case/location_service_enable.dart';
import '../features/google_map/domain/uses_case/location_service_permission.dart';
import '../features/google_map/presentation/blocs/cubit/google_map_cubit.dart';
import '../features/google_map/services/repositiories/google_map_repo_impl.dart';
import '../features/home/data/data_sources/remote_resturants_data_source.dart';
import '../features/home/data/repositories/categories_repo.dart';
import '../features/home/data/repositories/resturant_repo.dart';
import '../features/home/data/repositories/user_repo_impl.dart';
import '../features/home/domain/uses_cases/add_to_cart.dart';
import '../features/home/domain/uses_cases/get_all_categories.dart';
import '../features/home/domain/uses_cases/get_all_resturant.dart';
import '../features/home/domain/uses_cases/get_user_data.dart';
import '../features/home/domain/uses_cases/update_user_image.dart';
import '../features/home/presentation/blocs/products/products_cubit.dart';
import '../features/home/presentation/blocs/user_info/user_info_cubit.dart';
import '../features/pick_photo/bloc/pickphoto_bloc.dart';
import '../features/pick_photo/data/repositories/pick_photo_repo_imp.dart';
import '../features/pick_photo/domain/uses_case/pick_image_from_camera.dart';
import '../features/pick_photo/domain/uses_case/pick_image_from_gallery.dart';
import '../features/pick_photo/domain/uses_case/upload_image_to_firestore.dart';
import 'network_checker_info/network_checker_info.dart';

final inj = GetIt.instance;

Future<void> init() async {
  /// Bloc
  // Auth Bloc
  inj.registerFactory(
    () => AuthBloc(
      createUseCase: inj(),
      signInUseCase: inj(),
      signOutUseCase: inj(),
    ),
  );
  inj.registerFactory(() => UserInfoCubit(
      getUserDataUsesCase: inj(),
      updateUserImageUseCase: inj(),
      addToCartUseCase: inj()));
  inj.registerFactory(() => PickPhotoBloc(
      cameraUseCase: inj(),
      galleryUseCase: inj(),
      uploadImageToFireStorgeUseCase: inj()));

  inj.registerFactory(() => GoogleMapCubit(
      getCurrentLocationUseCase: inj(),
      isLocationServiceEnabledUseCase: inj(),
      locationServicePermissionUseCase: inj()));

  inj.registerFactory(() => ProductsCubit(inj(), inj()));

  ///UsesCases
//user Uses Case
  inj.registerLazySingleton(() => CreateUseCase(authRepo: inj()));
  inj.registerLazySingleton(() => SignInUseCase(authRepo: inj()));
  inj.registerLazySingleton(() =>
      SignOutUseCase(authLocalDataSource: inj(), authRemoteDataSource: inj()));
  inj.registerLazySingleton(() => AddToCartUseCase(userRepoImpl: inj()));
  inj.registerLazySingleton(() => GetUserDataUsesCase(userRepo: inj()));
  inj.registerLazySingleton(() => PickImageFromCameraUseCase(inj()));
  inj.registerLazySingleton(() => PickImageFromGalleryUseCase(inj()));
  inj.registerLazySingleton(
      () => UploadImageToFireStorgeUseCase(pickPhotoRepoImpl: inj()));
  inj.registerLazySingleton(() => UpdateUserImageUseCase(userRepoImpl: inj()));
  inj.registerLazySingleton(
      () => GetCurrentLocationUseCase(googleMapRepoImpl: inj()));
  inj.registerLazySingleton(
      () => IsLocationServiceEnabledUseCase(googleMapRepoImpl: inj()));
  inj.registerLazySingleton(
      () => LocationServicePermissionUseCase(googleMapRepoImpl: inj()));

  inj.registerLazySingleton(
      () => GetAllCategoriesUseCase(categoryRepoImpl: inj()));

  inj.registerLazySingleton(
      () => GetAllResturantsUseCase(resturantRepoImpl: inj()));

  // Repositories
  //inj.registerFactory(() => AuthRepoImp(userLocalDataSourceImpl: inj()));
  inj.registerLazySingleton<AuthRepoImp>(
      () => AuthRepoImp(authLocalDataSourceImpl: inj()));
  inj.registerLazySingleton<UserRepoImpl>(
      () => UserRepoImpl(userLocalData: inj()));

  inj.registerLazySingleton<PickPhotoRepoImpl>(() => PickPhotoRepoImpl());
  inj.registerLazySingleton<GoogleMapRepoImpl>(() => GoogleMapRepoImpl());
  inj.registerLazySingleton<CategoryRepoImpl>(() => CategoryRepoImpl());
  inj.registerLazySingleton<ResturantRepoImpl>(
      () => ResturantRepoImpl(remoteResturantDataSourceImpl: inj()));

  // DataSources
  // inj.registerFactory(() => UserLocalDataSourceImpl(sharedPreferences: inj()));
  inj.registerLazySingleton<AuthLocalDataSourceImpl>(
      () => AuthLocalDataSourceImpl(sharedPreferences: inj()));
  inj.registerLazySingleton<AuthRemoteDataSourcesImpl>(
      () => AuthRemoteDataSourcesImpl.instance);

  inj.registerLazySingleton<RemoteResturantDataSourceImpl>(
      () => RemoteResturantDataSourceImpl());

  // inj.registerLazySingleton<PostRemoteDataSource>(
  //     () => PostRemoteDataSourceImp(dio: inj()));

  // Core

  inj.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(connectionChecker: inj()));

  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  inj.registerLazySingleton(() => sharedPreferences);
  //inj.registerLazySingleton(() => Dio());
  inj.registerLazySingleton(() => InternetConnectionChecker());
}
