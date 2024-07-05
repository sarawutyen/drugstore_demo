import 'package:drugstore_demo/core/utils/values/colors.dart';
import 'package:drugstore_demo/features/landing/landing_page.dart';
import 'package:drugstore_demo/routes/pages.dart';
import 'package:flutter/material.dart';
import 'core/getit_config.dart';

void main() {
  initialGetit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            weight: 40,
            color: ColorsConstant.primary,
          ),
          color: Colors.white,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: AppPages.onGenerateRoute,
      home: const LandingPage(),
    );
  }
}
