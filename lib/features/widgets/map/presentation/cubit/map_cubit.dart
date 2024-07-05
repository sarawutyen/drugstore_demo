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

  void setMapController({required GoogleMapController mapController}) {
    emit(state.copyWith(mapController: mapController));
  }

  void updateCurrentLocation(LatLng current,
      {bool autoZoom = false, bool showMarker = false}) async {
    if (showMarker) {
      clearMarker();
      setMarker(latLng: current);
    }

    if (autoZoom) {
      state.mapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: current, zoom: 14)));
    }
    emit(state.copyWith(isLoading: false, currentLocation: current));
  }

  void zoomTo({required  latLng,double zoomLevel = defaultZoomLevel}) {
    state.mapController?.animateCamera(CameraUpdate.newLatLngZoom(latLng, zoomLevel));
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
