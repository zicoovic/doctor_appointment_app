import 'package:doctor_appointment_app/features/home/data/models/specialization_response_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/cubit/home_cubit.dart';
import 'specialty_list_view_item.dart';

class SpecialtyListView extends StatefulWidget {
  final List<SpecializationsData?> specializationList;
  const SpecialtyListView({super.key, required this.specializationList});

  @override
  State<SpecialtyListView> createState() => _SpecialtyListViewState();
}

class _SpecialtyListViewState extends State<SpecialtyListView> {
  var selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.specializationList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSpecializationIndex = index;
                });
                context.read<HomeCubit>().getDoctorsList(
                      specializationId: widget.specializationList[index]!.id,
                    );
              },
              child: SpecialtyListViewItem(
                itemIndex: index,
                specializationsData: widget.specializationList[index]!,
                selectedIndex: selectedSpecializationIndex,
              ),
            );
          }),
    );
  }
}
