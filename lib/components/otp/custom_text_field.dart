import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mliq/providers/otp/otp_providers.dart';
import 'package:mliq/theme/app_colors.dart';

class OtpTextField extends ConsumerWidget with AppColorsMixin {
  OtpTextField({
    super.key,
    required this.userInput,
    required this.inputNodes,
    // required this.inputValidator,
    // required this.validationProvider,
  });

  final List<TextEditingController> userInput;
  final List<FocusNode> inputNodes;
  // final bool inputValidator;
  // final bool validationProvider;

  bool inputValidator() {
    if (userInput.every((element) => element.text.isNotEmpty)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isDarkTheme = ref.watch(isDarkThemeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) {
          return SizedBox(
            width: 50,
            child: TextField(
              controller: userInput[index],
              focusNode: inputNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              maxLength: 1,
              cursorColor: Colors.blue,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0),
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                focusColor: Colors.blue,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                counterText: "",
                filled: true,
                hintText: "x",
              ),
              onChanged: (value) {
                if (value.isNotEmpty && index < 5) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
                debugPrint(inputValidator().toString());

                if (inputValidator()) {
                  ref.read(isSubmitEnabledProvider.notifier).state = true;
                } else {
                  ref.read(isSubmitEnabledProvider.notifier).state = false;
                }
              },
              // onAppPrivateCommand: (p0, p1) => {},
            ),
          );
        },
      ),
    );
  }
}
