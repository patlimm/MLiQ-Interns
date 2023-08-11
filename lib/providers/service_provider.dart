import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkThemeProvider = StateProvider<bool>((ref) => false);

final pageNumberProvider = StateProvider<int>((ref) => 0);

final List<String> backgroundImages = [
  'lib/assets/onboarding/screen1/ebg@3x.png',
  'lib/assets/onboarding/screen2/ebg@3x.png',
  'lib/assets/onboarding/screen3/ebg@3x.png',
  'lib/assets/onboarding/screen4/ebg@3x.png',
  'lib/assets/onboarding/screen5/ebg@3x.png',
  'lib/assets/onboarding/screen6/ebg@3x.png',
];

class OnboardingQnA {
  final String questions;
  final List<String> answers;

  OnboardingQnA({required this.questions, required this.answers});
}

final List<OnboardingQnA> onboardingQnA = [
  OnboardingQnA(
      questions: 'what is your age range',
      answers: ['18 - 25', '26 - 50', '50 - 65', '65+']),
  OnboardingQnA(
      questions: 'what is your gender',
      answers: ['male', 'female', 'other', 'prefernot to say']),
  OnboardingQnA(
      questions: 'How long have you been under Chiropractic care?',
      answers: [
        'New to Chiropractic',
        'Under care previously',
        'Continuously for one year',
        'Continuously for two years',
        'Continuously for more than two years'
      ]),
  OnboardingQnA(
      questions: 'Have you been using MLiQ for one year or longer?',
      answers: ['yes', 'no']),
  OnboardingQnA(
      questions:
          'How much money have you spent on your health care in the last year?',
      answers: [
        '\$0 - \$2,500',
        '\$2,501 - \$7,500',
        '\$7,501 - \$12,500',
        '\$12,501 - \$20,000',
        '\$20,001 +'
      ]),
  OnboardingQnA(
      questions:
          'How much money have you spent on prescription & over the counter drugs in the past year?',
      answers: [
        '\$0 - \$500',
        '\$501 - \$1,000',
        '\$1,001 - \$1,500',
        '\$1,501 - \$2,000',
        '\$2,001 +'
      ]),
];

class PageChoice {
  final int pageNumber;
  final int selected;

  PageChoice(this.pageNumber, this.selected);

  PageChoice copyWith({int? pageNumber, int? selected}) {
    return PageChoice(
      pageNumber ?? this.pageNumber,
      selected ?? this.selected,
    );
  }
}

class PageChoiceListState extends StateNotifier<List<PageChoice>> {
  PageChoiceListState() : super([]);

  void addPageChoice(int pageNumber, int selected) {
    state = [...state, PageChoice(pageNumber, selected)];
  }

  void updatePageChoice(int index, int newSelected) {
    if (index >= 0 && index < state.length) {
      final updatedChoice = state[index].copyWith(selected: newSelected);
      final newState = List<PageChoice>.from(state);
      newState[index] = updatedChoice;
      state = newState;
    }
  }
}

final pageChoiceListProvider =
    StateNotifierProvider<PageChoiceListState, List<PageChoice>>((ref) {
  return PageChoiceListState();
});
