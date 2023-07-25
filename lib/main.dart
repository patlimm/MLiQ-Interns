import 'package:flutter/material.dart';
import 'package:mliq/routes/app_route_config.dart';
import 'package:mliq/theme/app_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MLiQ',
      theme: AppThemeData().lightTheme(),
      darkTheme: AppThemeData().darkTheme(),
      routerConfig: AppRouteConfig.router,
      // themeMode: ThemeMode.dark,
    );
  }
}
