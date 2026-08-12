import 'package:go_router/go_router.dart';

import '../../features/complete_profile/view/complete_profile_page.dart';
import '../../features/dashboard/view/dashboard_page.dart';
import '../../features/onboarding/view/onboarding_page.dart';
import '../../features/sign_in/view/sign_in_page.dart';
import '../../features/verify_code/view/verify_code_page.dart';
import 'app_routes.dart';

class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: AppRoutes.verifyCode,
        builder: (context, state) {
          final email = state.extra as String?;
          return VerifyCodePage(
            email: email == null || email.isEmpty ? 'example@email.com' : email,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.completeProfile,
        builder: (context, state) => const CompleteProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const DashboardPage(),
      ),
    ],
  );
}
