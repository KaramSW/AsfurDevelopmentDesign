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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: SvgPicture.asset(
                        'assets/Icons/asfurLogo.svg',
                        width: 60,
                        height: 44.475,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Hi,',
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: SizedBox(
                        height: 50,
                        width: 50,

                        child: IconButton(
                          onPressed: () {
                            print('object');
                          },
                          icon: SvgPicture.asset(
                            'assets/Icons/hp_icons/notifi.svg',
                            height: 60,
                            width: 60,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 1000),
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
              const Text('Welcome to the Home Screen!'),
              ElevatedButton(
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
            ],
          ),
        ),
      ),
    );
  }
}
