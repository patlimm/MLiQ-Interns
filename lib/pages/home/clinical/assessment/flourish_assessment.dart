import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlourishAssessment extends ConsumerWidget {
  const FlourishAssessment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Column(
        children: [
          Text(
            'Flourish',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 9),
          Text(
            'It is time to take back control of your happiness and fulfillment. It is time to Flourish.',
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
