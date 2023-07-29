import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'dart:math';
// import 'package:go_router/go_router.dart';
// import 'package:mliq/components/custom_icon_text.dart';
// import 'package:mliq/routes/app_route_names.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});
  // String numberGenerator() =>
  @override
  Widget build(BuildContext context) {
    return const OTPWidget();
  }
}

class OTPWidget extends StatefulWidget {
  const OTPWidget({super.key});

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
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
  }

  @override
  void initState() {
    super.initState();
    otpGenerator();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                children: [
                  Text(
                    "2-Step Verification",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "A text message with a verification code was just sent to ****-****-*98",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            // 6-digit Inputs
            OtpTextField(
              numberOfFields: 6,
              hasCustomInputDecoration: true,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                fillColor: Color(0x8A000000),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                counterText: "",
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
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.orange.shade800),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),

            // Resend Button
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
              child: const Text("Resend OTP"),
            )
          ],
        ),
      ),
    );
  }
}
