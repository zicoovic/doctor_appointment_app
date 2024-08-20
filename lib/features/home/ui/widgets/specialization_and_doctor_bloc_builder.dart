import 'package:doctor_appointment_app/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_appointment_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_appointment_app/features/home/logic/cubit/home_state.dart';
import 'package:doctor_appointment_app/features/home/ui/widgets/doctor_specialty_list_view.dart';
import 'package:doctor_appointment_app/features/home/ui/widgets/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';

class SpecializationAndDoctorBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (BuildContext context, HomeState state) {
        return state.maybeWhen(
          specializationsLoading: () => setupLoading(),
          specializationsSuccess: (specializationResponseModel) {
            var specializationList =
                specializationResponseModel.specializationDataList;
            return setupSuccess(specializationList);
          },
          specializationsError: (error) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  SizedBox setupError() => const SizedBox.shrink();

  Widget setupSuccess(List<SpecializationsData?>? specializationList) {
    return Expanded(
      child: Column(
        children: [
          DoctorSpecialtyListView(
            specializationList: specializationList ?? [],
          ),
          verticalSpace(24.h),
          DoctorsListView(
            doctorsList: specializationList?[0]?.doctorsList ?? [],
          ),
          verticalSpace(24.h),
        ],
      ),
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      width: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
