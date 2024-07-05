import 'package:drugstore_demo/core/utils/values/asset_paths.dart';
import 'package:drugstore_demo/core/utils/values/colors.dart';
import 'package:drugstore_demo/core/utils/values/text_styles.dart';
import 'package:drugstore_demo/core/getit_config.dart';
import 'package:drugstore_demo/features/landing/cubit/landing_cubit.dart';
import 'package:drugstore_demo/features/widgets/app_primary_button.dart';
import 'package:drugstore_demo/features/widgets/map/cubit/map_cubit.dart';
import 'package:drugstore_demo/features/widgets/map/map_widget.dart';
import 'package:drugstore_demo/features/widgets/app_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'เลือกที่อยู่จัดส่ง',
          style: TextStyleConstants.appBar,
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<MapCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<LandingCubit>(),
          ),
        ],
        child: Stack(
          children: [
            const MapWidget(),
            AppSearchField(
              onSubmitted: (value) {},
              hintText: 'ค้นหาที่อยู่จัดส่งสินค้า',
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomWidget(),
    );
  }

  Widget _buildBottomWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAddressWidget(),
        const SizedBox(
          height: 16.0,
        ),
        AppPrimaryButton(
          text: 'ยืนยันตำแหน่ง',
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildAddressWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      padding: const EdgeInsets.all(12.0),
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
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAddressName(
                  'ที่อยู่* (ตำบล, อำเภอ, จังหวัด, รหัสไปรษณีย์)'),
              _buildAddressDetail(
                  'ซอยวงศ์สว่าง1,บางซื่อ,เมืองนนทบุรี,นนทบุรี,11000,ประเทศไทยประเทศไทยประเทศไทยประเทศไทยประเทศไทย')
            ],
          )),
    );
  }

  Widget _buildAddressName(String addressName) {
    return Text(
      addressName,
      style: TextStyleConstants.textStyle16w700,
    );
  }

  Widget _buildAddressDetail(String adressDetail) {
    return Container(
        margin: const EdgeInsets.only(top: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(color: ColorsConstant.greyE7E7E7, width: 1)),
        child: Row(
          children: [
            SvgPicture.asset(
              SvgAsset.icMarkerRed,
              width: 24.0,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  adressDetail,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyleConstants.textStyle13w400,
                ),
              ),
            ),
            SvgPicture.asset(
              SvgAsset.icGPS,
              width: 24.0,
            ),
          ],
        ));
  }
}
