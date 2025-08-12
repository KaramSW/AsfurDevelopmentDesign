import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 56, 24, 187),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'My bookings',
                    style: TextStyle(
                      fontFamily: 'Ping',
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 24, 34, 48),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 50,
                    width: 50,

                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/Icons/bookings_icons/supportIcon.svg',
                        height: 50,
                        width: 50,
                      ),
                      padding: EdgeInsets.zero,
                      highlightColor: const Color.fromARGB(80, 158, 158, 158),
                      splashRadius: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
