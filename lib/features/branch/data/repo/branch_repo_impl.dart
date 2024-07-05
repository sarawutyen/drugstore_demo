import 'dart:convert';
import 'package:drugstore_demo/core/getit_config.dart';
import 'package:drugstore_demo/core/utils/utilities.dart';
import 'package:drugstore_demo/features/branch/data/models/site.dart';
import 'package:drugstore_demo/features/branch/data/repo/brach_repo.dart';
import 'package:drugstore_demo/features/landing/presentation/cubit/landing_cubit.dart';
import 'package:flutter/services.dart';

class BranchRepoImplement extends BranchRepo {
  @override
  Future<List<Site>> getSites() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/jsons/site-list.json');
      List<dynamic> result = json.decode(jsonString);
      final siteList = result.map((data) {
        Site site = Site.fromJson(data);
        site.isOpen = checkIfSiteIsOpen(site.siteOpenTime, site.siteCloseTime);
        site.siteOpenTime = convertDateFormat(site.siteOpenTime);
        site.siteCloseTime = convertDateFormat(site.siteCloseTime);
        final currentLocation = getIt<LandingCubit>().state.currentLocation;
        site.distance = calculateDistance(
          originLat: currentLocation.latitude,
          originLong: currentLocation.longitude,
          detinationLat: site.location.coordinates.last,
          destinationLong: site.location.coordinates.first,
        );
        return site;
      }).toList();
      siteList.sort(((a, b) {
        final statusComparison = _compareSiteStatus(a.isOpen, b.isOpen);
        if (statusComparison != 0) {
          return statusComparison;
        }
        return a.distance.compareTo(b.distance);
      }));
      return siteList;
    } catch (e) {
      return List.empty();
    }
  }

  int _compareSiteStatus(bool? statusA, bool? statusB) {
    if (statusA == true && statusB != true) {
      return -1;
    } else if (statusA != true && statusB == true) {
      return 1;
    } else {
      return 0;
    }
  }
}
