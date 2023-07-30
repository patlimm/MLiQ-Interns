import 'package:go_router/go_router.dart';
import 'package:mliq/pages/home/clinical/brain_health.dart';
import 'package:mliq/pages/home/clinical/flourish.dart';
import 'package:mliq/pages/home/clinical/landing_screen.dart';
import 'package:mliq/pages/home/clinical/movement.dart';
import 'package:mliq/pages/home/clinical/nourish.dart';
import 'package:mliq/pages/home/clinical/programs_clinical.dart';
import 'package:mliq/pages/home/clinical/vital_health.dart';
import 'package:mliq/pages/home/message.dart';
import 'package:mliq/routes/app_route_names.dart';

final List<GoRoute> clinicalRoutes = [
  GoRoute(
    name: AppRouteNames.clinical,
    path: '${AppRouteNames.clinical}/sample-page',
    builder: ((context, state) => const ClinicalParentPage()),
  ),
  GoRoute(
    name: AppRouteNames.vitalHealth,
    path: '${AppRouteNames.vitalHealth}/sample-page',
    builder: ((context, state) => const VitalHealthScreen()),
  ),
  GoRoute(
    name: AppRouteNames.flourish,
    path: '${AppRouteNames.flourish}/sample-page',
    builder: ((context, state) => const FlourishScreen()),
  ),
  GoRoute(
    name: AppRouteNames.brainHealth,
    path: '${AppRouteNames.brainHealth}/sample-page',
    builder: ((context, state) => const BrainHealth()),
  ),
  GoRoute(
    name: AppRouteNames.nourish,
    path: '${AppRouteNames.nourish}/sample-page',
    builder: ((context, state) => const NourishScreen()),
  ),
  GoRoute(
    name: AppRouteNames.movement,
    path: '${AppRouteNames.movement}/sample-page',
    builder: ((context, state) => const MovementScreen()),
  ),
  GoRoute(
    name: AppRouteNames.programs,
    path: '${AppRouteNames.programs}/sample-page',
    builder: ((context, state) => const ProgramsClinicalScreen()),
  ),
  GoRoute(
    name: AppRouteNames.messages,
    path: '${AppRouteNames.messages}/sample-page',
    builder: ((context, state) => const Messages()),
  ),
];
