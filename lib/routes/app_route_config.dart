import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/pages/auth/login_page.dart';
import 'package:mliq/pages/splash_screen/splash_screen.dart';
import 'package:mliq/routes/app_route_names.dart';
import 'package:mliq/routes/bottom_nav_routes.dart';
import 'package:mliq/theme/theme_page.dart';

class AppRouteConfig {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: AppRouteNames.entry,
        path: '/', // Splash Screen Page
        builder: ((context, state) => SplashScreen()),
      ),
      BottomNavRoutes.shellRoute(_shellNavigatorKey),
      GoRoute(
        name: AppRouteNames.auth,
        path: '/auth', // Login and Register Pages
        builder: ((context, state) => const LoginPage()),
      ),
      GoRoute(
        name: AppRouteNames.otp,
        path: '/otp', // OTP Page
        builder: ((context, state) => Container()),
      ),
      GoRoute(
        name: AppRouteNames.subscription,
        path: '/subscription', // Subscription Page
        builder: ((context, state) => Container()),
      ),
      GoRoute(
        name: AppRouteNames.selectPracticeDoctor,
        path: '/selectPracticeDoctor', // Selecta Practice and Doctor Pages
        builder: ((context, state) => Container()),
      ),
      GoRoute(
        name: AppRouteNames.onboarding,
        path: '/onboarding', // Onboarding Page
        builder: ((context, state) => Container()),
      ),

      // Theme Page only
      GoRoute(
        name: AppRouteNames.themePage,
        path: '/theme-page', // Onboarding Page
        builder: ((context, state) => const ThemePage()),
      ),
    ],
  );
}
