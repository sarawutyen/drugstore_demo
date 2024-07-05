import 'package:json_annotation/json_annotation.dart';

part 'place_detail.g.dart';

@JsonSerializable()
class PlaceDetail {
  factory PlaceDetail.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailFromJson(json);

  PlaceDetail({
    this.result,
    this.status,
  });

  Result? result;
  String? status;
  Map<String, dynamic> toJson() => _$PlaceDetailToJson(this);

  double? get getLatitude => result?.geometry?.location?.lat;

  double? get getLongitude => result?.geometry?.location?.lng;

  void enrichData() {
    List<AddressComponent>? addressCityComponents = result?.addressComponents
        ?.where((AddressComponent e) =>
            e.types != null && e.types!.contains('administrative_area_level_1'))
        .toList();
    result?.cityName = addressCityComponents?.isNotEmpty == true
        ? addressCityComponents?.first.longName
        : '';

    List<AddressComponent>? addressDistrictComponents =
        result?.addressComponents
            ?.where(
              (AddressComponent e) =>
                  e.types != null &&
                  (e.types!.contains('administrative_area_level_2') ||
                      e.types!.contains('sublocality_level_1')),
            )
            .toList();
    result?.district = addressDistrictComponents?.isNotEmpty == true
        ? addressDistrictComponents?.first.longName
        : '';

    List<AddressComponent>? addressSubDistrictComponents =
        result?.addressComponents
            ?.where(
              (AddressComponent e) =>
                  e.types != null &&
                  (e.types!.contains('administrative_area_level_3') ||
                      e.types!.contains('sublocality_level_2') ||
                      e.types!.contains('locality') ||
                      e.types!.contains('sublocality')),
            )
            .toList();
    result?.subDistrict = addressSubDistrictComponents?.isNotEmpty == true
        ? addressSubDistrictComponents?.first.longName
        : '';

    List<AddressComponent>? addressPostalCodeComponent = result
        ?.addressComponents
        ?.where((AddressComponent e) =>
            e.types != null && e.types!.contains('postal_code'))
        .toList();

    result?.postalCode = addressPostalCodeComponent?.isNotEmpty == true &&
            addressPostalCodeComponent?[0].longName?.isNotEmpty == true
        ? int.tryParse(addressPostalCodeComponent![0].longName!)
        : null;
  }
}

@JsonSerializable()
class Result {
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Result({
    this.addressComponents,
    this.formattedAddress,
    this.geometry,
    this.name,
    this.placeId,
    this.reference,
    this.cityName,
    this.district,
    this.subDistrict,
    this.postalCode,
  });
  @JsonKey(name: 'address_components')
  final List<AddressComponent>? addressComponents;

  @JsonKey(name: 'formatted_address')
  final String? formattedAddress;

  @JsonKey(name: 'place_id')
  final String? placeId;

  Geometry? geometry;
  String? name;
  String? reference;
  String? cityName;
  String? district;
  String? subDistrict;
  int? postalCode;
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class AddressComponent {
  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      _$AddressComponentFromJson(json);
  AddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });
  @JsonKey(name: 'long_name')
  final String? longName;
  @JsonKey(name: 'short_name')
  final String? shortName;
  final List<String>? types;
  Map<String, dynamic> toJson() => _$AddressComponentToJson(this);
}

@JsonSerializable()
class Geometry {
  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
  Geometry({
    this.location,
  });

  final Location? location;
  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Location {
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Location({
    this.lat,
    this.lng,
  });

  final double? lat;
  final double? lng;
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Viewport {
  factory Viewport.fromJson(Map<String, dynamic> json) =>
      _$ViewportFromJson(json);
  Viewport({
    this.northeast,
    this.southwest,
  });

  final Location? northeast;
  final Location? southwest;
  Map<String, dynamic> toJson() => _$ViewportToJson(this);
}

@JsonSerializable()
class PlusCode {
  factory PlusCode.fromJson(Map<String, dynamic> json) =>
      _$PlusCodeFromJson(json);
  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  final String? compoundCode;
  final String? globalCode;
  Map<String, dynamic> toJson() => _$PlusCodeToJson(this);
}
