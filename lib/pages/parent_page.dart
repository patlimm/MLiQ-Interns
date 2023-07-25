// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/routes/app_route_names.dart';

class ParentPage extends StatefulWidget {
  final Widget child;
  final String location;
  const ParentPage({super.key, required this.child, required this.location});

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  int currentPageIndex = 0;

  late List<Widget> _destinations;
  late List<String> _locations;

  @override
  void initState() {
    super.initState();

    _locations = [
      '/${AppRouteNames.clinical}',
      '/${AppRouteNames.neuroScore}',
      '/${AppRouteNames.programs}',
      '/${AppRouteNames.referral}',
      '/${AppRouteNames.account}',
    ];

    _destinations = const [
      NavigationDestination(
        icon: Icon(Icons.medical_services_outlined),
        selectedIcon: Icon(Icons.medical_services),
        label: 'Clinical',
      ),
      NavigationDestination(
        icon: Icon(Icons.explore_outlined),
        selectedIcon: Icon(Icons.explore),
        label: 'NeuroScore',
      ),
      NavigationDestination(
        icon: Icon(Icons.menu),
        selectedIcon: Icon(Icons.menu_book),
        label: 'Programs',
      ),
      NavigationDestination(
        icon: Icon(Icons.account_box_outlined),
        selectedIcon: Icon(Icons.account_box),
        label: 'Referral',
      ),
      NavigationDestination(
        icon: Icon(Icons.account_circle_outlined),
        selectedIcon: Icon(Icons.account_circle),
        label: 'Account',
      ),
    ];
  }

  void _onDestinationSelected(int index) {
    if (index == currentPageIndex) return;

    String location = _locations[index];

    setState(() {
      currentPageIndex = index;
    });

    context.go(location);
  }

  @override
  Widget build(BuildContext context) {
    const myRadius = 35.0;

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(myRadius),
              topLeft: Radius.circular(myRadius)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 7,
              blurRadius: 20,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(myRadius),
            topRight: Radius.circular(myRadius),
          ),
          child: NavigationBar(
            backgroundColor: Colors.white,
            onDestinationSelected: _onDestinationSelected,
            selectedIndex: currentPageIndex,
            destinations: _destinations,
          ),
        ),
      ),
      body: widget.child,
    );
  }
}
