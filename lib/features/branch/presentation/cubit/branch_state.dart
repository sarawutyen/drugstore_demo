part of 'branch_cubit.dart';

class BranchState {
  BranchState({
    this.isLoading = false,
    required this.sites,
  });
  bool isLoading;
  List<Site> sites;

  BranchState copyWith({
    bool? isLoading,
    List<Site>? sites,
  }) {
    return BranchState(
      isLoading: isLoading ?? this.isLoading,
      sites: sites ?? this.sites,
    );
  }
}
