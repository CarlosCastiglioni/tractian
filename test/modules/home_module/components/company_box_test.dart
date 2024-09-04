import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian/models/company.dart';
import 'package:tractian/modules/home_module/components/company_box.dart';

void main() {
  testWidgets('CompanyBox displays company name and navigates on tap',
      (WidgetTester tester) async {
    final company = Company(id: '1', name: 'Test Company');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CompanyBox(company: company),
        ),
        routes: {
          "/assets": (context) => const Placeholder(),
        },
      ),
    );
    expect(find.text('Test Company'), findsOneWidget);
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();
    expect(find.byType(Placeholder), findsOneWidget);
  });
}
