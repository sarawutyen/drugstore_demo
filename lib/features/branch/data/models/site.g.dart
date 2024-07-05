// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Site _$SiteFromJson(Map<String, dynamic> json) => Site(
      siteId: json['site_id'] as String,
      siteDesc: json['site_desc'] as String,
      siteAddress: json['site_address'] as String,
      siteTel: json['site_tel'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      siteCloseTime: json['site_close_time'] as String,
      siteOpenTime: json['site_open_time'] as String,
    );

Map<String, dynamic> _$SiteToJson(Site instance) => <String, dynamic>{
      'site_id': instance.siteId,
      'site_desc': instance.siteDesc,
      'site_address': instance.siteAddress,
      'site_tel': instance.siteTel,
      'location': instance.location,
      'site_close_time': instance.siteCloseTime,
      'site_open_time': instance.siteOpenTime,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
