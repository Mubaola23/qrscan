import 'package:flutter/material.dart';
import 'package:qrscan/src/feature/dashboard/view/dashboard.dart';

class Routes {
  static const splash = '/splash';
  static const dashboard = "/dashboard";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case onboarding:
      //   return MaterialPageRoute(builder: (_) => OnboardingView());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

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
