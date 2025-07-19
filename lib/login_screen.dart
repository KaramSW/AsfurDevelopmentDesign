import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'navBar/nav_bar_main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_projects/provider/google_sign_in.dart';
//import 'package:dio/dio.dart';
//import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> otpFocusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );
  bool isPhoneComplete = false;
  bool isTextFieldFocused = false;
  bool showOtpScreen = false;
  bool isOtpComplete = false;

  bool _isDigitKey(LogicalKeyboardKey key) {
    return [
      LogicalKeyboardKey.digit0,
      LogicalKeyboardKey.digit1,
      LogicalKeyboardKey.digit2,
      LogicalKeyboardKey.digit3,
      LogicalKeyboardKey.digit4,
      LogicalKeyboardKey.digit5,
      LogicalKeyboardKey.digit6,
      LogicalKeyboardKey.digit7,
      LogicalKeyboardKey.digit8,
      LogicalKeyboardKey.digit9,
      LogicalKeyboardKey.numpad0,
      LogicalKeyboardKey.numpad1,
      LogicalKeyboardKey.numpad2,
      LogicalKeyboardKey.numpad3,
      LogicalKeyboardKey.numpad4,
      LogicalKeyboardKey.numpad5,
      LogicalKeyboardKey.numpad6,
      LogicalKeyboardKey.numpad7,
      LogicalKeyboardKey.numpad8,
      LogicalKeyboardKey.numpad9,
    ].contains(key);
  }

  @override
  void initState() {
    super.initState();
    usernameController.addListener((_checkPhoneLength));
    phoneFocusNode.addListener((_onFocusChange));

    for (var controller in otpControllers) {
      controller.addListener(() {
        _checkOTPLength();
      });
    }
  }

  void _checkPhoneLength() {
    setState(() {
      isPhoneComplete = usernameController.text.length == 9;
    });
  }

  void _onFocusChange() {
    setState(() {
      isTextFieldFocused = phoneFocusNode.hasFocus;
    });
  }

  void _handleLogin() {
    if (isPhoneComplete) {
      setState(() {
        showOtpScreen = true;
      });
    }
  }

  void _checkOTPLength() {
    setState(() {
      isOtpComplete = otpControllers.every(
        (controller) => controller.text.isNotEmpty,
      );
    });
  }

  void _onOtpChanged(String value, int index) {
    if (value.isNotEmpty) {
      // Move to next field when a digit is entered
      if (index < 5) {
        otpFocusNodes[index + 1].requestFocus();
      }
    } else {
      // Handle backspace - only move to previous field if current field was already empty
      if (index > 0) {
        otpFocusNodes[index - 1].requestFocus();
      }
    }

    _checkOTPLength();
  }

  @override
  void dispose() {
    usernameController.removeListener(_checkPhoneLength);
    phoneFocusNode.removeListener(_onFocusChange);

    for (var controller in otpControllers) {
      controller.removeListener(() {
        _checkOTPLength();
      });
    }

    usernameController.dispose();
    phoneFocusNode.dispose();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in otpFocusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Handle back navigation when on OTP screen
    return PopScope(
      canPop: !showOtpScreen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && showOtpScreen) {
          setState(() {
            showOtpScreen = false;
            for (var controller in otpControllers) {
              controller.clear();
            }
            isOtpComplete = false;
          });
        }
      },

      // Main Scaffold
      child: Scaffold(
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
                  //Asfur Logo
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 75, 0, 60),
                    child: SvgPicture.asset(
                      'assets/Icons/logo.svg',
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
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Ping',
                            ),
                          ),

                          //Login screen (Before OTP)
                          if (!showOtpScreen) ...[
                            // Subtitle 2
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                              child: Text(
                                'Log in with Phone Number',
                                style: TextStyle(
                                  fontFamily: 'Ping',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            // Phone Number Input
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 25, 0),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    top: -4,
                                    left: -4,
                                    right: -4,
                                    height: 60,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: isTextFieldFocused
                                            ? Color.fromARGB(255, 219, 251, 250)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: isTextFieldFocused
                                            ? Color.fromARGB(255, 95, 233, 229)
                                            : Colors.grey.shade300,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        // Country Code Selector
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
                                                  fontFamily: 'Ping',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
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
                                          // Phone Number Input Field
                                          child: TextField(
                                            focusNode: phoneFocusNode,
                                            maxLength: 9,
                                            controller: usernameController,
                                            keyboardType: TextInputType.phone,
                                            decoration: InputDecoration(
                                              counterText: '',
                                              hintText: 'Phone',
                                              hintStyle: TextStyle(
                                                fontFamily: 'Ping',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Colors.grey,
                                              ),
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
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
                                ],
                              ),
                            ),

                            // Login Button
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 25, 0),
                              child: SizedBox(
                                width: double.infinity,
                                child: SizedBox(
                                  height: 52,
                                  child: ElevatedButton(
                                    onPressed: isPhoneComplete
                                        ? _handleLogin
                                        : () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isPhoneComplete
                                          ? Color.fromARGB(255, 18, 146, 149)
                                          : const Color.fromARGB(
                                              255,
                                              242,
                                              244,
                                              247,
                                            ),
                                      elevation: 0,

                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 0,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                          color: isPhoneComplete
                                              ? Color.fromARGB(
                                                  255,
                                                  18,
                                                  146,
                                                  149,
                                                )
                                              : const Color.fromARGB(
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
                                        fontFamily: 'Ping',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: isPhoneComplete
                                            ? Colors.white
                                            : const Color.fromARGB(
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
                            ),

                            // "Or Log in with" Text
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 52, 0, 0),
                              child: Text(
                                'or Log in with',
                                style: TextStyle(
                                  fontFamily: 'Ping',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            // Social Media Login Buttons
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [
                                  //google Button
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        final provider =
                                            Provider.of<GoogleSignInProvider>(
                                              context,
                                              listen: false,
                                            );
                                        await provider.googleLogin();

                                        if (!mounted) return;

                                        if (provider.isUserLoggedIn) {
                                          Navigator.pushReplacement(
                                            // ignore: use_build_context_synchronously
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NavBarMain(),
                                            ),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        padding: const EdgeInsets.all(6),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        minimumSize: Size(40, 40),
                                        fixedSize: Size(40, 40),
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          side: BorderSide(
                                            color: Colors.grey.shade300,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/Icons/googleLogo.svg',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                  ),

                                  //space between buttons
                                  SizedBox(width: 10),

                                  //Apple Button
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Handle Apple login action
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        padding: const EdgeInsets.all(6),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        minimumSize: Size(40, 40),
                                        fixedSize: Size(40, 40),
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          side: BorderSide(
                                            color: Colors.grey.shade300,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/Icons/appleLogo.svg',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]
                          //OTP Screen
                          else ...[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                              child: Text(
                                'Enter OTP',
                                style: TextStyle(
                                  fontFamily: 'Ping',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 25, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //First 3 OTP Fields
                                  ...List.generate(3, (index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                        right: index < 2 ? 8 : 0,
                                      ),
                                      width: 45,
                                      height: 40,
                                      child: KeyboardListener(
                                        focusNode: FocusNode(),
                                        onKeyEvent: (event) {
                                          if (event is KeyDownEvent &&
                                              event.logicalKey ==
                                                  LogicalKeyboardKey
                                                      .backspace) {
                                            // Handle backspace key press
                                            if (index > 0 &&
                                                otpControllers[index]
                                                    .text
                                                    .isEmpty) {
                                              otpFocusNodes[index - 1]
                                                  .requestFocus();
                                            }
                                          } else if (event is KeyDownEvent &&
                                              _isDigitKey(event.logicalKey) &&
                                              otpControllers[index]
                                                  .text
                                                  .isNotEmpty) {
                                            // Handle digit key press
                                            if (index < 5) {
                                              otpFocusNodes[index + 1]
                                                  .requestFocus();
                                            }
                                          }
                                        },
                                        child: TextField(
                                          controller: otpControllers[index],
                                          focusNode: otpFocusNodes[index],
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          maxLength: 1,
                                          showCursor: false,
                                          onChanged: (value) =>
                                              _onOtpChanged(value, index),
                                          decoration: InputDecoration(
                                            hintText: '_',
                                            hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                102,
                                                112,
                                                133,
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsetsGeometry.zero,
                                            counterText: '',
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                  255,
                                                  208,
                                                  213,
                                                  221,
                                                ),
                                                width: 1,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                  255,
                                                  95,
                                                  233,
                                                  229,
                                                ),
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),

                                  // Middle Dash
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                        fontFamily: 'Ping',
                                        fontSize: 30,
                                        color: Color.fromARGB(255, 24, 34, 48),
                                      ),
                                    ),
                                  ),

                                  //Last 3 OTP Fields
                                  ...List.generate(3, (index) {
                                    int actualIndex = index + 3;
                                    return Container(
                                      margin: EdgeInsets.only(
                                        right: index < 2 ? 8 : 0,
                                      ),
                                      width: 45,
                                      height: 40,
                                      child: KeyboardListener(
                                        focusNode: FocusNode(),
                                        onKeyEvent: (event) {
                                          if (event is KeyDownEvent &&
                                              event.logicalKey ==
                                                  LogicalKeyboardKey
                                                      .backspace) {
                                            // Handle backspace key press
                                            if (actualIndex > 0 &&
                                                otpControllers[actualIndex]
                                                    .text
                                                    .isEmpty) {
                                              otpFocusNodes[actualIndex - 1]
                                                  .requestFocus();
                                            }
                                          } else if (event is KeyDownEvent &&
                                              _isDigitKey(event.logicalKey) &&
                                              otpControllers[actualIndex]
                                                  .text
                                                  .isNotEmpty) {
                                            // Handle digit key press
                                            if (actualIndex < 5) {
                                              otpFocusNodes[actualIndex + 1]
                                                  .requestFocus();
                                            }
                                          }
                                        },
                                        child: TextField(
                                          controller:
                                              otpControllers[actualIndex],
                                          focusNode: otpFocusNodes[actualIndex],
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          maxLength: 1,
                                          showCursor: false,
                                          onChanged: (value) =>
                                              _onOtpChanged(value, actualIndex),
                                          decoration: InputDecoration(
                                            hintText: '_',

                                            hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                102,
                                                112,
                                                133,
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsetsGeometry.zero,
                                            counterText: '',
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                  255,
                                                  208,
                                                  213,
                                                  221,
                                                ),
                                                width: 1,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                  255,
                                                  95,
                                                  233,
                                                  229,
                                                ),
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                          style: TextStyle(
                                            fontFamily: 'Ping',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),

                            // Confirm Button
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 25, 0),
                              child: SizedBox(
                                width: double.infinity,
                                child: SizedBox(
                                  height: 52,
                                  child: ElevatedButton(
                                    onPressed: isOtpComplete
                                        ? () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const NavBarMain(),
                                              ),
                                            );
                                          }
                                        : () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isOtpComplete
                                          ? Color.fromARGB(255, 18, 146, 149)
                                          : const Color.fromARGB(
                                              255,
                                              242,
                                              244,
                                              247,
                                            ),
                                      elevation: 0,

                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 0,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                          color: isOtpComplete
                                              ? Color.fromARGB(
                                                  255,
                                                  18,
                                                  146,
                                                  149,
                                                )
                                              : const Color.fromARGB(
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
                                      'Confirm',
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: isOtpComplete
                                            ? Colors.white
                                            : const Color.fromARGB(
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
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                              child: Text(
                                "Didn't receive the OTP code?",
                                style: TextStyle(
                                  fontFamily: 'Ping',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 71, 84, 103),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: SizedBox(
                                width: 75,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {},

                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 0,
                                      vertical: 0,
                                    ),
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    overlayColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadiusGeometry.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Icons/resendSymbol.svg',
                                        width: 15.833333015441895,
                                        height: 15,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Resend',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            18,
                                            109,
                                            113,
                                          ),
                                          fontFamily: 'Ping',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
