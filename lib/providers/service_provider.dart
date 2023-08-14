import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkThemeProvider = StateProvider<bool>((ref) => false);

final List<String> practiceNames = [
  'Adjusting to Health',
  'Advance Care Chiropractic',
  'Alexandria Neck & Back Center',
  'Barham Chiropractic',
  'Bethesda Chiropractic Center a Pamercare Clinic',
  'Better Life Chiropractic & Wellness',
  'Blue Sky Family Wellness Chiropractic',
  'Buffalo Chiropractic',
  'Calliope Chiropractic',
  'Chiro One Edwardsville',
  'Chiro One St. Peters',
  'Chiro One St. Peters',
];

final List<String> doctorNames = [
  'Robin Broff',
  'Nicolas Chen',
  
];

class SelectedPracticeIndexNotifier extends StateNotifier<int> {
  SelectedPracticeIndexNotifier() : super(-1);

  void setSelectedIndex(int index) {
    state = index;
  }
}

final selectedPracticeIndexProvider =
    StateNotifierProvider<SelectedPracticeIndexNotifier, int>((ref) {
  return SelectedPracticeIndexNotifier();
});


final checkboxProvider = StateNotifierProvider<CheckboxNotifier, List<bool>>((ref) {
  return CheckboxNotifier();
});

class CheckboxNotifier extends StateNotifier<List<bool>> {
  CheckboxNotifier() : super([false, false, false, false]);

  void toggleCheckbox(int index) {
    state[index] = !state[index];
    state = [...state]; // Trigger state change
  }
}
