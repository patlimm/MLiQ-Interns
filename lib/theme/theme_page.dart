// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mliq/components/custom_icon_text.dart';
import 'package:mliq/components/custom_text_field.dart';
import 'package:mliq/providers/service_provider.dart';
import 'package:mliq/theme/app_colors.dart';

// ignore: must_be_immutable
class ThemePage extends ConsumerWidget with AppColorsMixin {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch for the state changes using
    // ref.watch()
    bool isDarkTheme = ref.watch(isDarkThemeProvider);

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
            _renderCustomIcons(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _renderSwitchLabel(context, isDarkTheme),
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
            ElevatedButton(
              child: const Text("Don't Press Me!"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "You're great at following instructions, aren't you?"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderSwitchLabel(BuildContext context, bool isDarkTheme) {
    return Text(
      '${isDarkTheme ? 'Dark' : 'Light'} Mode',
      // style: Theme.of(context).textTheme.titleMedium,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        // The two ff examples accomplishes the same thing.
        //
        // When you use the custom swatch in AppColors
        // it's good to handle the color changes according to the current ThemeMode -Wrn
        // e.g.
        // color: isDarkTheme ? darkSwatch.shade500 : primarySwatch.shade500,
        //
        // If you'll just use the primary color "shade500"
        // just use the primary color from Theme.of(context) -Wrn
        // e.g
        color: Theme.of(context).colorScheme.primary, // uncomment this to test
      ),
    );
  }

  Widget _renderCustomIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        CustomIconText(
          title: 'Vital Health',
          subtitle: 'Take a test',
          backgroudColor: Colors.yellow,
          foregroudColor: Colors.orange,
          icon: 'lib/assets/icons/heart.png',
          iconColor: Colors.redAccent,
        ),
        CustomIconText(
          backgroudColor: Colors.black,
          foregroudColor: Colors.grey,
          // icon: Icons.yard,
          // iconColor: Colors.green,
        ),
      ],
    );
  }
}
