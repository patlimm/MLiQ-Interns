import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mliq/theme/app_colors.dart";

class SubmitButton extends ConsumerWidget with AppColorsMixin {
  SubmitButton({
    super.key,
    required this.userInput,
    required this.callbackFunction,
    required this.validationProvider,
  });

  final Function callbackFunction;
  final List<TextEditingController> userInput;
  final bool validationProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ElevatedButton(
        onPressed: () {
          if (validationProvider) {
            callbackFunction();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: validationProvider
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).disabledColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Submit",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Icon(
                Icons.chevron_right,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
