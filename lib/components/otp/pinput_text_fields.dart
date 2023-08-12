import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mliq/providers/otp/otp_providers.dart';
import 'package:mliq/theme/app_colors.dart';
import 'package:pinput/pinput.dart';

class PinputOtpTextFields extends ConsumerWidget with AppColorsMixin {
  PinputOtpTextFields({
    super.key,
    required this.userInput,
    required this.code,
  });

  final TextEditingController userInput;
  final String code;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Pinput(
      length: 6,
      onCompleted: (pin) =>
          ref.read(isSubmitEnabledProvider.notifier).state = true,
      onChanged: (pin) {
        if (pin.length < 6) {
          ref.read(isSubmitEnabledProvider.notifier).state = false;
        }
      },
      controller: userInput,
    );
  }
}
