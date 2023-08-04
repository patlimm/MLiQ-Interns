import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _isSheetExpanded = false;

  @override
  void initState() {
    super.initState();
    // Automatically toggle the bottom sheet after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      _toggleSheet();
    });
  }

  void _toggleSheet() {
    setState(() {
      _isSheetExpanded = !_isSheetExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: const Color(0xFF564848),
      body: Stack(
        children: [
          AnimatedContainer(
            height: height,
            width: width,
            duration: const Duration(milliseconds: 700),
            child: Image.asset(
              'assets/Splash_assets/background/bg.png',
              fit: BoxFit.fill,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeIn,
            top: _isSheetExpanded ? -height / 2 : 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
                child: Image.asset(
                    'assets/Splash_assets/logo/text-logo-white.png')),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeIn,
            bottom: _isSheetExpanded ? 0 : -height / 2,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(37),
                      topRight: Radius.circular(37))),
              height: height / 2,
              child: const Center(
                child: Text('Expanded BottomSheet Content'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
