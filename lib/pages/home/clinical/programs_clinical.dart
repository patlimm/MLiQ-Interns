import 'package:flutter/material.dart';


class ProgramsClinicalScreen extends StatelessWidget {
  const ProgramsClinicalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programs'),
      ),
      body: const Center(child: Text('Programs')),
    );
  }
}
