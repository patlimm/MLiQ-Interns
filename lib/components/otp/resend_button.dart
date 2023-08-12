import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mliq/providers/otp/otp_providers.dart";
import "package:mliq/providers/service_provider.dart";
import "package:mliq/theme/app_colors.dart";

class ResendButton extends ConsumerWidget with AppColorsMixin {
  ResendButton({
    super.key,
    required this.parentContext,
    required this.callbackFunction,
    required this.userInput,
    required this.code,
    // required this.isDarkThemeListener,
  });

  final BuildContext parentContext;
  final Function callbackFunction;
  final TextEditingController userInput;
  final String code;
  // final bool isDarkThemeListener;

  resendHandler(context, code) async {
    try {
      callbackFunction();
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Error"),
            content: Text("Something went wrong, please try again"),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    String code = ref.watch(otpCodeProvider);
    return TextButton(
      onPressed: () {
        resendHandler(parentContext, code);
      },
      child: Text(
        "Resend OTP",
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: isDarkTheme
              ? Theme.of(context).colorScheme.primary
              : Colors.black,
        ),
      ),
    );
  }
}
