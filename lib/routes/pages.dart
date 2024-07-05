import 'package:drugstore_demo/features/branch/data/models/site.dart';
import 'package:drugstore_demo/features/branch/presentation/branch_page.dart';
import 'package:drugstore_demo/features/landing/presentation/landing_page.dart';
import 'package:drugstore_demo/features/location/presentation/location_page.dart';
import 'package:flutter/material.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = {Routes.landing: () => const LandingPage()};

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.landing:
        return MaterialPageRoute(builder: (context) => const LandingPage());
      case Routes.branch:
        return MaterialPageRoute(builder: (context) => const BranchPage());
      case Routes.location:
        Site site = args as Site;
        return MaterialPageRoute(
            builder: (context) => LocationPage(
                  site: site,
                ));
      default:
        return MaterialPageRoute(builder: (context) => const LandingPage());
    }
  }
}
