// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSubmitEnabledProvider =
    StateProvider.family<bool, List<TextEditingController>>(
        (ref, userInput) => inputChecker(userInput));

bool inputChecker(List<TextEditingController> inputField) {
  if (inputField.every((element) => element.value.text.isEmpty)) {
    return false;
  } else {
    return true;
  }
}
