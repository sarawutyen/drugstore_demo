import 'package:drugstore_demo/core/utils/values/asset_paths.dart';
import 'package:drugstore_demo/core/utils/values/colors.dart';
import 'package:drugstore_demo/core/utils/values/text_styles.dart';
import 'package:drugstore_demo/features/widgets/app_out_line_button.dart';
import 'package:drugstore_demo/features/widgets/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppItemBranch extends StatelessWidget {
  const AppItemBranch({
    super.key,
    this.onPhoneCall,
    this.textPrimaryButton,
    this.textOutLineButton,
    this.iconPrimaryButton,
    this.iconOutLineButton,
  });

  final Function(String)? onPhoneCall;
  final String? textPrimaryButton;
  final String? textOutLineButton;
  final String? iconPrimaryButton;
  final String? iconOutLineButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildsBranchItem(),
    );
  }

  Widget _buildsBranchItem() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 9,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDescription(),
          const SizedBox(
            height: 16.0,
          ),
          const Divider(
            height: 1,
            color: ColorsConstant.greyE7E7E7,
          ),
          const SizedBox(
            height: 16.0,
          ),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Row(
      children: [
        Expanded(
            child: AppOutlineButton(
          text: '02-538-2229 ต่อ 54',
          icon: iconOutLineButton,
          textStyle: TextStyleConstants.textOutline10w500,
          onPressed: () {},
        )),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
            child: AppPrimaryButton(
          text: 'แผนที่สาขา',
          icon: iconPrimaryButton,
          textStyle: TextStyleConstants.textPrimary10w500,
          onPressed: () {},
        )),
      ],
    );
  }

  Widget _buildDescription() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          SvgAsset.icMarker,
          width: 32.0,
        ),
        const SizedBox(
          width: 16.0,
        ),
        const Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'สาขา :',
                style: TextStyleConstants.textStyle13w400,
              ),
              Text(
                'ระยะทางภายในรัศมี :',
                style: TextStyleConstants.textStyle13w400,
              ),
              Text(
                'เวลาเปิดปิดร้าน :',
                style: TextStyleConstants.textStyle13w400,
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'data',
                style: TextStyleConstants.textStyle13w700,
              ),
              Text(
                'data',
                style: TextStyleConstants.textStyle13w700,
              ),
              Row(
                children: [
                  Text(
                    'ปิด',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '(data)',
                    style: TextStyleConstants.textStyle13w700,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
