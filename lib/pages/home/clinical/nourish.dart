import 'package:flutter/material.dart';
import 'package:mliq/components/clinical_components/introduction_screen.dart';

class NourishScreen extends StatelessWidget {
  const NourishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nourish'),
      ),
      body: const Center(
        child: IntroductionScreen(
            image: 'lib/assets/clinical/nourish/nourish.png',
            title: 'Nourish',
            subtitle:
                'It is important to know WHY, HOW, and WHAT to do in this section. Let’s start at the beginning, click here.'),
      ),
    );
  }
}
