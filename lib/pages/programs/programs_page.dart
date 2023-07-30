import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'programs_tabs.dart';

class ProgramsPage extends StatelessWidget {
  const ProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Wave on the right side
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 298,
                height: 379,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background/wave.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    toolbarHeight: 120,
                    centerTitle: true,
                    title: Image.asset(
                      'assets/logo/logo.png',
                      height: 43,
                      width: 85.1,
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: Image.asset(
                          'assets/message_icon/group9.png',
                          height: 24,
                          width: 24,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  // Programs
                  const Text(
                    "Programs",
                    style: TextStyle(
                        color: Color(0xff1e1e1e),
                        fontWeight: FontWeight.w900,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 28.0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 336,
                    height: 34,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          wordSpacing: 2.0,
                          color: Color(0xff1e1e1e),
                          height: 1.4,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "it is important to know WHY, HOW, and WHAT to do in\n"
                                "this section. Let`s start at the beginning,",
                          ),
                          TextSpan(
                            style: TextStyle(
                              color: Color(0xff11a4d1),
                            ),
                            text: " click here",
                          ),
                          TextSpan(text: "."),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Expanded(
                    child: ProgramsTabBar(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
