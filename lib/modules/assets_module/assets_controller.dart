import 'package:flutter/material.dart';
import 'package:tractian/models/asset.dart';
import 'package:tractian/models/location.dart';
import 'package:tractian/repositories/assets_repository.dart';

class AssetsController extends ChangeNotifier {
  final AssetsRepository assetsRepository;
  List<Location> locations = [];
  List<Asset> assets = [];
  List<Asset> allAssets = [];
  List<Location> allLocations = [];
  bool energySensorFilter = false;
  bool criticalStatusFilter = false;

  AssetsController({required this.assetsRepository});

  Future getCompanyAssetsAndLocation(String companyId) async {
    resetFilters();
    allLocations = await assetsRepository.getCompanyLocations(companyId);
    allAssets = await assetsRepository.getCompanyAssets(companyId);
    locations = List.from(allLocations);
    assets = List.from(allAssets);
    notifyListeners();
  }

  void filterCriticalAssets() {
    clearFilters();
    if (!criticalStatusFilter) {
      energySensorFilter = false;
      List<Asset> criticalAssets =
          allAssets.where((asset) => asset.status == 'critical').toList();
      assets = _getAssetsWithParents(criticalAssets);
      updateLocations();
      criticalStatusFilter = true;
    } else {
      resetFilters();
    }
    notifyListeners();
  }

  void filterEnergySensors() {
    clearFilters();
    if (!energySensorFilter) {
      criticalStatusFilter = false;
      List<Asset> energyAssets =
          allAssets.where((asset) => asset.sensorType == 'energy').toList();
      assets = _getAssetsWithParents(energyAssets);
      updateLocations();
      energySensorFilter = true;
    } else {
      resetFilters();
    }
    notifyListeners();
  }

  List<Asset> _getAssetsWithParents(List<Asset> filteredAssets) {
    List<Asset> result = [];
    for (var asset in filteredAssets) {
      result.add(asset);
      var parents = _getParentAssets(asset);
      result.addAll(parents);
    }
    return result.toSet().toList();
  }

  List<Asset> _getParentAssets(Asset asset) {
    List<Asset> parents = [];
    if (asset.parentId != null) {
      var parentAsset = allAssets.firstWhere((parent) => parent.id == asset.parentId,
          orElse: () => Asset(id: '', name: ''));
      if (parentAsset.id.isNotEmpty) {
        if (_shouldIncludeParent(parentAsset)) {
          parents.add(parentAsset);
          parents.addAll(_getParentAssets(parentAsset));
        }
      }
    }
    return parents;
  }

  bool _shouldIncludeParent(Asset parentAsset) {
    return parentAsset.status == 'critical' || parentAsset.sensorType == 'energy';
  }

  void updateLocations() {
    var locationIds = assets
        .where((asset) => asset.locationId != null)
        .map((asset) => asset.locationId!)
        .toSet();
    locations = allLocations.where((location) {
      return locationIds.contains(location.id) ||
          assets.any((asset) => asset.locationId == location.id);
    }).toList();
    locations = _addParentLocations(locations);

    notifyListeners();
  }

  List<Location> _addParentLocations(List<Location> filteredLocations) {
    List<Location> result = List.from(filteredLocations);
    for (var location in filteredLocations) {
      if (location.parentId != null) {
        var parentLocation = allLocations.firstWhere((loc) => loc.id == location.parentId,
            orElse: () => Location(id: '', name: ''));
        if (parentLocation.id.isNotEmpty && !result.contains(parentLocation)) {
          result.add(parentLocation);
        }
      }
    }
    return result;
  }

  void clearFilters() {
    assets.clear();
    locations.clear();
    notifyListeners();
  }

  void resetFilters() {
    assets = List.from(allAssets);
    locations = List.from(allLocations);
    criticalStatusFilter = false;
    energySensorFilter = false;
    notifyListeners();
  }
}
