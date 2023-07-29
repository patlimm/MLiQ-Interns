import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mliq/components/custom_text_field.dart';
import 'package:mliq/providers/service_provider.dart';

import 'package:mliq/theme/app_colors.dart';
import 'package:mliq/theme/app_theme_data.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mliq/components/custom_icon_text.dart';
// import 'package:mliq/routes/app_route_names.dart';

// ignore: must_be_immutable
class OTP extends ConsumerWidget with AppColorsMixin {
  OTP({super.key});

  String input = "";
  String code = "";

  void otpGenerator() {
    code = String.fromCharCodes(
      Iterable.generate(
        6,
        (_) => "0123456789".codeUnitAt(
          Random().nextInt(10),
        ),
      ),
    );

    // put otp sender function here -KaiKai
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      otpGenerator();
    });
    return Scaffold(
      // appBar
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Image(
            image: AssetImage('lib/assets/otp/path3@2x.png'),
            height: 20,
          ),
          iconSize: 45.0,
        ),
        title: const Image(
          image: AssetImage('lib/assets/otp/logo.png'),
          fit: BoxFit.contain,
          height: 40,
        ),
        toolbarHeight: 55,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      // body
      body: Container(
        color: const Color(0xFFFFFFFF),
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
              numberOfFields: 6,
              keyboardType: TextInputType.number,
              hasCustomInputDecoration: true,
              cursorColor: Colors.blue,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
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
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onSubmit: (String verificationCode) {
                input = verificationCode;
              },
            ),

            // Submit Button
            const SizedBox(height: 26),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextButton(
                onPressed: () => {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content:
                            Text('Code entered is $input and the otp is $code'),
                      );
                    },
                  )
                },
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  alignment: Alignment.center,
                  backgroundColor: Colors.orange.shade800,
                  padding: const EdgeInsets.all(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
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
                otpGenerator();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("OTP has been resent"),
                      content: Text("New OTP: $code"),
                    );
                  },
                );
              },
              child: const Text(
                "Resend OTP",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class OTP extends  with AppColorsMixin {
//   const OTP({super.key});

//   @override
//   State<OTP> createState() => _OTPState();
// }

// class _OTPState extends State<OTP> {
  

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
