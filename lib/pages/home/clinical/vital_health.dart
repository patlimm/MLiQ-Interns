import 'package:flutter/material.dart';
import 'package:mliq/components/clinical_components/introduction_screen.dart';

class VitalHealthScreen extends StatelessWidget {
  const VitalHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vital Health'),
      ),
      body: const Center(
        child: IntroductionScreen(
            image: 'lib/assets/clinical/vital_health/vital_health_intro.png',
            title: 'Vital Health',
            subtitle:
                'It is important to know WHY, HOW, and WHAT to do in this section. Let’s start at the beginning, click here'),
      ),
    );
  }
}
