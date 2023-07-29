// landing screen in clinical
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mliq/pages/clinical/landing_screen.dart';

class ClinicalHomescreen extends StatelessWidget {
  const ClinicalHomescreen({super.key});

  static Widget _landingScreen() => const LandingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              foregroundColor: Colors.black,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  // Navigate back
                },
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'lib/assets/icons/message.svg',
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {
                      // will go to message screen
                    },
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset('lib/assets/icons/logo.png'),
              ),
              elevation: 0,
            ),
            SliverToBoxAdapter(
              child: _landingScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
