import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
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
  final Future callbackFunction;
  final List<TextEditingController> userInput;
  final String code;
  // final bool isDarkThemeListener;

  resendHandler(context) async {
    try {
      await callbackFunction;
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
    } finally {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("OTP has been resent"),
            content: Text("New OTP: $code"),
          );
        },
      );
      Future.delayed(
        const Duration(seconds: 5),
        () => {
          for (int index = 0; index < 6; index++)
            {userInput[index].text = code[index]}
        },
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    return TextButton(
      onPressed: () {
        resendHandler(parentContext);
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