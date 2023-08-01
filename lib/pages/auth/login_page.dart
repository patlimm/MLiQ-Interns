// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/routes/app_route_names.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(' Parent Page '),
              onPressed: () {
                context.goNamed(AppRouteNames.parent);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Theme Page'),
              onPressed: () {
                context.pushNamed(AppRouteNames.themePage);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Onboarding Page'),
              onPressed: () {
                context.pushNamed(AppRouteNames.onboarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
