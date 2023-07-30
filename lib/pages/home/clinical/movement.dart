import 'package:flutter/material.dart';


class MovementScreen extends StatelessWidget {
  const MovementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movement'),
      ),
      body: const Center(child: Text('Movement')),
    );
  }
}
