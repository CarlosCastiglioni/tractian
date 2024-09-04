import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian/modules/assets_module/assets_controller.dart';
import 'package:tractian/styles/app_images.dart';
import 'package:tractian/widgets/app_button.dart';

class AssetsFilters extends StatelessWidget {
  const AssetsFilters({super.key});

  @override
  Widget build(BuildContext context) {
    final assetsController = Provider.of<AssetsController>(context);
    return SizedBox(
      height: 85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                onPressed: () {
                  assetsController.filterEnergySensors();
                },
                title: 'Sensor de Energia',
                pressedButton: assetsController.energySensorFilter,
                image: assetsController.energySensorFilter
                    ? AppImages.boltlight
                    : AppImages.boltdark,
              ),
              AppButton(
                image: assetsController.criticalStatusFilter
                    ? AppImages.criticallight
                    : AppImages.critical,
                onPressed: () {
                  assetsController.filterCriticalAssets();
                },
                title: 'Crítico',
                pressedButton: assetsController.criticalStatusFilter,
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
