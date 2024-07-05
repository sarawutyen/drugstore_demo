part of 'landing_cubit.dart';

class LandingState {
  LandingState({
    required this.currentLocation,
    this.currentAddress,
    this.isLoading = false,
  });
  LatLng currentLocation;
  PlaceDetail? currentAddress;
  bool isLoading;

  LandingState copyWith({
    LatLng? currentLocation,
    PlaceDetail? currentAddress,
    bool? isLoading,
  }) {
    return LandingState(
      currentLocation: currentLocation ?? this.currentLocation,
      currentAddress: currentAddress ?? this.currentAddress,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
