import 'package:fashion_mania/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app opens on the onboarding screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FashionManiaApp());
    await tester.pumpAndSettle();

    expect(find.text('Let’s Get Started'), findsOneWidget);
    expect(find.textContaining('Already have an account?'), findsOneWidget);
  });
}
