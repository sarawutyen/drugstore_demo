import 'package:drugstore_demo/modules/splash/splash.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppPages.onGenerateRoute,
      home: const Splash(),
    );
  }
}