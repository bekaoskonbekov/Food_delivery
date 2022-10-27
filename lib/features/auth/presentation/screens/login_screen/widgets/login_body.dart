import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/strings/routes.dart';
import '../../../../../../core/widgets/custom_buttons.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/custpm_snackbar.dart';
import '../../../bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            const HeadLineText(
              title: 'Login',
              subTitle: 'Add your details to login',
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              controller: email,
              secure: false,
              onSaved: (value) {
                email.text = value;
              },
              hint: 'example@example.com',
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              controller: password,
              secure: true,
              onSaved: (value) {},
              hint: 'Password',
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                } else if (state is ErrorCreateOrSignInUserState) {
                  SnackBarMessage().showErrorMessage(
                      message: state.message, context: context);
                } else if (state is SuccessCreateOrSignInUserState) {
                  SnackBarMessage().showSuccessMessage(
                      message: 'Signed in ', context: context);

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    homeScreen,
                    (route) => false,
                    //arguments: context.read<AuthBloc>(),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const LoadingWidget();
                }
                return FilledButton(
                    text: 'Login',
                    onPressed: () async {
                      _key.currentState!.save();
                      BlocProvider.of<AuthBloc>(context).add(
                        SignInUserEvent(email.text, password.text),
                      );
                    });
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            buildText(
                context: context,
                title: 'Forgot your password?',
                nextTitle: '',
                onTap: () {}),
            SizedBox(
              height: 60.h,
            ),
            buildText(
              context: context,
              title: 'or Login With',
              nextTitle: '',
              onTap: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            CusttomIconButton(
              color: const Color(0XFF367FC0),
              onPressed: () {
                print('facebook');
              },
              text: 'Login With Facebook',
              icon: Image.asset(
                'assets/icons/facebook-letter-logo.png',
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CusttomIconButton(
              color: const Color(0XFFDD4B39),
              onPressed: () {
                // BlocProvider.of<AuthBloc>(context)
                //     .add(LoginWithGoogle(user: Users()));
                print('ss');
              },
              text: 'Login With Google',
              icon: Image.asset(
                'assets/icons/google-plus-logo.png',
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            buildText(
                context: context,
                title: 'Don\'t have an Account?',
                nextTitle: 'Sign Up',
                onTap: () =>
                    Navigator.pushReplacementNamed(context, signUpScreen))
          ],
        ),
      ),
    );
  }

  Widget buildText(
      {BuildContext? context,
      String? title,
      String? nextTitle,
      VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title!,
            style: TextStyle(color: secondaryFontColor, fontSize: 16.sp),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            nextTitle!,
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
