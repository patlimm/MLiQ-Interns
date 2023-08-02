import 'package:flutter/material.dart';
import 'package:mliq/components/clinical_components/introduction_screen.dart';

class FlourishScreen extends StatelessWidget {
  const FlourishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLOURISH'),
      ),
      body: const Center(
        child: IntroductionScreen(
            image: 'lib/assets/clinical/flourish/flourish_intro.png',
            title: 'Flourish',
            subtitle:
                'It is important to know WHY, HOW, and WHAT to do in this section. Let’s start at the beginning, click here.'),
      ),
    );
  }
}
