import 'package:flutter/material.dart';
import 'package:tractian/models/asset.dart';
import 'package:tractian/models/location.dart';
import 'package:tractian/repositories/assets_repository.dart';

class AssetsController extends ChangeNotifier {
  final AssetsRepository assetsRepository;
  List<Location> locations = [];
  List<Asset> assets = [];

  AssetsController({required this.assetsRepository});

  Future getCompanyAssetsAndLocation(String companyId) async {
    locations = await assetsRepository.getCompanyLocations(companyId);
    assets = await assetsRepository.getCompanyAssets(companyId);
    notifyListeners();
  }
}
