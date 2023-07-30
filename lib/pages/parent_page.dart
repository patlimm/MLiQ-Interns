// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mliq/pages/home/account/account_page.dart';
import 'package:mliq/pages/home/programs/programs_page.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({super.key});

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  late List<BottomNavigationBarItem> _bottomNavigationBarItems;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    _initBottomNavigationBarItems();
    _initScreens();
  }

  void _initScreens() {
    // This is the only part if the code you will use.
    // Put your Screens here accordingly -Wrn
    _screens = <Widget>[
      Center(child: Text('Clinical')),
      Center(child: Text('NeuroScore')),
      ProgramsPage(),
      // Center(child: Text('Programs')),
      Center(child: Text('Referral')),

      //
      // routes from this screen are in
      // routes/acccount_tab
      AccountPage(),
    ];
  }

  void _initBottomNavigationBarItems() {
    _bottomNavigationBarItems = const [
      BottomNavigationBarItem(
        icon: Icon(Icons.medical_services_outlined),
        activeIcon: Icon(Icons.medical_services),
        label: 'Clinical',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.explore_outlined),
        activeIcon: Icon(Icons.explore),
        label: 'NeuroScore',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.menu),
        activeIcon: Icon(Icons.menu_book),
        label: 'Programs',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person_2),
        activeIcon: Icon(CupertinoIcons.person_2_fill),
        label: 'Referral',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),
        activeIcon: Icon(Icons.account_circle),
        label: 'Account',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    const myRadius = 35.0;

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(myRadius),
            topLeft: Radius.circular(myRadius),
          ),
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
            onTap: _animatePageChange,
            currentIndex: _selectedIndex,
            items: _bottomNavigationBarItems,
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChange,
        children: _screens,
      ),
    );
  }

  void _onPageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _animatePageChange(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }
}
