import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian/styles/app_images.dart';
import 'package:tractian/widgets/app_appbar.dart';

void main() {
  testWidgets('AppAppbar displays title text when title is provided',
      (WidgetTester tester) async {
    const String testTitle = 'Test Title';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: AppAppbar(title: testTitle),
        ),
      ),
    );
    expect(find.text(testTitle), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(Image), findsNothing);
  });

  testWidgets('AppAppbar displays logo when title is not provided',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: AppAppbar(),
        ),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Text), findsNothing);
    expect(find.image(const AssetImage(AppImages.logo)), findsOneWidget);
  });

  testWidgets('AppAppbar has a preferred size of 40', (WidgetTester tester) async {
    const AppAppbar appAppbar = AppAppbar();
    expect(appAppbar.preferredSize, const Size.fromHeight(40));
  });
}
