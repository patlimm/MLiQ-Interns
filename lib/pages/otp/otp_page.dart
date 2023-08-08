import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mliq/components/otp/custom_text_field.dart';
import 'package:mliq/components/otp/resend_button.dart';
import 'package:mliq/components/otp/submit_button.dart';
import 'package:mliq/pages/auth/login_page.dart';
import 'package:mliq/providers/service_provider.dart';
import 'package:mliq/providers/otp/otp_providers.dart';
import 'package:mliq/theme/app_colors.dart';

// ignore: must_be_immutable
class OTP extends ConsumerWidget with AppColorsMixin {
  OTP({super.key});

  List<TextEditingController> userInput =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> inputNodes = List.generate(6, (index) => FocusNode());
  String code = "";
  String phone = "+639123456789";

  Future<bool> otpGenerator() {
    code = String.fromCharCodes(
      Iterable.generate(
        6,
        (_) => "0123456789".codeUnitAt(
          Random().nextInt(10),
        ),
      ),
    );

    // put otp sender function here that returns true (if succeeds) and false (if failed)
    return _sendSMS();
  }

  Future<bool> _sendSMS() async {
    // String result = await sendSMS(
    //   message: code,
    //   recipients: [
    //     phone,
    //   ],
    // ).catchError((onError) {
    //   print(onError);
    // });
    // print(result);
    var future = Future.delayed(const Duration(seconds: 5), () => true);
    return future;
  }

  submitHandler(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Verification Code"),
          content: Text(code == inputFormatter()
              ? 'Verification Successful'
              : 'Code incorrect, please try again ${inputFormatter()}'),
        );
      },
    );
  }

  String inputFormatter() {
    String formattedInputs = "";
    for (var controller in userInput) {
      formattedInputs += controller.text;
    }
    return formattedInputs;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    bool isSubmitEnabled = ref.watch(isSubmitEnabledProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // bool result;
      if (isSubmitEnabled) {
        ref.read(isDarkThemeProvider.notifier).state = false;
      }
      if (await otpGenerator()) {
        for (int index = 0; index < 6; index++) {
          userInput[index].text = code[index];
        }
        // ignore: use_build_context_synchronously
        submitHandler(context);
      }
      // try{

      // }
    });
    return Scaffold(
      // appBar
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
          color: isDarkTheme ? Colors.white : Colors.black,
          iconSize: 45.0,
        ),
        title: Image(
          image: AssetImage(
              'lib/assets/otp/${isDarkTheme ? 'dark_logo.png' : 'light_logo.png'}'),
          fit: BoxFit.contain,
          height: isDarkTheme ? 33 : 40,
        ),
        toolbarHeight: 55,
        centerTitle: true,
        excludeHeaderSemantics: true,
        elevation: 0,
        backgroundColor: isDarkTheme
            ? Theme.of(context).colorScheme.background
            : Colors.white,
      ),

      // body
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Body's main text
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "2-Step Verification",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "A text message with a verification code was just sent to ****-****-*98",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // 6-digit Inputs
            const SizedBox(height: 22),
            OtpTextField(
              userInput: userInput,
              inputNodes: inputNodes,
            ),

            // Submit Button
            const SizedBox(height: 26),
            SubmitButton(
              userInput: userInput,
              callbackFunction: () {
                submitHandler(context);
              },
              validationProvider: isSubmitEnabled,
            ),

            // Resend Button
            const SizedBox(height: 52),
            ResendButton(
              callbackFunction: otpGenerator(),
              userInput: userInput,
              parentContext: context,
              code: code,
            ),
          ],
        ),
      ),
    );
  }
}
