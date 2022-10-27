import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/strings/routes.dart';
import '../../../../../core/injection_container.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../../pick_photo/bloc/pickphoto_bloc.dart';
import '../../blocs/user_info/user_info_cubit.dart';
import 'widgets/header_body_widget.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({Key? key}) : super(key: key);
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inj<AuthBloc>(),
      child: BlocProvider(
        create: (context) => inj<PickPhotoBloc>(),
        child: Scaffold(
          body: BlocBuilder<UserInfoCubit, UserInfoState>(
            buildWhen: (previous, current) =>
                previous.userData != current.userData,
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomAppBar(title: 'Profile'),
                  const SizedBox(
                    height: 30,
                  ),
                  HeaderProfileWidget(
                      imageUrl: state.userData.imageUrl,
                      userName: state.userData.name),
                  const SizedBox(
                    height: 47,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        myFormField(label: 'Name', value: state.userData.name),
                        myFormField(
                            label: 'Email', value: state.userData.email),
                        myFormField(
                            label: 'phone',
                            value: state.userData.phone.isEmpty
                                ? 'please add your phone number'
                                : state.userData.phone),
                        myFormField(
                            label: 'Address',
                            value: state.userData.street + state.userData.city),
                        myFormField(
                            label: 'Password',
                            value: state.userData.password,
                            isSecure: true),
                        myFormField(
                            label: 'Confirm Password',
                            value: state.userData.password,
                            isSecure: true),
                        const SizedBox(
                          height: 17,
                        ),
                        FilledButton(
                            text: 'Save',
                            onPressed: () {
                              Navigator.pushNamed(context, googleMapScreen);
                            }),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget myFormField(
      {required String label,
      required String value,
      bool isSecure = false,
      bool readOnly = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        readOnly: readOnly,
        obscureText: isSecure,
        initialValue: value,
        decoration: InputDecoration(
            label: Text(label),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.transparent,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
