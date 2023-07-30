// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/routes/app_route_names.dart';

//
//
// DEPRECATED DON'T USE -Wrn
//
//

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String location;
  final Widget child;

  HomePage({super.key, required this.child, required this.location});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  static List<MyCustomBottomNavBarItem> tabs = [
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.medical_services_outlined),
      activeIcon: Icon(Icons.medical_services),
      label: 'Clinical',
      initialLocation: '/${AppRouteNames.clinical}',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.explore_outlined),
      activeIcon: Icon(Icons.explore),
      label: 'NeuroScore',
      initialLocation: '/${AppRouteNames.neuroScore}',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.menu),
      activeIcon: Icon(Icons.menu_book),
      label: 'Programs',
      initialLocation: '/${AppRouteNames.programs}',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.account_box_outlined),
      activeIcon: Icon(Icons.account_box),
      label: 'Referral',
      initialLocation: '/${AppRouteNames.referral}',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.account_circle_outlined),
      activeIcon: Icon(Icons.account_circle),
      label: 'Account',
      initialLocation: '/${AppRouteNames.account}',
    ),
  ];

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
          child: BottomNavigationBar(
            selectedLabelStyle: TextStyle(fontSize: 10),
            unselectedLabelStyle: TextStyle(fontSize: 10),
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            selectedFontSize: 12,
            unselectedItemColor: Theme.of(context).disabledColor,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              _goOtherTab(context, index);
            },
            currentIndex: _currentIndex,
            items: tabs,
          ),
        ),
      ),
      body: widget.child,
    );
  }

  void _goOtherTab(BuildContext context, int index) {
    if (index == _currentIndex) return;
    String location = tabs[index].initialLocation;

    debugPrint(location);

    setState(() {
      _currentIndex = index;
    });

    context.go(location);
  }
}

class MyCustomBottomNavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  MyCustomBottomNavBarItem({
    required this.initialLocation,
    required Widget icon,
    String? label,
    Widget? activeIcon,
  }) : super(
          icon: icon,
          label: label,
          activeIcon: activeIcon ?? icon,
        );
}
