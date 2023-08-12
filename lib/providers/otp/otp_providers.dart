// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSubmitEnabledProvider = StateProvider<bool>((ref) => false);

final smsServiceNumbersProvider = StateProvider<List>(
  (ref) => [
    "(650) 555-1212",
    "+1 650 555-6789",
    "+16505556789",
    "6505551212",
  ],
);

final otpCodeProvider = StateProvider<String>((ref) => "");
