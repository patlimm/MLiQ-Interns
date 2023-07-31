import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/routes/app_route_names.dart';

import '../../../providers/service_provider.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Account'),
        ElevatedButton(
          child: const Text('Sample Page'),
          onPressed: () {
            // call SamplePage()
            // route that were declared in
            // routes/account_tab/account_tab_route.dart
            // -Wrn
            context.pushNamed(AppRouteNames.samplePage);
          },
        ),
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
      ],
    );
  }
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
