import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBarUi extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavBarUi({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<CustomNavBarUi> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBarUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Color.fromARGB(225, 255, 255, 255),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(10, 0, 0, 0),
            spreadRadius: 30,
            blurRadius: 50,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 10),
          child: Theme(
            data: Theme.of(context).copyWith(
              //splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              //splashFactory: NoSplash.splashFactory,
            ),
            child: BottomNavigationBar(
              elevation: 0,
              currentIndex: widget.selectedIndex,
              onTap: widget.onItemTapped,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,

              items: [
                BottomNavigationBarItem(
                  icon: widget.selectedIndex == 0
                      ? SvgPicture.asset(
                          'assets/Icons/navBar/homePageSelectedIcon.svg',
                        )
                      : SvgPicture.asset(
                          'assets/Icons/navBar/homePageIcon.svg',
                        ),
                  label: 'Home',
                ),

                BottomNavigationBarItem(
                  icon: widget.selectedIndex == 1
                      ? SvgPicture.asset(
                          'assets/Icons/navBar/explorePageSelectedIcon.svg',
                        )
                      : SvgPicture.asset(
                          'assets/Icons/navBar/explorePageIcon.svg',
                        ),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: widget.selectedIndex == 2
                      ? SvgPicture.asset(
                          'assets/Icons/navBar/bookingsPageSelectedIcon.svg',
                        )
                      : SvgPicture.asset(
                          'assets/Icons/navBar/bookingsPageIcon.svg',
                        ),

                  label: 'Bookings',
                ),

                BottomNavigationBarItem(
                  icon: widget.selectedIndex == 3
                      ? SvgPicture.asset(
                          'assets/Icons/navBar/accountSelectedIcon.svg',
                        )
                      : SvgPicture.asset('assets/Icons/navBar/accountIcon.svg'),

                  label: 'Account',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
