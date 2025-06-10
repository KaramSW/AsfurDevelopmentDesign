import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  bool isPhoneComplete = false;
  bool isTextFieldFocused = false;

  @override
  void initState() {
    super.initState();
    usernameController.addListener((_checkPhoneLength));
    phoneFocusNode.addListener((_onFocusChange));
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

  @override
  void dispose() {
    usernameController.removeListener(_checkPhoneLength);
    phoneFocusNode.removeListener(_onFocusChange);
    usernameController.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

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
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 75, 0, 60),
                    child: SvgPicture.asset(
                      'assets/Icons/logo.svg',
                      width: 130,
                      height: 130,
                    ),
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
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: -4,
                                left: -4,
                                right: -4,
                                //width: 351,
                                height: 60,
                                child: Container(
                                  // Adjust height as needed
                                  decoration: BoxDecoration(
                                    color: isTextFieldFocused
                                        ? Color.fromARGB(255, 219, 251, 250)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(
                                  0,
                                  0,
                                ), // Adjust the -10 value as needed
                                child: Container(
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
                                          focusNode: phoneFocusNode,
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
                              ),
                            ],
                          ),
                        ),

                        // Login Button
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 25, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: isPhoneComplete ? () {} : () {},

                              style: ElevatedButton.styleFrom(
                                backgroundColor: isPhoneComplete
                                    ? Color.fromARGB(255, 18, 146, 149)
                                    : const Color.fromARGB(255, 242, 244, 247),
                                elevation: 0,

                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                    color: isPhoneComplete
                                        ? Color.fromARGB(255, 18, 146, 149)
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
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
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

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                          child: Text(
                            'or Log in with',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                              //google Button
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle Google login action
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
                                      borderRadius: BorderRadius.circular(8),
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

                              SizedBox(width: 10),

                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle Google login action
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
                                      borderRadius: BorderRadius.circular(8),
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
