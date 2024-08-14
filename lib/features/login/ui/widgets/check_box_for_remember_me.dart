import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class CheckBoxForRememberMe extends StatelessWidget {
  const CheckBoxForRememberMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) => Checkbox(
            value: context.watch<LoginCubit>().isRememberMe,
            fillColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.selected)) {
                  return ColorsManager.mainBlue;
                }
                return ColorsManager.white;
              },
            ),
            onChanged: (value) {
              context.read<LoginCubit>().toggleRememberMe(value!);
            },
          ),
        ),
        Text(
          'Remember me',
          style: TextStyles.font12LightGreyRegular,
        ),
      ],
    );
  }
}
