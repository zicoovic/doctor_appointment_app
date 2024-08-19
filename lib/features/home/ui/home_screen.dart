import 'package:doctor_appointment_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/doctors_blue_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20.0, 36.0, 20.0, 28.0),
          child: const Column(
            children: [
              HomeTopBar(),
              DoctorsBlueContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
