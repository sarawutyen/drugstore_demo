import 'package:drugstore_demo/modules/landing/landing_page.dart';
import 'package:drugstore_demo/modules/splash/splash.dart';
import 'package:flutter/material.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = {Routes.landing: () => const LandingPage()};

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const Splash());
      case Routes.landing:
        return MaterialPageRoute(builder: (context) => const LandingPage());
      default:
        return MaterialPageRoute(builder: (context) => const Splash());
    }
  }
}
