import 'package:drugstore_demo/core/getit_config.dart';
import 'package:drugstore_demo/core/utils/values/asset_paths.dart';
import 'package:drugstore_demo/core/utils/values/colors.dart';
import 'package:drugstore_demo/core/utils/values/text_styles.dart';
import 'package:drugstore_demo/features/branch/data/models/site.dart';
import 'package:drugstore_demo/features/landing/presentation/cubit/landing_cubit.dart';
import 'package:drugstore_demo/features/widgets/item_branch.dart';
import 'package:drugstore_demo/features/widgets/map/presentation/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key, required this.site});

  final Site site;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.site.siteDesc,
          style: TextStyleConstants.appBar,
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
         MapWidget(
            currentLocation: LatLng(widget.site.location.coordinates.last, widget.site.location.coordinates.first),
            autoSetCurrentLocation: false,
            showMyCurrentButton: false,
          ),
          Positioned(
            top: 20,
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 16,
                child: _buildAddressDetail()),
          ),
          Positioned(
            bottom: 30,
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 16,
                child: ItemBranch(
                  site: widget.site,
                  iconPrimaryButton: SvgAsset.icMap,
                  iconOutLineButton: SvgAsset.icCall,
                  onPhoneCall: (value) {},
                  onNavigateMap: (value) {},
                )),
          )
        ],
      ),
    );
  }

  Widget _buildAddressDetail() {
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
          Text(
            'ที่อยู่',
            style: TextStyleConstants.textStyle13w700
                .copyWith(color: ColorsConstant.grey6B6B6B),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Divider(
            height: 1,
            color: ColorsConstant.greyE7E7E7,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            getIt<LandingCubit>()
                    .state
                    .currentAddress
                    ?.result
                    ?.formattedAddress ??
                '-',
            maxLines: 2,
            style: TextStyleConstants.textStyle13w400
                .copyWith(color: ColorsConstant.grey6B6B6B),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
