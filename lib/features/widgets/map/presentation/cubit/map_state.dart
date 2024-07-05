part of 'map_cubit.dart';

const double defaultZoomLevel = 10;

class MapState {
  MapState({
    required this.currentLocation,
    this.mapController,
    this.markers,
    this.isLoading = false,
    this.error,
    this.zoomLevel,
  });
  LatLng currentLocation;

  GoogleMapController? mapController;
  Set<Marker>? markers;
  bool isLoading;
  int? zoomLevel = 0;
  String? error;

  MapState copyWith({
    LatLng? currentLocation,
    GoogleMapController? mapController,
    Set<Marker>? markers,
    bool? isLoading,
    String? error,
    int? zoomLevel,
  }) {
    return MapState(
        currentLocation: currentLocation ?? this.currentLocation,
        mapController: mapController ?? this.mapController,
        markers: markers ?? this.markers,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        zoomLevel: zoomLevel ?? this.zoomLevel);
  }
}
