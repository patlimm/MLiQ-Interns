import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mliq/providers/service_provider.dart';
import 'package:mliq/routes/app_route_config.dart';
import 'package:mliq/theme/app_theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeData = AppThemeData();
    var isDarkTheme = ref.watch(isDarkThemeProvider);

    return MaterialApp.router(
      title: 'MLiQ',
      debugShowCheckedModeBanner: kDebugMode,
      theme: appThemeData.lightTheme,
      darkTheme: appThemeData.darkTheme,
      routerConfig: AppRouteConfig.router,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
