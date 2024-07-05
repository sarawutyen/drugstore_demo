import 'package:drugstore_demo/core/utils/values/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSearchField extends StatelessWidget {
  
  const AppSearchField({super.key, this.onSubmitted, this.hintText});

  final Function(String)? onSubmitted;
  final String? hintText;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: _buildsSearchField(),
    );
  }

  Widget _buildsSearchField() {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(
          top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.0),
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            prefixIcon: SvgPicture.asset(SvgAsset.icSearch),
            contentPadding: const EdgeInsets.only(top: 8.0, right: 16.0)),
        controller: TextEditingController(),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
