import 'package:flutter/material.dart';
import 'package:flutter_projects/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(19, 60, 19, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/Icons/asfurLogo.svg',
                          width: 60,
                          height: 37.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Hi, ',
                              style: TextStyle(
                                fontFamily: 'Ping',
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Text(
                              'Hassan!',
                              style: TextStyle(
                                fontFamily: 'Ping',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,

                          child: IconButton(
                            onPressed: () {
                              print('object');
                            },
                            icon: SvgPicture.asset(
                              'assets/Icons/hp_icons/notifi.svg',
                              height: 50,
                              width: 50,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Your Compass to \nPossibilities! 🌏✈️',
                          style: TextStyle(
                            fontFamily: 'Ping',
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 24, 34, 48),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Destination',
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 10,
                              minHeight: 10,
                            ),
                            hintStyle: const TextStyle(
                              fontFamily: 'Ping',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 24, 34, 48),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                16.5,
                                0,
                                10.5,
                                0,
                              ),
                              child: SvgPicture.asset(
                                'assets/Icons/hp_icons/searchIcon.svg',
                                width: 20,
                                height: 20,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 208, 213, 221),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 208, 213, 221),
                                width: 1,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48),
                      child: SizedBox(
                        width: double.infinity,
                        height: 38,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discover',
                              style: TextStyle(
                                fontFamily: 'Ping',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 45,
                              child: ElevatedButton(
                                onPressed: () {},
                                style:
                                    ElevatedButton.styleFrom(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      overlayColor: Color.fromARGB(
                                        255,
                                        18,
                                        146,
                                        149,
                                      ),
                                    ).copyWith(
                                      elevation: WidgetStateProperty.all(
                                        0,
                                      ), // No elevation in all states
                                    ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'All',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          18,
                                          146,
                                          149,
                                        ),
                                        fontFamily: 'Ping',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    SvgPicture.asset(
                                      'assets/Icons/hp_icons/allButtonArrowIcon.svg',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: double.infinity,
                        height: 85,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 19),
                                child: _buildCategoryItem(
                                  'assets/Icons/hp_icons/category_icons/relaxationIcon.svg',
                                  'Relaxation',
                                  () {},
                                ),
                              ),
                              _buildCategoryItem(
                                'assets/Icons/hp_icons/category_icons/romanticIcon.svg',
                                'Romantic',
                                () {},
                              ),
                              _buildCategoryItem(
                                'assets/Icons/hp_icons/category_icons/adventureIcon.svg',
                                'Adventure',
                                () {},
                              ),
                              _buildCategoryItem(
                                'assets/Icons/hp_icons/category_icons/luxuryIcon.svg',
                                'Luxury',
                                () {},
                              ),
                              _buildCategoryItem(
                                'assets/Icons/hp_icons/category_icons/culturalIcon.svg',
                                'Cultural',
                                () {},
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 19),
                                child: _buildCategoryItem(
                                  'assets/Icons/hp_icons/category_icons/familyIcon.svg',
                                  'Family',
                                  () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19, top: 42),
                        child: Text(
                          'Top packages',
                          style: TextStyle(
                            fontFamily: 'Ping',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 24, 34, 48),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1000),
                      child: const Text('Welcome to the Home Screen!'),
                    ),
                    Image.asset(
                      'assets/pictures/hp_pictures/ThailandPicture.jpg',
                      width: 160,
                      height: 244,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text('Go Back'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
    String iconPath,
    String label,
    VoidCallback onPressed,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(
                    255,
                    239,
                    229,
                    246,
                  ).withValues(alpha: 0.8), // Shadow color with opacity
                  spreadRadius: 2, // Spread value
                  blurRadius: 9, // Blur value
                  offset: Offset(0, 7), // Offset (horizontal, vertical)
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: const Color.fromARGB(255, 239, 229, 246),
                side: BorderSide(
                  color: const Color.fromARGB(255, 232, 217, 239),
                  width: 1,
                ),
              ),
              child: SvgPicture.asset(iconPath, width: 24, height: 24),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Ping',
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
