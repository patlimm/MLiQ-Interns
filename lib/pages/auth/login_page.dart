// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/components/custom_icon_text.dart';
import 'package:mliq/routes/app_route_names.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CustomIconText(
                  title: 'Vital Health',
                  subtitle: 'Take a test',
                  backgroudColor: Colors.yellow,
                  foregroudColor: Colors.orange,
                  icon: Icons.heart_broken_rounded,
                  iconColor: Colors.redAccent,
                ),
                CustomIconText(
                  backgroudColor: Colors.black,
                  foregroudColor: Colors.grey,
                  // icon: Icons.yard,
                  // iconColor: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Go Home'),
              onPressed: () {
                context.goNamed(AppRouteNames.clinical);
              },
            )
          ],
        ),
      ),
    );
  }
}
