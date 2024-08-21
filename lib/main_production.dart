import 'package:doctor_appointment_app/core/di/dependency_injection.dart';
import 'package:doctor_appointment_app/core/helper/extension.dart';
import 'package:doctor_appointment_app/core/routing/app_router.dart';
import 'package:doctor_appointment_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helper/constant.dart';
import 'core/helper/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // to fix Text being hidden bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  await checkLoggedInUser();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

checkLoggedInUser() async {
  String userToken = await SharedPrefHelper.getString(SharedPrefKeys.userToken);

  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
