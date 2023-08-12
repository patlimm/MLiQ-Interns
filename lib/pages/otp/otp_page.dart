import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mliq/components/otp/pinput_text_fields.dart';
import 'package:mliq/components/otp/resend_button.dart';
import 'package:mliq/components/otp/submit_button.dart';
import 'package:mliq/main.dart';
import 'package:mliq/pages/auth/login_page.dart';
import 'package:mliq/providers/service_provider.dart';
import 'package:mliq/providers/otp/otp_providers.dart';
import 'package:mliq/theme/app_colors.dart';
import 'package:telephony/telephony.dart';

// ignore: must_be_immutable
class OTP extends ConsumerWidget with AppColorsMixin {
  OTP({super.key});

  final Telephony telephony = Telephony.instance;

  TextEditingController userInput = TextEditingController();
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
    var future = Future.delayed(const Duration(seconds: 5), () => true);
    return future;
  }

  submitHandler(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Verification Code"),
          content: Text(code == userInput.text
              ? 'Verification Successful'
              : 'Code incorrect, please try again'),
        );
      },
    );
  }

  void showOtp() {
    debugPrint("YOUR OTP IS $code");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    bool isSubmitEnabled = ref.watch(isSubmitEnabledProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (isSubmitEnabled) {
        ref.read(isDarkThemeProvider.notifier).state = false;
      }
      if (await otpGenerator()) {
        // ignore: use_build_context_synchronously
        showOtp();
        telephony.listenIncomingSms(
          onNewMessage: (SmsMessage message) {
            if (message.body == "Your OTP is $code") {
              userInput.text = code;
              submitHandler(context);
            }
          },
          onBackgroundMessage: backgrounMessageHandler,
        );
      }
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
            PinputOtpTextFields(
              userInput: userInput,
              code: code,
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
