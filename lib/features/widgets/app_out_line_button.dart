import 'package:drugstore_demo/core/utils/values/colors.dart';
import 'package:drugstore_demo/core/utils/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.textStyle,
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
          ? OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    width: 1.0,
                    color: onPressed != null
                        ? ColorsConstant.primary
                        : ColorsConstant.disablePrimary),
              ),
              child: Center(
                  child: Text(
                text,
                style: textStyle ?? TextStyleConstants.outlineButton,
              )),
            )
          : OutlinedButton.icon(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                minimumSize: Size.zero, // Set this
                padding: EdgeInsets.zero,
                side: BorderSide(
                    width: 1.0,
                    color: onPressed != null
                        ? ColorsConstant.primary
                        : ColorsConstant.disablePrimary),
              ),
              icon: SvgPicture.asset(icon!),
              label: Text(
                text,
                style: textStyle ?? TextStyleConstants.outlineButton,
              ),
            ),
    );
  }
}
