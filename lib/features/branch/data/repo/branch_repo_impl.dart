import 'dart:convert';
import 'package:drugstore_demo/features/branch/data/models/site.dart';
import 'package:drugstore_demo/features/branch/data/repo/brach_repo.dart';
import 'package:flutter/services.dart';

class BranchRepoImplement extends BranchRepo {
  @override
  Future<List<Site>> getSites() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/jsons/site-list.json');
      List<dynamic> result = json.decode(jsonString);
      return result.map((data) => Site.fromJson(data)).toList();
    } catch (e) {
      return List.empty();
    }
  }
}
