import 'package:doctor_appointment_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../features/login/ui/login_screen.dart';
import '../../features/onBoarding/on_boarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments is used for passing data from one screen to another
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
