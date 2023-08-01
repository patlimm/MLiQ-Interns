// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mliq/theme/app_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget with AppColorsMixin {
  final TextEditingController inputController;
  final String label, hintText;

  bool obscureText;

  CustomTextField({
    super.key,
    required this.inputController,
    required this.label,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = primarySwatch.shade500;
    final secondaryColor = secondarySwatch.shade500;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
          ]),
          child: TextField(
            controller: inputController,
            onChanged: (value) {
              //Do something wi
            },
            obscureText: obscureText,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              // prefixIcon: Icon(Icons.email),
              filled: true,
              hintText: hintText,
              // hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 20.0,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).errorColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
