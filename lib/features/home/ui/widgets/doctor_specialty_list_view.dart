import 'package:doctor_appointment_app/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_appointment_app/features/home/ui/widgets/doctor_specialty_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialtyListView extends StatelessWidget {
  final List<SpecializationsData?> specializationList;
  const DoctorSpecialtyListView({super.key, required this.specializationList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: specializationList.length,
          itemBuilder: (context, index) {
            return DoctorSpecialtyListViewItem(
                itemIndex: index,
                specializationsData: specializationList[index]!);
          }),
    );
  }
}
