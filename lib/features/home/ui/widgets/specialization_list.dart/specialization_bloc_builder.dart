import 'package:doctor_appointment_app/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_appointment_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_appointment_app/features/home/logic/cubit/home_state.dart';
import 'package:doctor_appointment_app/features/home/ui/widgets/doctor_list/doctor_shammer_loading.dart';
import 'package:doctor_appointment_app/features/home/ui/widgets/specialization_list.dart/specialty_list_view.dart';
import 'package:doctor_appointment_app/features/home/ui/widgets/specialization_list.dart/specialty_shimmer_loading.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/spacing.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({super.key});

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
          specializationsSuccess: (specializationDataList) {
            var specializationList = specializationDataList;
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
    return SpecialtyListView(
      specializationList: specializationList ?? [],
    );
  }

  /// shimmer Loading for specialization and doctors
  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialtyShimmerLoading(),
          verticalSpace(8),
          const DoctorShammerLoading(),
        ],
      ),
    );
  }
}
