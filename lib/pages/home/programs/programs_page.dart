import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'programs_tabs.dart';
import 'package:mliq/providers/service_provider.dart';

class ProgramsPage extends ConsumerWidget {
  const ProgramsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);

    return ProviderScope(
      child: Scaffold(
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
                    title: Image.asset(isDarkTheme
                        ? 'assets/logo/logo-dark.png'
                        : 'assets/logo/logo.png'),
                    actions: <Widget>[
                      IconButton(
                        icon: Image.asset(
                          isDarkTheme
                              ? 'assets/message_icon/group9-dark.png'
                              : 'assets/message_icon/group9.png',
                          height: 24,
                          width: 24,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  // Programs
                  Text(
                    "Programs",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
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
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              wordSpacing: 1.5,
                              height: 1.4,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0,
                            ),
                        children: [
                          const TextSpan(
                            text:
                                "it is important to know WHY, HOW, and WHAT to do in\n"
                                "this section. Let`s start at the beginning,",
                          ),
                          TextSpan(
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            text: " click here",
                          ),
                          const TextSpan(text: "."),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
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
