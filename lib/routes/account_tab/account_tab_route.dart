import 'package:go_router/go_router.dart';
import 'package:mliq/pages/home/account/sample_page.dart';
import 'package:mliq/routes/app_route_names.dart';

final List<GoRoute> accountRoutes = [
  GoRoute(
    name: AppRouteNames.samplePage,
    path: '${AppRouteNames.account}/sample-page',
    builder: ((context, state) => const SamplePage()),
  ),
];
