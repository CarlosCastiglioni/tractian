import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian/styles/app_colors.dart';
import 'package:tractian/styles/app_text_styles.dart';
import 'package:tractian/widgets/app_button.dart';

void main() {
  testWidgets('AppButton displays title correctly', (WidgetTester tester) async {
    const testTitle = 'Test Button';
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppButton(
            onPressed: null,
            title: testTitle,
            pressedButton: false,
          ),
        ),
      ),
    );
    expect(find.text(testTitle), findsOneWidget);
  });

  testWidgets('AppButton applies correct style when pressedButton is true',
      (WidgetTester tester) async {
    const testTitle = 'Test Button';
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppButton(
            onPressed: null,
            title: testTitle,
            pressedButton: true,
          ),
        ),
      ),
    );
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.style?.backgroundColor?.resolve({}), AppColors.blue);

    final text = tester.widget<Text>(find.text(testTitle));
    expect(text.style, AppTextStyles.filterButtonWhite);
  });

  testWidgets('AppButton applies correct style when pressedButton is false',
      (WidgetTester tester) async {
    const testTitle = 'Test Button';
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppButton(
            onPressed: null,
            title: testTitle,
            pressedButton: false,
          ),
        ),
      ),
    );

    // Assert
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.style?.backgroundColor?.resolve({}), AppColors.white);

    final text = tester.widget<Text>(find.text(testTitle));
    expect(text.style, AppTextStyles.filterButtonGrey);
  });

  testWidgets('AppButton displays image if provided', (WidgetTester tester) async {
    const testTitle = 'Test Button';
    const testImage = 'lib/assets/bolt.png';
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppButton(
            onPressed: null,
            title: testTitle,
            pressedButton: false,
            image: testImage,
          ),
        ),
      ),
    );
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('AppButton triggers onPressed callback when tapped',
      (WidgetTester tester) async {
    var pressed = false;
    const testTitle = 'Test Button';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton(
            onPressed: () {
              pressed = true;
            },
            title: testTitle,
            pressedButton: false,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(AppButton));
    await tester.pump();
    expect(pressed, isTrue);
  });
}
