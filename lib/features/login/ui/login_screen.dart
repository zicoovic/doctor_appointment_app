import 'package:doctor_appointment_app/core/helper/spacing.dart';
import 'package:doctor_appointment_app/core/theming/styles.dart';
import 'package:doctor_appointment_app/features/login/ui/widgets/check_box_for_remember_me.dart';
import 'package:doctor_appointment_app/features/login/ui/widgets/term_and_condition_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/cubit/login_cubit.dart';
import 'widgets/dont_have_account_text.dart';
import '../../../core/widgets/app_text_button.dart';
import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listener.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CheckBoxForRememberMe(),
                        Text(
                          'Forgot Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ],
                    ),
                    verticalSpace(36),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteMedium,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermAndConditionText(),
                    verticalSpace(60),
                    const DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState();
    }
  }

  // if (context.read<LoginCubit>().formKey.currentState!.validate()) {
  //   context.read<LoginCubit>().emitLoginState(
  //         LoginRequestBody(
  //           email: context.read<LoginCubit>().emailController.text,
  //           password: context.read<LoginCubit>().passwordController.text,
  //         ),
  //       );
  // } else {
  //   context.read<LoginCubit>().formKey.currentState!.validate();
}
