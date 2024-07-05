import 'package:drugstore_demo/core/utils/values/asset_paths.dart';
import 'package:drugstore_demo/core/utils/values/text_styles.dart';
import 'package:drugstore_demo/features/widgets/item_branch.dart';
import 'package:drugstore_demo/features/widgets/app_search_field.dart';
import 'package:drugstore_demo/routes/pages.dart';
import 'package:flutter/material.dart';

class BranchPage extends StatefulWidget {
  const BranchPage({super.key});

  @override
  State<BranchPage> createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage> {
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
      body: Column(children: [
        AppSearchField(
          onSubmitted: (value) {},
          hintText: 'ค้นหาสาขา',
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) => ItemBranch(
              iconPrimaryButton: SvgAsset.icMap,
              iconOutLineButton: SvgAsset.icCall,
              onPhoneCall: (value) {},
              onNavigateMap: (value) {
                Navigator.of(context)
                    .pushNamed(Routes.location, arguments: value);
              },
            ),
          ),
        )
      ]),
    );
  }
}
