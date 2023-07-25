// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mliq/components/custom_icon_text.dart';
import 'package:mliq/components/custom_text_field.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  bool _light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme Page',
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CustomIconText(
                  title: 'Vital Health',
                  subtitle: 'Take a test',
                  backgroudColor: Colors.yellow,
                  foregroudColor: Colors.orange,
                  icon: Icons.heart_broken_rounded,
                  iconColor: Colors.redAccent,
                ),
                CustomIconText(
                  backgroudColor: Colors.black,
                  foregroudColor: Colors.grey,
                  // icon: Icons.yard,
                  // iconColor: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                label: 'Email',
                hintText: 'Enter your email',
                inputController: TextEditingController(),
              ),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                label: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
                inputController: TextEditingController(),
              ),
            ),
            SizedBox(height: 20),
            Switch(
              value: _light,
              onChanged: (bool value) {
                setState(() {
                  _light = value;
                });
              },
            ),
            ElevatedButton(
              child: const Text("Don't Press Me!"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("You're great at following instructions!"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
