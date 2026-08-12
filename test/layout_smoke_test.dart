import 'package:fashion_mania/features/complete_profile/view/complete_profile_page.dart';
import 'package:fashion_mania/features/onboarding/view/onboarding_page.dart';
import 'package:fashion_mania/features/sign_in/view/sign_in_page.dart';
import 'package:fashion_mania/features/verify_code/view/verify_code_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final pages = <String, Widget>{
    'onboarding': const OnboardingPage(),
    'sign in': const SignInPage(),
    'verify code': const VerifyCodePage(email: 'example@email.com'),
    'complete profile': const CompleteProfilePage(),
  };

  pages.forEach((name, page) {
    testWidgets('$name lays out on a 390x844 screen', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(MaterialApp(home: page));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });
  });
}
