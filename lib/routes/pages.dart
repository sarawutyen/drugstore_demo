import 'package:drugstore_demo/features/branch/branch_page.dart';
import 'package:drugstore_demo/features/landing/landing_page.dart';
import 'package:flutter/material.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = {Routes.landing: () => const LandingPage()};

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.landing:
        return MaterialPageRoute(builder: (context) => const LandingPage());
      case Routes.branch:
        return MaterialPageRoute(builder: (context) => const BranchPage());
      default:
        return MaterialPageRoute(builder: (context) => const LandingPage());
    }
  }
}
