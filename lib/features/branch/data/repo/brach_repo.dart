import 'package:drugstore_demo/features/branch/data/models/site.dart';

abstract class BranchRepo {
  Future<List<Site>> getSites();
}
