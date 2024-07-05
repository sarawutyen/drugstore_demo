import 'package:drugstore_demo/core/utils/values/colors.dart';
import 'package:drugstore_demo/core/utils/values/text_styles.dart';
import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({super.key, required this.text, required this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 45.0,
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 24.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsConstant.primary,
          disabledBackgroundColor: ColorsConstant.greyD3D2D2,
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyleConstants.buttonPrimary,
        )),
      ),
    );
  }
}
