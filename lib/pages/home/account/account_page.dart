import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/routes/app_route_names.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}
