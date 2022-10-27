import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/strings/routes.dart';
import '../../../../../../core/widgets/custom_buttons.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/custpm_snackbar.dart';
import '../../../bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  SignUpBody({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final mobileController = TextEditingController();
    final addressController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPassowrdController = TextEditingController();

    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            SnackBarMessage().showSuccessMessage(
                message: 'Please wait ...', context: context);
          }
          if (state is ErrorCreateOrSignInUserState) {
            SnackBarMessage()
                .showErrorMessage(message: state.message, context: context);
          } else if (state is SuccessCreateOrSignInUserState) {
            SnackBarMessage().showSuccessMessage(
                message: 'Done Created an account ', context: context);
            Navigator.pushReplacementNamed(context, loginScreen);
          }
        },
        child: Form(
          key: _key,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 8.r),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                const HeadLineText(
                  title: 'Sign Up',
                  subTitle: 'Add your details to Sign Up',
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  controller: nameController,
                  secure: false,
                  onSaved: (value) => nameController.text = value,
                  hint: 'Name',
                  inputType: TextInputType.name,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  controller: emailController,
                  secure: false,
                  onSaved: (value) => emailController.text = value,
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  controller: mobileController,
                  secure: false,
                  onSaved: (value) => mobileController.text = value,
                  hint: 'Mobil No',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  controller: addressController,
                  secure: false,
                  onSaved: (value) => addressController.text = value,
                  hint: 'Address',
                  inputType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  controller: passwordController,
                  secure: true,
                  onSaved: (value) => passwordController.text = value,
                  hint: 'Password',
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  controller: confirmPassowrdController,
                  secure: true,
                  onSaved: (value) => confirmPassowrdController.text = value,
                  hint: 'Confirm Password',
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20.h,
                ),
                FilledButton(
                    text: 'Sign Up',
                    onPressed: () async {
                      _key.currentState!.save();
                      BlocProvider.of<AuthBloc>(context).add(
                        CreateUserEvent(
                          emailController.text,
                          passwordController.text,
                          nameController.text,
                        ),
                      );
                    }),
                SizedBox(
                  height: 50.h,
                ),
                buildText(context),
              ],
            ),
          ),
        ));
  }

  Widget buildText(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacementNamed(context, loginScreen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an Account?',
            style: TextStyle(color: primaryFontColor, fontSize: 16.sp),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            'Login',
            style: TextStyle(
                fontFamily: 'Metropolis-Bold',
                fontSize: 16.sp,
                color: mainColor),
          )
        ],
      ),
    );
  }
}
