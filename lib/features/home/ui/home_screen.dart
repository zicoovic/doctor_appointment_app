import 'package:doctor_appointment_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';

import 'widgets/doctor_specialty_see_all.dart';
import 'widgets/doctors_blue_container.dart';
import 'widgets/specialization_and_doctor_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20.0, 36.0, 20.0, 28.0),
          child: Column(
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(24.h),
              const DoctorSpecialtySeeAll(),
              verticalSpace(24.h),
              const SpecializationAndDoctorBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
