import 'package:json_annotation/json_annotation.dart';

part 'geocode.g.dart';

@JsonSerializable()
class Geocode {
  factory Geocode.fromJson(Map<String, dynamic> json) =>
      _$GeocodeFromJson(json);
  Geocode({
    this.results,
    this.status,
  });

  @JsonKey(name: 'results')
  List<AddressGeocoding>? results;

  @JsonKey(name: 'status')
  String? status;

  Map<String, dynamic> toJson() => _$GeocodeToJson(this);
}

@JsonSerializable()
class AddressGeocoding {
  factory AddressGeocoding.fromJson(Map<String, dynamic> json) =>
      _$AddressGeocodingFromJson(json);
  AddressGeocoding({
    this.formattedAddress,
    this.geometry,
    this.placeId,
    this.types,
  });
  @JsonKey(name: 'formatted_address')
  String? formattedAddress;

  @JsonKey(name: 'geometry')
  Geometry? geometry;

  @JsonKey(name: 'place_id')
  String? placeId;

  @JsonKey(name: 'types')
  List<String>? types;

  Map<String, dynamic> toJson() => _$AddressGeocodingToJson(this);
}

@JsonSerializable()
class Geometry {
  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
  Geometry({
    this.location,
  });
  @JsonKey(name: 'location')
  Location? location;

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

  @JsonKey(name: 'lat')
  double? lat;

  @JsonKey(name: 'lng')
  double? lng;

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
