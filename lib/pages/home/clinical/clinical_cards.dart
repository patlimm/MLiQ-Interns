import 'package:flutter/material.dart';
import 'package:mliq/providers/service_provider.dart';

class ClinicalCards extends StatefulWidget {
  const ClinicalCards({super.key});

  @override
  State<ClinicalCards> createState() => _ClinicalCardsState();
}

class _ClinicalCardsState extends State<ClinicalCards> {
  List<MyPriorities> cards = [
    MyPriorities(title: 'Breast Examination'),
    MyPriorities(title: 'Pelvic Examination'),
    MyPriorities(title: 'Sample Examination'),
    MyPriorities(title: 'Sample Examination'),
    // Add more cards here
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Prenatal Welness Care',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            MyPriorities card = cards[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: ListTile(
                title: Text(
                  card.title,
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                          card.isFavorite ? Icons.star : Icons.star_border),
                      onPressed: () {
                        setState(() {
                          card.isFavorite = !card.isFavorite;
                        });
                      },
                    ),
                    const Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
