import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 75, 0, 60),
                  child: SvgPicture.asset(
                    'lib/assets/logo.svg',
                    width: 130,
                    height: 130,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Subtitle 1
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
                        ),

                        // Subtitle 2
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Text(
                            'Log in with Phone Number',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        // Phone Number Input
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 25, 0),
                          child: Transform.translate(
                            offset: Offset(
                              0,
                              0,
                            ), // Adjust the -10 value as needed
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),

                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'SA',
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 16,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      maxLength: 9,
                                      controller: usernameController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        counterText: '',
                                        hintText: 'Phone',
                                        hintStyle: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: Colors.grey,
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Login Button
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 25, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle login action
                              },

                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  242,
                                  244,
                                  247,
                                ),
                                elevation: 0,

                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                    color: const Color.fromARGB(
                                      255,
                                      234,
                                      236,
                                      240,
                                    ),
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: const Color.fromARGB(
                                    255,
                                    152,
                                    162,
                                    179,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Row(children: []),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
