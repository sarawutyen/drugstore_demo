import 'package:drugstore_demo/core/utils/values/asset_paths.dart';
import 'package:drugstore_demo/core/utils/values/colors.dart';
import 'package:drugstore_demo/core/utils/values/text_styles.dart';
import 'package:drugstore_demo/features/branch/data/models/site.dart';
import 'package:drugstore_demo/features/widgets/app_out_line_button.dart';
import 'package:drugstore_demo/features/widgets/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemBranch extends StatelessWidget {
  const ItemBranch({
    super.key,
    required this.site,
    this.onPhoneCall,
    this.onNavigateMap,
    this.textPrimaryButton,
    this.textOutLineButton,
    this.iconPrimaryButton,
    this.iconOutLineButton,
  });

  final Function(String)? onPhoneCall;
  final Function(Site)? onNavigateMap;
  final Site site;
  final String? textPrimaryButton;
  final String? textOutLineButton;
  final String? iconPrimaryButton;
  final String? iconOutLineButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
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
          _buildButton(
            onNavigateMap: onNavigateMap,
            onPhoneCall: onPhoneCall,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      {required Function(String)? onPhoneCall,
      required Function(Site)? onNavigateMap}) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: AppOutlineButton(
              text: site.siteTel,
              icon: iconOutLineButton,
              textStyle: TextStyleConstants.textOutline10w500,
              onPressed: !site.isOpen
                  ? () {
                      onPhoneCall?.call(site.siteTel);
                    }
                  : null,
            )),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
            flex: 3,
            child: AppPrimaryButton(
              text: 'แผนที่สาขา',
              icon: iconPrimaryButton,
              textStyle: TextStyleConstants.textPrimary10w500,
              onPressed: !site.isOpen
                  ? () {
                      onNavigateMap?.call(site);
                    }
                  : null,
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
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                site.siteDesc,
                style: TextStyleConstants.textStyle13w700,
              ),
              Text(
                '${site.distance.toStringAsFixed(2)} กม.',
                style: TextStyleConstants.textStyle13w700,
              ),
              Row(
                children: [
                  if (!site.isOpen)
                    const Text(
                      'ปิด ',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  Text(
                    (!site.isOpen)
                        ? '(เปิด ${site.siteOpenTime}-${site.siteCloseTime})'
                        : '(${site.siteOpenTime}-${site.siteCloseTime})',
                    style: (!site.isOpen)
                        ? TextStyleConstants.textStyle13w400
                        : TextStyleConstants.textStyle13w700,
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
