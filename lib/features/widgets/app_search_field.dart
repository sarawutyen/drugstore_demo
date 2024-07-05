
import 'package:drugstore_demo/core/utils/values/asset_paths.dart';
import 'package:drugstore_demo/core/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({super.key, this.onSubmitted, this.hintText, this.enabled = true});

  final Function(String)? onSubmitted;
  final String? hintText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildsSearchField(),
    );
  }

  Widget _buildsSearchField() {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(
          top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
      child: TextField(
        enabled: enabled,
        maxLines: 1,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorsConstant.greyD3D2D2, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(23.0))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorsConstant.greyD3D2D2, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
                disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorsConstant.greyD3D2D2, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgAsset.icSearch)),
            contentPadding: const EdgeInsets.only(top: 8.0, right: 16.0)),
        controller: TextEditingController(),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
