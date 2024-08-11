import 'package:doctor_appointment_app/core/helper/spacing.dart';
import 'package:doctor_appointment_app/core/theming/styles.dart';
import 'package:doctor_appointment_app/core/widgets/app_text_form_field.dart';
import 'package:doctor_appointment_app/features/login/ui/widgets/term_and_condition_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/colors.dart';
import 'widgets/already_have_account_text.dart';
import '../../../core/widgets/app_text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  bool isTrue = false;
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      verticalSpace(36),
                      const AppTextFormField(hintText: 'Email'),
                      verticalSpace(18),
                      AppTextFormField(
                        hintText: 'password',
                        isObscureText: isObscureText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          icon: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      verticalSpace(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isTrue,
                                fillColor: WidgetStateProperty.resolveWith(
                                  (states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return ColorsManager.mainBlue;
                                    }
                                    return ColorsManager.white;
                                  },
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isTrue = value!;
                                  });
                                },
                              ),
                              Text(
                                'Remember me',
                                style: TextStyles.font12LightGreyRegular,
                              ),
                            ],
                          ),
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
                        onPressed: () {},
                      ),
                      verticalSpace(16),
                      const TermAndConditionText(),
                      verticalSpace(60),
                      const AlreadyHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
