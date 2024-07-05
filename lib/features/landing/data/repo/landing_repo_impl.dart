import 'package:drugstore_demo/core/data_state.dart';
import 'package:drugstore_demo/core/services/google_api.dart';
import 'package:drugstore_demo/features/landing/data/models/auto_complete.dart';
import 'package:drugstore_demo/features/landing/data/models/geocode.dart';
import 'package:drugstore_demo/features/landing/data/models/place_detail.dart';
import 'package:drugstore_demo/features/landing/data/repo/landing_repo.dart';

class LandingRepoImplement extends LandingRepo {
  LandingRepoImplement(this._googleApiClient);
  final GoogleApiClient _googleApiClient;

  @override
  Future<DataState<AutoComplete>> autocomplete(String value) async {
    try {
      final AutoComplete autoComplete =
          await _googleApiClient.getListAutoComplete(keyword: value);
      return DataSuccess<AutoComplete>(autoComplete);
    } on Exception catch (e) {
      return DataFailed<AutoComplete>(e);
    }
  }

  @override
  Future<DataState<PlaceDetail>> findPlaceDetail(String placeId) async {
    try {
      final PlaceDetail placeDetail =
          await _googleApiClient.getPlaceDetail(placeId: placeId);
      return DataSuccess<PlaceDetail>(placeDetail);
    } on Exception catch (e) {
      return DataFailed<PlaceDetail>(e);
    }
  }

  @override
  Future<DataState<Geocode>> findGeocode(String latLng) async {
    try {
      final Geocode geocode =
          await _googleApiClient.getAddressFormLocation(latLng: latLng);
      return DataSuccess<Geocode>(geocode);
    } on Exception catch (e) {
      return DataFailed<Geocode>(e);
    }
  }
}
