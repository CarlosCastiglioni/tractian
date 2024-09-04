import 'package:tractian/models/asset.dart';
import 'package:tractian/models/company.dart';
import 'package:tractian/models/location.dart';
import 'package:tractian/repositories/app_handler.dart';
import 'package:tractian/repositories/app_routes.dart';

class AssetsRepository {
  Future getAllCompanies() async {
    final response = await AppHandler(
      urlPath: AppRoutes.getAllCompanies,
    ).get();
    List<Company> companies = List<Company>.from(
      response.map((itemJson) => Company.fromJson(itemJson)),
    );
    return companies;
  }

  Future getCompanyLocations(String companyId) async {
    final response = await AppHandler(
      urlPath: '${AppRoutes.getAllCompanies}/$companyId/locations',
    ).get();
    List<Location> locations = List<Location>.from(
      response.map((itemJson) => Location.fromJson(itemJson)),
    );
    return locations;
  }

  Future getCompanyAssets(String companyId) async {
    final response = await AppHandler(
      urlPath: '${AppRoutes.getAllCompanies}/$companyId/assets',
    ).get();
    List<Asset> assets = List<Asset>.from(
      response.map((itemJson) => Asset.fromJson(itemJson)),
    );
    return assets;
  }
}
