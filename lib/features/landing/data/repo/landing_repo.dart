import 'package:drugstore_demo/core/data_state.dart';
import 'package:drugstore_demo/features/landing/data/models/auto_complete.dart';

import '../models/geocode.dart';
import '../models/place_detail.dart';

abstract class LandingRepo {
  Future<DataState<AutoComplete>> autocomplete(
    String value,
  );

  Future<DataState<PlaceDetail>> findPlaceDetail(
    String placeId,
  );

  Future<DataState<Geocode>> findGeocode(
    String latLng,
  );
}
