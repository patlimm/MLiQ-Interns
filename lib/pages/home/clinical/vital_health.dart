import 'package:flutter/material.dart';

class VitalHealthScreen extends StatelessWidget {
  const VitalHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vital Health'),
      ),
      body: const Center(child: Text('Vital Health')),
    );
  }
}
