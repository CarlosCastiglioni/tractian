import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian/modules/assets_module/assets_controller.dart';
import 'package:tractian/modules/assets_module/components/assets_filters.dart';
import 'package:tractian/modules/assets_module/components/locations_list.dart';
import 'package:tractian/widgets/app_appbar.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({super.key});

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (mounted) {
        final companyId = ModalRoute.of(context)!.settings.arguments as String;
        Provider.of<AssetsController>(context, listen: false)
            .getCompanyAssetsAndLocation(companyId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppbar(
        title: 'Assets',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [AssetsFilters(), LocationsList()],
        ),
      ),
    );
  }
}
