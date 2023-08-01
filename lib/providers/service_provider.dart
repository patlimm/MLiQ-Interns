import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkThemeProvider = StateProvider<bool>((ref) => false);


class MyPriorities {
  final String title;
  bool isFavorite;

  MyPriorities({
    required this.title,
    this.isFavorite = false,
  });
}
