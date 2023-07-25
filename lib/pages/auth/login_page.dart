// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/routes/app_route_names.dart';
import 'package:mliq/theme/app_colors.dart';

class LoginPage extends StatelessWidget with AppColors {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(color: primarySwatch.shade500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(' Home Page '),
              onPressed: () {
                context.goNamed(AppRouteNames.clinical);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Theme Page'),
              onPressed: () {
                context.goNamed(AppRouteNames.themePage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
