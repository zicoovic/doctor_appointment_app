import 'package:doctor_appointment_app/core/di/dependency_injection.dart';
import 'package:doctor_appointment_app/core/routing/app_router.dart';
import 'package:doctor_appointment_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGetIt();
   // to fix Text being hidden bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
