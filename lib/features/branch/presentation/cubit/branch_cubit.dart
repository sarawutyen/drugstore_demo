import 'package:bloc/bloc.dart';
import 'package:drugstore_demo/core/getit_config.dart';
import 'package:drugstore_demo/features/branch/data/models/site.dart';
import 'package:drugstore_demo/features/branch/data/repo/brach_repo.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(BranchState(sites: []));

  List<Site> _listOlder = <Site>[];

  void getSites() async {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(microseconds: 500), () async {
      List<Site> sites = await getIt<BranchRepo>().getSites();
      _listOlder = sites;
      emit(state.copyWith(isLoading: false, sites: sites));
    });
  }

  void searchSiteName(String value){
    if(value.isEmpty){
      emit(state.copyWith(sites: _listOlder));
    }else {
      final listFiltered = _listOlder.where((element) => element.siteDesc.contains(value)).toList();
      emit(state.copyWith(sites: listFiltered));
    }
  }
}
