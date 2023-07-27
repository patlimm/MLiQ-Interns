// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/components/custom_icon_text.dart';
import 'package:mliq/routes/app_route_names.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // will change the colors and styles in this container into Theme of context -dums
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          // this page will become scrollable in small screen -dums
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Clinical Assessment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  'Take the assessments below to learn more about your level of health in rach wellness domain and receive advice for improvement',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 30),
                Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    CustomIconText(
                      onTap: () {
                        context.goNamed(AppRouteNames.placeholder);
                      },
                      icon: 'lib/assets/icons/heart.png',
                      title: 'Vital Health',
                      subtitle: 'Take a Test',
                      backgroudColor: Color(0xffffb812),
                      foregroudColor: Color(0xffeaa70c),
                    ),
                    CustomIconText(
                      onTap: () {
                        context.goNamed(AppRouteNames.placeholder);
                      },
                      icon: 'lib/assets/icons/tree.png',
                      title: 'Flourish',
                      subtitle: 'Take a Test',
                      backgroudColor: Colors.black,
                      foregroudColor: Colors.grey,
                    ),
                    CustomIconText(
                      onTap: () {
                        context.goNamed(AppRouteNames.placeholder);
                      },
                      icon: 'lib/assets/icons/brain.png',
                      title: 'Brain Health',
                      subtitle: 'Take a Test',
                      backgroudColor: Color(0xff5b3a82),
                      foregroudColor: Color(0xff442864),
                    ),
                    CustomIconText(
                      onTap: () {
                        context.goNamed(AppRouteNames.placeholder);
                      },
                      icon: 'lib/assets/icons/food.png',
                      title: 'Nourish',
                      subtitle: 'Take a Test',
                      backgroudColor: Color(0xff11a4d1),
                      foregroudColor: Color(0xff0d89af),
                    ),
                    CustomIconText(
                      onTap: () {
                        context.goNamed(AppRouteNames.placeholder);
                      },
                      icon: 'lib/assets/icons/muscle.png',
                      title: 'Movement',
                      subtitle: 'Take a Test',
                      backgroudColor: Color(0xFFFF851B),
                      foregroudColor: Color(0xffe05e12),
                    ),
                    CustomIconText(
                      onTap: () {
                        context.goNamed(AppRouteNames.placeholder);
                      },
                      icon: 'lib/assets/icons/books.png',
                      title: 'Programs',
                      subtitle: 'Take a Test',
                      backgroudColor: Color(0xff594b4b),
                      foregroudColor: Color(0xff4c3b3b),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
