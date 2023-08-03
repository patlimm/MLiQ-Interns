import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mliq/components/clinical_components/introduction_screen.dart';
import 'package:mliq/providers/service_provider.dart';

class BrainHealth extends ConsumerWidget {
  const BrainHealth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    final bgImage = isDarkTheme
        ? const AssetImage('lib/assets/clinical/bgdark.png')
        : const AssetImage('lib/assets/clinical/bg.png');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brain Health'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: bgImage,
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: IntroductionScreen(
              image: 'lib/assets/clinical/brain_health/brain_health.png',
              title: 'Brain Health',
              subtitle:
                  'It is important to know WHY, HOW, and WHAT to do in this section. Let’s start at the beginning, click here.'),
        ),
      ),
    );
  }
}