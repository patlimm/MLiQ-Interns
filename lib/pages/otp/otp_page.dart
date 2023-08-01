import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  String inputFormatter() {
    String formattedInputs = "";
    for (int index = 0; index < 6; index++) {
      formattedInputs += userInput[index].text;
    }
    return formattedInputs;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    bool isSubmitEnabled = ref.watch(isSubmitEnabledProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (await otpGenerator()) {
        for (int index = 0; index < 6; index++) {
          userInput[index].text = code[index];
        }
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
            Row(
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
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
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

                        if (index < 6) {
                          ref.read(isSubmitEnabledProvider.notifier).state =
                              false;
                        } else {
                          ref.read(isSubmitEnabledProvider.notifier).state =
                              true;
                        }
                      },
                    ),
                  );
                },
              ),
            ),

            // Submit Button
            const SizedBox(height: 26),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: ElevatedButton(
                onPressed: () => {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text(code == inputFormatter()
                            ? 'Verification Successful'
                            : 'Code incorrect, please try again'),
                      );
                    },
                  )
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSubmitEnabled
                      ? Theme.of(context).disabledColor
                      : Theme.of(context).colorScheme.primary,
                  // ? Colors.amber[800]
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.chevron_right,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Resend Button
            const SizedBox(height: 52),
            TextButton(
              onPressed: () {
                try {
                  otpGenerator();
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
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: isDarkTheme,
                  onChanged: (bool value) {
                    debugPrint(value.toString());
                    // Get the state value from the isDarkThemeProvider
                    // using ref.read()
                    // then change the value of the state accordingly -Wrn
                    ref.read(isDarkThemeProvider.notifier).state = value;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
