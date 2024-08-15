import 'package:doctor_appointment_app/core/helper/extension.dart';
import 'package:doctor_appointment_app/core/routing/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Already have an account?",
            style: TextStyles.font13GreyRegular,
          ),
          TextSpan(
            text: ' sign in',
            style: TextStyles.font13BlueMedium,
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.pushReplacementNamed(Routes.loginScreen),
          ),
        ],
      ),
    );
  }
}
