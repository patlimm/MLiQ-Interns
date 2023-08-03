import 'package:go_router/go_router.dart';
import 'package:mliq/pages/home/clinical/assessment/brain_health_assessment.dart';
import 'package:mliq/pages/home/clinical/assessment/flourish_assessment.dart';
import 'package:mliq/pages/home/clinical/assessment/movement_assessment.dart';
import 'package:mliq/pages/home/clinical/assessment/nourish_assessment.dart';
import 'package:mliq/pages/home/clinical/assessment/vital_health_assessment.dart';
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
    path: '${AppRouteNames.clinical}/parent-page',
    builder: ((context, state) => const ClinicalParentPage()),
  ),
  GoRoute(
    name: AppRouteNames.vitalHealth,
    path: '${AppRouteNames.clinical}/vital-health',
    builder: ((context, state) => const VitalHealthScreen()),
  ),
  GoRoute(
    name: AppRouteNames.flourish,
    path: '${AppRouteNames.clinical}/flourish',
    builder: ((context, state) => const FlourishScreen()),
  ),
  GoRoute(
    name: AppRouteNames.brainHealth,
    path: '${AppRouteNames.clinical}/brain-health',
    builder: ((context, state) => const BrainHealth()),
  ),
  GoRoute(
    name: AppRouteNames.nourish,
    path: '${AppRouteNames.clinical}/nourish',
    builder: ((context, state) => const NourishScreen()),
  ),
  GoRoute(
    name: AppRouteNames.movement,
    path: '${AppRouteNames.clinical}/movement',
    builder: ((context, state) => const MovementScreen()),
  ),
  GoRoute(
    name: AppRouteNames.programs,
    path: '${AppRouteNames.clinical}/programs',
    builder: ((context, state) => const ProgramsClinicalScreen()),
  ),
  GoRoute(
    name: AppRouteNames.messages,
    path: '${AppRouteNames.messages}/sample-page',
    builder: ((context, state) => const Messages()),
  ),

  //clinical assessment
  GoRoute(
    name: AppRouteNames.vitalHealthAssessment,
    path: '${AppRouteNames.clinical}/vital-health-assessment',
    builder: ((context, state) => const VitalHealthAssessment()),
  ),
  GoRoute(
    name: AppRouteNames.nourishAssessment,
    path: '${AppRouteNames.clinical}/nourish-assessment',
    builder: ((context, state) => const NourishAssessment()),
  ),
  GoRoute(
    name: AppRouteNames.movementAssessment,
    path: '${AppRouteNames.clinical}/movement-assessment',
    builder: ((context, state) => const MovementAssessment()),
  ),
  GoRoute(
    name: AppRouteNames.flourishAssessment,
    path: '${AppRouteNames.clinical}/flourish-assessment',
    builder: ((context, state) => const FlourishAssessment()),
  ),
  GoRoute(
    name: AppRouteNames.brainHealthAssessment,
    path: '${AppRouteNames.clinical}/brain-health-assessment',
    builder: ((context, state) => const BrainHealthAssessment()),
  ),
];
