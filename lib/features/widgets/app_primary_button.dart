import 'package:drugstore_demo/core/utils/values/colors.dart';
import 'package:drugstore_demo/core/utils/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.icon,
  });

  final String text;
  final String? icon;
  final TextStyle? textStyle;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 45.0,
      child: icon == null
          ? ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsConstant.primary,
                disabledBackgroundColor: ColorsConstant.disablePrimary,
              ),
              child: Center(
                  child: Text(
                text,
                style: textStyle ?? TextStyleConstants.primaryButton,
              )),
            )
          : ElevatedButton.icon(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                minimumSize: Size.zero, // Set this
                padding: EdgeInsets.zero,
                backgroundColor: ColorsConstant.primary,
                disabledBackgroundColor: ColorsConstant.disablePrimary,
              ),
              icon: SvgPicture.asset(
                icon!,
              ),
              label: Text(
                text,
                style: textStyle ?? TextStyleConstants.primaryButton,
              ),
            ),
    );
  }
}
