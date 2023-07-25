import 'package:flutter/material.dart';
import 'package:mliq/routes/app_route_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MLiQ',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routerConfig: AppRouteConfig.router,
    );
  }
}
