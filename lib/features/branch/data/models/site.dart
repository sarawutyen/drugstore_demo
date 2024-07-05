
import 'package:json_annotation/json_annotation.dart';

part 'site.g.dart';

@JsonSerializable()
class Site {
  @JsonKey(name: 'site_id')
  final String siteId;

  @JsonKey(name: 'site_desc')
  final String siteDesc;

  @JsonKey(name: 'site_address')
  final String siteAddress;

  @JsonKey(name: 'site_tel')
  final String siteTel;

  final Location location;

  @JsonKey(name: 'site_close_time')
  String siteCloseTime;

  @JsonKey(name: 'site_open_time')
  String siteOpenTime;

  bool isOpen;
  double distance;

  Site({
    required this.siteId,
    required this.siteDesc,
    required this.siteAddress,
    required this.siteTel,
    required this.location,
    required this.siteCloseTime,
    required this.siteOpenTime,
    this.isOpen = false,
    this.distance = 0.0
  });

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);

  Map<String, dynamic> toJson() => _$SiteToJson(this);
}

@JsonSerializable()
class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}