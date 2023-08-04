// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/routes/app_route_names.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mliq/providers/service_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  double _logoH = 100;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(milliseconds: 500),
      () => setState(
        () {
          _logoH = 110;
        },
      ),
    );

    _initTransition();
    // remove _initTransition() when auth is implemented -Wrn
    // _initAuthentication();
  }

  void _initTransition() {
    Future.delayed(
      Duration(seconds: 2),
      () => _initAuthentication(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ref.watch(isDarkThemeProvider);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Material(
        color: isDarkTheme ? Color(0xFF3A2C2C) : Color(0xFF564848),
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              // Wave Top
              PositionedDirectional(
                top: 0,
                end: 0,
                child: Image.asset('assets/Splash_assets/wave_top/wave.png'),
              ),
              // Wave Bottom
              PositionedDirectional(
                bottom: 0,
                start: 0,
                child: Image.asset(
                    'assets/Splash_assets/wave_bottom/waveCopy.png'),
              ),
              // Logo Center
              Center(
                child: AnimatedContainer(
                  height: _logoH,
                  duration: Duration(seconds: 2),
                  child: Image.asset(
                      'assets/Splash_assets/logo/text-logo-white.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _initAuthentication() {
    // Handle Auth checks here
    _showIntroPage();
  }

  void _showIntroPage() {
    context.goNamed(AppRouteNames.auth);
  }
}
