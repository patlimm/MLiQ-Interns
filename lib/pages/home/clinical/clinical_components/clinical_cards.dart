import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPriorities {
  final String title;
  bool isFavorite;

  MyPriorities({
    required this.title,
    this.isFavorite = false,
  });
}

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
  List<MyPriorities> favoriteCards = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Opacity(
          opacity: 0.5,
          child: Text(
            'Prenatal Welness Care',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 10),
        //this will show the list of favorites
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: favoriteCards.length,
          itemBuilder: (context, index) {
            MyPriorities card = favoriteCards[index];
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
                onTap: () {},
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: card.isFavorite
                          ? SvgPicture.asset(
                              'lib/assets/clinical/icons/star.svg')
                          : const Icon(Icons.star_border),
                      onPressed: () {
                        setState(() {
                          card.isFavorite = false;
                          favoriteCards.remove(card);
                          if (!card.isFavorite) {
                            cards.add(card);
                          }
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
        const Divider(thickness: 2),
        const Opacity(
          opacity: 0.5,
          child: Text(
            'Prenatal Welness Care',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        //this is the list of all the cards
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
                onTap: () {},
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: card.isFavorite
                          ? SvgPicture.asset(
                              'lib/assets/clinical/icons/star.svg')
                          : const Icon(Icons.star_border),
                      onPressed: () {
                        setState(() {
                          card.isFavorite = !card.isFavorite;
                          if (card.isFavorite) {
                            favoriteCards.add(card);
                            cards.remove(card);
                          } else {
                            favoriteCards.remove(card);
                          }
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
