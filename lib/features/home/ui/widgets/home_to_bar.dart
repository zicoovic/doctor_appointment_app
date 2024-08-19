import 'package:doctor_appointment_app/core/theming/colors.dart';
import 'package:doctor_appointment_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeToBar extends StatelessWidget {
  const HomeToBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Zico!',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text('How are you Today?', style: TextStyles.font14GreyRegular),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: ColorsManager.moreLighterGray,
          radius: 24.0,
          child: SvgPicture.asset('assets/svgs/notification.svg'),
        )
      ],
    );
  }
}
