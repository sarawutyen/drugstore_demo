import 'package:drugstore_demo/core/utils/values/colors.dart';
import 'package:drugstore_demo/core/getit_config.dart';
import 'package:drugstore_demo/features/widgets/map/cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key, required this.showMyCurrentButton});
  final bool showMyCurrentButton;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  final MapCubit _mapCubit = getIt<MapCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _getCurrentPosition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: state.currentLocation),
              markers: state.markers ?? {},
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController googleMapController) {
                _mapCubit.setMapController(mapController: googleMapController);
              },
            ),
            if (widget.showMyCurrentButton) _buildMyCurrentLocation(),
          ],
        );
      },
    );
  }

  Widget _buildMyCurrentLocation() {
    return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: ElevatedButton(
            onPressed: () {
              _getCurrentPosition();
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: ColorsConstant.greyF3F3F3,
            ),
            child: const Icon(
              Icons.gps_fixed,
              color: ColorsConstant.greyABBAB,
            ),
          ),
        ));
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _mapCubit.updateCurrentLocation(
        LatLng(
          position.latitude,
          position.longitude,
        ),
        autoZoom: true,
        showMarker: true,
      );
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are disabled.,
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission denied.,

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // Permission denied forever.,
      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // Permission granted.,

    return true;
  }
}
