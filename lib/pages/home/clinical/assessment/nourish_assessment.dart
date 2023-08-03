import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NourishAssessment extends ConsumerWidget {
  const NourishAssessment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Column(
        children: [
          Text(
            'Nourish',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 9),
          Text(
            'You have probably experience a lifetime of toxicity. Let’s explore how to nourish your body',
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
