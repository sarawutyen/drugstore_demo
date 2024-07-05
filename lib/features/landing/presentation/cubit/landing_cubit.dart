import 'package:bloc/bloc.dart';
import 'package:drugstore_demo/core/getit_config.dart';
import 'package:drugstore_demo/features/landing/data/models/auto_complete.dart';
import 'package:drugstore_demo/features/landing/data/models/place_detail.dart';
import 'package:drugstore_demo/features/landing/data/repo/landing_repo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit()
      : super(LandingState(
            currentLocation: const LatLng(
          13.736717,
          100.523186,
        )));

  void updateCurrentLocation(LatLng current) {
    emit(state.copyWith(currentLocation: current));
  }

  Future<AutoComplete?> _getAutocomplete(String value) async {
    final result = await getIt<LandingRepo>().autocomplete(value);
    return result.data;
  }

  Future<void> findLocation({required String value}) async {
    emit(state.copyWith(isLoading: true));
    final autoComplete = await _getAutocomplete(value);
    if (autoComplete?.predictions?.isNotEmpty == true) {
      final String placeId = autoComplete!.predictions!.first.placeId ?? '';
      final placeDetail = await getIt<LandingRepo>().findPlaceDetail(placeId);
      emit(state.copyWith(
          isLoading: false,
          currentLocation: LatLng(
              placeDetail.data?.getLatitude ?? state.currentLocation.latitude,
              placeDetail.data?.getLongitude ??
                  state.currentLocation.longitude),
          currentAddress: placeDetail.data ?? PlaceDetail()));
    } else {
      emit(state.copyWith(isLoading: false, currentAddress: PlaceDetail()));
    }
  }

  Future<void> findGeocode() async {
    emit(state.copyWith(isLoading: true));
    final result = await getIt<LandingRepo>().findGeocode(
        '${state.currentLocation.latitude},${state.currentLocation.longitude}');
    if (result.data?.results?.isNotEmpty == true) {
      final String placeId = result.data?.results!.first.placeId ?? '';
      final placeDetail = await getIt<LandingRepo>().findPlaceDetail(placeId);
      emit(state.copyWith(
          isLoading: false, currentAddress: placeDetail.data ?? PlaceDetail()));
    } else {
      emit(state.copyWith(isLoading: false, currentAddress: PlaceDetail()));
    }
  }
}
