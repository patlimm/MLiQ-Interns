import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/pages/home_page.dart';
// import 'package:mliq/pages/parent_page.dart';
import 'package:mliq/routes/app_route_names.dart';

// This class holds the routes for Bottom Navigation Bar -Wrn
class BottomNavRoutes {
  static Widget _placeHolderWidget(title) => Center(
        child: Text(title),
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
            builder: ((context, state) =>
                _placeHolderWidget(AppRouteNames.clinical)),
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
