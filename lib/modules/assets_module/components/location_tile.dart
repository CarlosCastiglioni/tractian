import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian/models/asset.dart';
import 'package:tractian/models/location.dart';
import 'package:tractian/modules/assets_module/assets_controller.dart';
import 'package:tractian/modules/assets_module/components/asset_tile.dart';
import 'package:tractian/styles/app_colors.dart';
import 'package:tractian/styles/app_images.dart';

class LocationTile extends StatefulWidget {
  final Location location;
  const LocationTile({super.key, required this.location});

  @override
  State<LocationTile> createState() => _LocationTileState();
}

class _LocationTileState extends State<LocationTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final assetsController = Provider.of<AssetsController>(context);
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: AppColors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              _isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
            ),
            const SizedBox(width: 5),
            Image.asset(AppImages.location),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.location.name.toUpperCase(),
                softWrap: true,
              ),
            ),
          ],
        ),
        trailing: const SizedBox.shrink(),
        children: [
          for (Location location in assetsController.locations)
            if (location.parentId == widget.location.id)
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: LocationTile(location: location),
              ),
          for (Asset asset in assetsController.assets)
            if (asset.locationId == widget.location.id)
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: AssetTile(asset: asset),
              )
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
      ),
    );
  }
}
