// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/routes/app_route_names.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Material(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.blueGrey,
              ],
              begin: const FractionalOffset(1.0, 1.0),
              end: const FractionalOffset(0.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: AnimatedContainer(
              height: _logoH,
              duration: Duration(seconds: 2),
              child: Icon(
                Icons.star,
              ),
              // child: Image(
              //   image: AssetImage('assets/logo/text-logo-white.png'),
              // ),
            ),
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
