import 'dart:html';

import 'package:drugstore_demo/core/utils/values/asset_paths.dart';
import 'package:drugstore_demo/core/utils/values/text_styles.dart';
import 'package:drugstore_demo/features/branch/data/models/site.dart';
import 'package:drugstore_demo/features/branch/presentation/cubit/branch_cubit.dart';
import 'package:drugstore_demo/features/widgets/item_branch.dart';
import 'package:drugstore_demo/features/widgets/app_search_field.dart';
import 'package:drugstore_demo/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BranchPage extends StatefulWidget {
  const BranchPage({super.key});

  @override
  State<BranchPage> createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage> {
  final BranchCubit _branchCubit = BranchCubit();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _branchCubit.getSites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ค้นหาสาขา',
          style: TextStyleConstants.appBar,
        ),
      ),
      body: BlocProvider(
        create: (context) => _branchCubit,
        child: Column(children: [
          AppSearchField(
            onSubmitted: (value) {},
            hintText: 'ค้นหาสาขา',
          ),
          Expanded(
            child: BlocBuilder<BranchCubit, BranchState>(
              builder: (context, state) {
                return Skeletonizer(
                  enabled: state.isLoading,
                  child: ListView.builder(
                    itemCount: state.isLoading ? 10 : state.sites.length,
                    itemBuilder: (context, index) => ItemBranch(
                      site: state.isLoading
                          ? Site(
                              siteId: 'siteId',
                              siteDesc: 'siteDesc',
                              siteAddress: 'siteAddress',
                              siteTel: 'siteTel',
                              location: Location(
                                  type: 'type', coordinates: []),
                              siteCloseTime: 'siteCloseTime',
                              siteOpenTime: 'siteOpenTime')
                          : state.sites[index],
                      iconPrimaryButton: SvgAsset.icMap,
                      iconOutLineButton: SvgAsset.icCall,
                      onPhoneCall: state.isLoading ? null : (value) {},
                      onNavigateMap: state.isLoading
                          ? null
                          : (value) {
                              Navigator.of(context)
                                  .pushNamed(Routes.location, arguments: value);
                            },
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
