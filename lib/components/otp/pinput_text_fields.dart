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

  final defaultPinTheme = const PinTheme(
    height: 50,
    width: 50,
    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      color: Color.fromRGBO(225, 225, 225, 100),
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Colors.blue,
        width: 1.5,
      ),
    );
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      cursor: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "|",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
        ],
      ),
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
