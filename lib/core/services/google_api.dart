import 'package:dio/dio.dart';
import 'package:drugstore_demo/core/app_config/constans.dart';
import 'package:drugstore_demo/features/landing/data/models/auto_complete.dart';
import 'package:drugstore_demo/features/landing/data/models/geocode.dart';
import 'package:drugstore_demo/features/landing/data/models/place_detail.dart';
import 'package:retrofit/retrofit.dart';
part 'google_api.g.dart';

@RestApi()
abstract class GoogleApiClient {
  factory GoogleApiClient(Dio dio, {String baseUrl}) = _GoogleApiClient;

  @GET('/place/autocomplete/json?key=$apiKey')
  Future<AutoComplete> getListAutoComplete({
    @Query('input') required String keyword,
  });

  @GET(
      '/place/details/json?key=$apiKey&fields=address_components,place_id,formatted_address,name,geometry')
  Future<PlaceDetail> getPlaceDetail({
    @Query('place_id') required String placeId,
  });


  @GET('/geocode/json?key=$apiKey')
  Future<Geocode> getAddressFormLocation({
    @Query('latlng', encoded: false) required String latLng,
  });

}
