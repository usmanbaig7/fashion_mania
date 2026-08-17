/// Route paths + names used by [AppRouter].
class AppRoutes {
  const AppRoutes._();

  static const String onboarding = '/';
  static const String signIn = '/sign-in';
  static const String verifyCode = '/verify-code';
  static const String completeProfile = '/complete-profile';
  static const String dashboard = '/dashboard';

  /// Expects the tapped [Product] as the route's `extra`.
  static const String productDetail = '/product-detail';
}
