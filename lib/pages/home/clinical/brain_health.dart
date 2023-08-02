import 'package:flutter/material.dart';
import 'package:mliq/components/clinical_components/introduction_screen.dart';

class BrainHealth extends StatelessWidget {
  const BrainHealth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brain Health'),
      ),
      body: const Center(
        child: IntroductionScreen(
            image: 'lib/assets/clinical/brain_health/brain_health.png',
            title: 'Brain Health',
            subtitle:
                'It is important to know WHY, HOW, and WHAT to do in this section. Let’s start at the beginning, click here.'),
      ),
    );
  }
}
