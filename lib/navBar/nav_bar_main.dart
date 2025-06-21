import 'package:flutter/material.dart';
import 'custom_nav_bar_ui.dart';
import '../screens/home_screen.dart';
import '../screens/explore_screen.dart';
import '../screens/bookings_screen.dart';
import '../screens/account_screen.dart';

class NavBarMain extends StatefulWidget {
  const NavBarMain({super.key});

  @override
  State<NavBarMain> createState() => _NavBarMainState();
}

class _NavBarMainState extends State<NavBarMain> {
  int _selectedIndex = 0;

  // List of widgets for each tab
  final List<Widget> _screens = [
    HomeScreen(),
    ExploreScreen(),
    BookingsScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomNavBarUi(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
