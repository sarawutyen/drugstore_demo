import 'package:bloc/bloc.dart';
import 'package:drugstore_demo/core/getit_config.dart';
import 'package:drugstore_demo/features/branch/data/models/site.dart';
import 'package:drugstore_demo/features/branch/data/repo/brach_repo.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(BranchState(sites: []));

  void getSites() async {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 1),() async {
      List<Site> sites = await getIt<BranchRepo>().getSites();
    emit(state.copyWith(isLoading: false, sites: sites));
    });
  }
}
