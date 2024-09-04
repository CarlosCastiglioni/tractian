import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:tractian/models/company.dart';
import 'package:tractian/modules/home_module/components/company_box.dart';
import 'package:tractian/modules/home_module/home_controller.dart';
import 'package:tractian/repositories/assets_repository.dart';
import 'package:tractian/modules/home_module/components/companies_list.dart';

class FakeHomeController extends HomeController {
  FakeHomeController() : super(assetsRepository: FakeAssetsRepository()) {
    companies = [];
  }

  @override
  Future<void> getAllCompanies() async {
    return Future.value();
  }
}

class FakeAssetsRepository extends Mock implements AssetsRepository {}

void main() {
  late FakeHomeController fakeHomeController;
  List<Company> mockCompanies = [];

  setUp(() {
    fakeHomeController = FakeHomeController();
    mockCompanies = [
      Company(id: '1', name: 'Company 1'),
      Company(id: '2', name: 'Company 2'),
    ];
    fakeHomeController.companies = mockCompanies;
  });

  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider<HomeController>.value(
      value: fakeHomeController,
      child: const MaterialApp(
        home: Scaffold(
          body: CompaniesList(),
        ),
      ),
    );
  }

  testWidgets('CompaniesList displays a list of CompanyBox widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.byType(CompanyBox), findsNWidgets(mockCompanies.length));
  });
}
