import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VitalHealthAssessment extends ConsumerWidget {
  const VitalHealthAssessment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Column(
        children: [
          Text(
            'Vital Health',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 9),
          Text(
            'Let us see how your body responds to stress, the environment and traumas.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          //will place the cards here
        ],
      ),
    );
  }
}
