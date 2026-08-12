import 'package:fashion_mania/features/dashboard/view/dashboard_page.dart';
import 'package:fashion_mania/features/sign_in/view/sign_in_page.dart';
import 'package:fashion_mania/features/verify_code/view/verify_code_page.dart';
import 'package:fashion_mania/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('onboarding → sign in → verify code → dashboard', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const FashionManiaApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Let’s Get Started'));
    await tester.pumpAndSettle();
    expect(find.byType(SignInPage), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign In'));
    await tester.pumpAndSettle();
    expect(find.byType(VerifyCodePage), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Verify'));
    await tester.pumpAndSettle();
    expect(find.byType(DashboardPage), findsOneWidget);
  });

  testWidgets('dashboard bottom bar switches to the categories tab', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MaterialApp(home: DashboardPage()));
    await tester.pumpAndSettle();

    // No chat destination — the fourth tab is Categories.
    expect(find.byIcon(Icons.chat_bubble_outline), findsNothing);

    await tester.tap(find.byIcon(Icons.grid_view_rounded));
    await tester.pumpAndSettle();

    expect(find.text('Categories'), findsOneWidget);
    expect(find.text('Coming soon'), findsOneWidget);
  });
}
