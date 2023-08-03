import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/pages/home/clinical/clinical_components/introduction_screen.dart';
import 'package:mliq/providers/service_provider.dart';
import 'package:mliq/routes/app_route_names.dart';

class FlourishScreen extends ConsumerWidget {
  const FlourishScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    final bgImage = isDarkTheme
        ? const AssetImage('lib/assets/clinical/bgdark.png')
        : const AssetImage('lib/assets/clinical/bg.png');
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLOURISH'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: bgImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: IntroductionScreen(
            image: 'lib/assets/clinical/flourish/flourish_intro.png',
            title: 'Flourish',
            subtitle:
                'It is important to know WHY, HOW, and WHAT to do in this section. Let’s start at the beginning, click here.',
            onPressed: () {
              context.pushNamed(AppRouteNames.flourishAssessment);
            },
          ),
        ),
      ),
    );
  }
}
