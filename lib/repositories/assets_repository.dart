import 'package:tractian/models/company.dart';
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

  Future getCompanyLocations() async {
    final response = await AppHandler(
      urlPath: AppRoutes.getCompanyLocations,
    ).get();
    return response;
  }
}
