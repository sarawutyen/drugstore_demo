import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit()
      : super(MapState(
            isLoading: false,
            // Default BKK, Thailand
            currentLocation: const LatLng(
              13.736717,
              100.523186,
            )));

  Future<void> loadInitialData() async {
    final stableState = state;
    try {
      emit(state.copyWith(isLoading: true));
      emit(state.copyWith(isLoading: false));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }

  void setMapController({required GoogleMapController mapController}) {
    emit(state.copyWith(mapController: mapController));
  }

  void updateCurrentLocation(LatLng current,
      {bool autoZoom = false, bool showMarker = false}) {
    emit(state.copyWith(currentLocation: current));

    if (showMarker) {
      setMarker(latLng: current);
    }

    if (autoZoom) {
      state.mapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: current, zoom: 14)));
    }
  }

  void zoomTo({double zoonLevel = defaultZoomLevel}) {
    state.mapController?.animateCamera(CameraUpdate.zoomTo(zoonLevel));
  }

  void setMarker({required LatLng latLng}) {
    final markers = state.markers ?? {};
    markers.add(_addMarker(latLng: latLng));
    emit(state.copyWith(markers: markers));
  }

  Marker _addMarker({required LatLng latLng}) {
    return Marker(
      markerId: MarkerId('id_${latLng.latitude}_${latLng.longitude}'),
      position: latLng,
    );
  }

  void clearMarker() {
    emit(state.copyWith(markers: {}));
  }

  void navigateGooleMap() {}
}
