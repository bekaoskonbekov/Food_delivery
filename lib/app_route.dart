import 'package:flutter/material.dart';
import 'core/constants/strings/routes.dart';
import 'core/injection_container.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/screens/login_screen/login_screen.dart';
import 'features/auth/presentation/screens/signup_screen/signup_screen.dart';
import 'features/auth/presentation/screens/welcome_screen/welcome_screen.dart';
import 'features/google_map/presentation/blocs/cubit/google_map_cubit.dart';
import 'features/google_map/presentation/screens/google_map_screen.dart';
import 'features/home/domain/entities/resturant_entity.dart';
import 'features/home/presentation/blocs/bottom_bar_navigator/bottom_bar_navigator_cubit.dart';
import 'features/home/presentation/blocs/products/products_cubit.dart';
import 'features/home/presentation/blocs/user_info/user_info_cubit.dart';
import 'features/home/presentation/screens/details_item_screen/details_item_screen.dart';
import 'features/home/presentation/screens/home/all_popular_resturants_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/home/presentation/screens/testResturantScreen.dart';
import 'features/splash_screen/peresntation/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<AuthBloc>(
                  create: (context) => inj<AuthBloc>(),
                  child: const SignUpScreen(),
                ));
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthBloc>(
            create: (context) => inj<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: ((context) => MultiBlocProvider(providers: [
                BlocProvider(create: (_) => BottomBarNavigatorCubit()),
                BlocProvider(create: (_) => inj<ProductsCubit>()..getData()),
                BlocProvider<UserInfoCubit>(
                    create: (_) => inj<UserInfoCubit>()..getUserData())
              ], child: HomeScreen())),
        );
      case detailsItemScreen:
        return MaterialPageRoute(
          builder: ((context) => MultiBlocProvider(providers: [
                BlocProvider.value(
                    value: settings.arguments as BottomBarNavigatorCubit),
                BlocProvider<UserInfoCubit>(
                  create: (_) => inj<UserInfoCubit>(),
                )
              ], child: DetailsItemScreen())),
        );

//Todo Remove the testing
      case ResturantsScreen.resturantScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<ProductsCubit>(
                  create: (context) => inj<ProductsCubit>()..getAllResturants(),
                  child: const ResturantsScreen(),
                ));

      case googleMapScreen:
        return MaterialPageRoute(
          builder: ((context) => MultiBlocProvider(
                providers: [
                  BlocProvider<GoogleMapCubit>(
                      create: (_) =>
                          inj<GoogleMapCubit>()..isLocationEnabled()),
                ],
                child: GoogleMapScreen(),
              )),
        );
      case allPopularResturantsScreen:
        final resturants = settings.arguments as List<ResturantData>;
        return MaterialPageRoute(
            builder: (context) => AllPopularResturantsScreen(
                  resturants: resturants,
                ));
      // case usersScreen:
      //   final user = settings.arguments as Users;
      //   return MaterialPageRoute(
      //       builder: (context) => BlocProvider(
      //             create: (context) => AuthBloc(authRepoImpl: authRepo),
      //             child: UserScreen(user: user),
      //           ));

      // case onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: ((context) => OnBoardingScreen()),
      //   );

      // case homeScreen:
      //   return MaterialPageRoute(
      //     builder: ((context) => HomeScreen()),
      //   );

    }
  }
}
