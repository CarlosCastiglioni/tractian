import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:tractian/modules/assets_module/assets_controller.dart';
import 'package:tractian/modules/assets_module/assets_page.dart';
import 'package:tractian/modules/assets_module/components/assets_filters.dart';
import 'package:tractian/modules/assets_module/components/locations_list.dart';
import 'package:tractian/repositories/assets_repository.dart';
import 'package:tractian/widgets/app_appbar.dart';

class FakeAssetsController extends AssetsController {
  FakeAssetsController() : super(assetsRepository: FakeAssetsRepository());

  @override
  Future<void> getCompanyAssetsAndLocation(String companyId) async {
    return Future.value();
  }
}

class FakeAssetsRepository extends Mock implements AssetsRepository {}

void main() {
  late FakeAssetsController fakeAssetsController;

  setUp(() {
    fakeAssetsController = FakeAssetsController();
  });

  Widget createWidgetUnderTest(String companyId) {
    return ChangeNotifierProvider<AssetsController>.value(
      value: fakeAssetsController,
      child: MaterialApp(
        home: Builder(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AssetsPage(),
                  settings: RouteSettings(arguments: companyId),
                ),
              );
            });
            return Container();
          },
        ),
      ),
    );
  }

  testWidgets('AssetsPage displays AppAppbar, AssetsFilters, and LocationsList',
      (WidgetTester tester) async {
    const companyId = 'mock_company_id';

    await tester.pumpWidget(createWidgetUnderTest(companyId));

    await tester.pumpAndSettle();
    expect(find.byType(AppAppbar), findsOneWidget);
    expect(find.text('Assets'), findsOneWidget);
    expect(find.byType(AssetsFilters), findsOneWidget);
    expect(find.byType(LocationsList), findsOneWidget);
  });
}
