import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian/models/asset.dart';
import 'package:tractian/modules/assets_module/assets_controller.dart';
import 'package:tractian/styles/app_colors.dart';
import 'package:tractian/styles/app_images.dart';

class AssetTile extends StatefulWidget {
  final Asset asset;
  const AssetTile({super.key, required this.asset});

  @override
  State<AssetTile> createState() => _AssetTileState();
}

class _AssetTileState extends State<AssetTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final assetsController = Provider.of<AssetsController>(context);
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: AppColors.transparent),
      child: ExpansionTile(
        minTileHeight: 0,
        tilePadding: EdgeInsets.zero,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.asset.sensorType == null)
              Icon(
                _isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
              ),
            const SizedBox(width: 5),
            Image.asset(
                widget.asset.sensorType == null ? AppImages.asset : AppImages.component),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                widget.asset.name.toUpperCase(),
                softWrap: true,
              ),
            ),
            const SizedBox(width: 5),
            if (widget.asset.sensorType == 'energy') Image.asset(AppImages.bolt),
            if (widget.asset.status == 'critical') Image.asset(AppImages.bolt),
          ],
        ),
        trailing: const SizedBox.shrink(),
        children: [
          for (Asset asset in assetsController.assets)
            if (asset.parentId == widget.asset.id)
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
