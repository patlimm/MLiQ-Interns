import 'package:flutter/material.dart';
import 'package:mliq/components/clinical_components/introduction_screen.dart';

class MovementScreen extends StatelessWidget {
  const MovementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movement'),
      ),
      body: const Center(
        child: IntroductionScreen(
            image: 'lib/assets/clinical/movement/movement.png',
            title: 'Movement',
            subtitle:
                'It is important to know WHY, HOW, and WHAT to do in this section. Let’s start at the beginning, click here.'),
      ),
    );
  }
}
