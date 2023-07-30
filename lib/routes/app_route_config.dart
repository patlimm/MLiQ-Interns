import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/pages/auth/login_page.dart';
import 'package:mliq/pages/parent_page.dart';
import 'package:mliq/pages/home/programs/programs_page.dart';
import 'package:mliq/pages/splash_screen/splash_screen.dart';
import 'package:mliq/routes/account_tab/account_tab_route.dart';
import 'package:mliq/routes/app_route_names.dart';
import 'package:mliq/routes/clinical_tab/clinical_tab_route.dart';
import 'package:mliq/routes/neuro_score_tab/neuro_score_route.dart';
import 'package:mliq/routes/programs_tab/programs_tab_route.dart';
import 'package:mliq/routes/referral_tab/referral_tab_route.dart';
import 'package:mliq/theme/theme_page.dart';

class AppRouteConfig {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

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
      GoRoute(
        name: AppRouteNames.parent,
        path: '/parent', // Holds the Bottom Navigation Bar
        builder: ((context, state) => const ParentPage()),
        routes: [
          // spread the routes using ...
          ...clinicalRoutes,
          ...neuroScoreRoutes,
          ...programsRoutes,
          ...referralRoutes,
          ...accountRoutes,
        ],
      ),

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
        path: '/selectPracticeDoctor', // Select a Practice and Doctor Pages
        builder: ((context, state) => const ProgramsPage()),
      ),
      GoRoute(
        name: AppRouteNames.onboarding,
        path: '/onboarding', // Onboarding Page
        builder: ((context, state) => Container()),
      ),

      // Theme Page only
      GoRoute(
        name: AppRouteNames.themePage,
        path: '/theme-page',
        builder: ((context, state) => const ThemePage()),
      ),
    ],
  );
}
