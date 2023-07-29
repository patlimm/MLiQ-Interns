import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/pages/home_page.dart';
import 'package:mliq/pages/landing_screen.dart';
// import 'package:mliq/pages/parent_page.dart';
import 'package:mliq/routes/app_route_names.dart';

// This class holds the routes for Bottom Navigation Bar -Wrn
class BottomNavRoutes {
  static Widget _placeHolderWidget(title) => Center(
        child: Text(title),
      );

  // landing screen in clinical
  static Widget _landingScreen() => Scaffold(
        body: Stack(
          children: [
            const Center(
              //will turn this into replaceable screen
              child: LandingScreen(),
            ),
            // this will be the app bar for clinical route
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                foregroundColor: Colors.black,
                leading: const Icon(Icons.arrow_back_ios),
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: const Text('MLiQ'),
                elevation: 0, // Set elevation to 0 to remove the shadow
              ),
            ),
          ],
        ),
      );

  static shellRoute(GlobalKey<NavigatorState> shellNavigatorKey) => ShellRoute(
        navigatorKey: shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            // Call the Widget who will hold the
            // BottomNavigation here
            // then pass @child as param -Wrn
            child: HomePage(
              location: state.matchedLocation,
              child: child,
            ),
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: shellNavigatorKey,
            name: AppRouteNames.clinical,
            path: '/clinical',
            builder: ((context, state) => _landingScreen()),
          ),
          GoRoute(
            name: AppRouteNames.neuroScore,
            path: '/neuro-score',
            builder: ((context, state) =>
                _placeHolderWidget(AppRouteNames.neuroScore)),
          ),
          GoRoute(
            name: AppRouteNames.programs,
            path: '/programs',
            builder: ((context, state) =>
                _placeHolderWidget(AppRouteNames.programs)),
          ),
          GoRoute(
            name: AppRouteNames.referral,
            path: '/referral',
            builder: ((context, state) =>
                _placeHolderWidget(AppRouteNames.referral)),
          ),
          GoRoute(
            name: AppRouteNames.account,
            path: '/account',
            builder: ((context, state) =>
                _placeHolderWidget(AppRouteNames.account)),
          ),
        ],
      );
}
