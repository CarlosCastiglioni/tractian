import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian/models/asset.dart';
import 'package:tractian/models/location.dart';
import 'package:tractian/modules/assets_module/assets_controller.dart';
import 'package:tractian/modules/assets_module/components/asset_tile.dart';
import 'package:tractian/modules/assets_module/components/location_tile.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final assetsController = Provider.of<AssetsController>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            for (Location location in assetsController.locations)
              if (location.parentId == null) LocationTile(location: location),
            for (Asset asset in assetsController.assets)
              if (asset.parentId == null && asset.locationId == null)
                AssetTile(asset: asset),
          ],
        ),
      ),
    );
  }
}
