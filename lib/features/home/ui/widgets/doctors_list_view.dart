import 'package:doctor_appointment_app/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_appointment_app/features/home/ui/widgets/doctors_list_view_items.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key, this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItems(
            doctorsModel: doctorsList?[index]!,
          );
        },
      ),
    );
  }
}
