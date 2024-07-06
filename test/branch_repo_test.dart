import 'package:drugstore_demo/core/getit_config.dart';
import 'package:drugstore_demo/core/utils/utilities.dart';
import 'package:drugstore_demo/features/branch/data/repo/branch_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initialGetit();
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Getsite from json file test', () async {
    final lists = await BranchRepoImplement().getSites();
    expect(lists.isNotEmpty, true);
    expect(lists.length, 78);
  });

  test('convertDateFormat test', (){
    expect(convertDateFormat('00:00:00'), '00.00');
    expect(convertDateFormat('03:00:00'), '03.00');
    expect(convertDateFormat('17:00:00'), '17.00');
    expect(convertDateFormat('20:30:00'), '20.30');
  });
}
