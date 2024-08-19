import 'package:doctor_appointment_app/features/home/ui/widgets/home_to_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: const Column(
            children: [
              HomeToBar(),
            ],
          ),
        ),
      ),
    );
  }
}
