import 'package:drugstore_demo/core/constants/colors.dart';
import 'package:drugstore_demo/core/constants/text_styles.dart';
import 'package:drugstore_demo/routes/pages.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(Routes.landing);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConstant.primary,
      child: const Center(
        child: DefaultTextStyle(
          style: TestStyleConstants.splashText,
          child: Text(
            'Drug store - Demo',
          ),
        ),
      ),
    );
  }
}
