// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSubmitEnabledProvider = StateProvider<bool>((ref) => false);

final smsServiceNumberProvider = StateProvider<String>((ref) => "6505551212");

final otpCodeProvider = StateProvider<String>((ref) => "");
