import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkThemeProvider = StateProvider<bool>((ref) => false);

// Sample data for the Tabs
// (MySpecialtyPrograms & History) 
// of Programs Page - Gers
final historyListProvider = StateProvider<List<String>>((ref) => [
      "Alzheimer's",
      "Brain Health",
      "Cleanse / Fatigue",
      "Exercise",
      "Four Core Eating Habits",
      "Gut Restoration",
      "Integrity",
      "Long Haul Covid",
      "Pregnancy",
      "Add more items to the initial list as needed",
    ]);
