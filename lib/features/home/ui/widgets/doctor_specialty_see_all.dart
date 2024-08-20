import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class DoctorSpecialtySeeAll extends StatelessWidget {
  const DoctorSpecialtySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Doctor Specialty',
              style: TextStyles.font18DarkBlueSemiBold,
            ),
            const Spacer(),
            Text(
              'View all',
              style: TextStyles.font12BlueRegular,
            ),
          ],
        )
      ],
    );
  }
}
