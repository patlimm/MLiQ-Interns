import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkThemeProvider = StateProvider<bool>((ref) => false);

// class for clinical assessment questions
class Question {
  final int id;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.options});
}
