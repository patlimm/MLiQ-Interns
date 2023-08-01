// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSubmitEnabledProvider = StateProvider<bool>((ref) => false);

// bool inputChecker(List<TextEditingController> inputField) {
//   for (int i = 0; i < 5; i++) {
//     if (inputField[i].text == "") {
//       return false;
//     }
//   }
//   return true;
// }
