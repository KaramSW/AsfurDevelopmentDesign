import 'package:flutter/material.dart';
import 'package:flutter_projects/screens/account_subscreens/settings_sub_screens/privacy_policy.dart';
import 'package:flutter_projects/screens/account_subscreens/settings_sub_screens/terms_and_conditions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_projects/widgets/back_button.dart';
import 'package:flutter_projects/provider/google_sign_in.dart';
import 'package:flutter_projects/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 56, 24, 299),
          child: Column(
            children: [
              Row(
                children: [
                  CustomBackButtonIcon(),
                  SizedBox(width: 18),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontFamily: 'Ping',
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 24, 34, 48),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/Icons/account_icons/settings_icons/languageChange.svg',
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Language',
                    style: TextStyle(
                      fontFamily: 'Ping',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 95,
                    height: 36,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 208, 213, 221),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},

                      style:
                          ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ).copyWith(
                            overlayColor: WidgetStatePropertyAll<Color>(
                              Colors.transparent,
                            ),
                          ),
                      child: Row(
                        children: [
                          SizedBox(width: 11),
                          SvgPicture.asset(
                            'assets/Icons/account_icons/settings_icons/en_lan.svg',
                          ),
                          SizedBox(width: 8),
                          Text(
                            'EN',
                            style: TextStyle(
                              fontFamily: 'Ping',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 4),
                          SvgPicture.asset('assets/Icons/dropDownArrow.svg'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              _buildSettingScreenListItem(
                'assets/Icons/account_icons/settings_icons/sysNot.svg',
                'System Notifications',
                null,
              ),
              Container(
                width: double.infinity,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 242, 244, 247),
                ),
              ),

              SizedBox(height: 24),

              _buildSettingScreenListItem(
                'assets/Icons/account_icons/settings_icons/report.svg',
                'Report a problem',
                null,
              ),
              _buildSettingScreenListItem(
                'assets/Icons/account_icons/settings_icons/termsAndCond.svg',
                'Terms and Conditions',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsAndConditions()),
                ),
              ),
              _buildSettingScreenListItem(
                'assets/Icons/account_icons/settings_icons/privacyPolicy.svg',
                'Privacy Policy',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                ),
              ),

              Container(
                width: double.infinity,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 242, 244, 247),
                ),
              ),

              SizedBox(height: 24),

              _buildSettingScreenButton(
                'Delete Account',
                'assets/Icons/account_icons/settings_icons/deleteAcc.svg',
                () {},
                Color.fromARGB(255, 180, 35, 24),
                Colors.white,
                Color.fromARGB(255, 253, 162, 155),
              ),

              SizedBox(height: 16),

              _buildSettingScreenButton(
                'Log Out',
                'assets/Icons/account_icons/settings_icons/signOut.svg',
                () async {
                  final googleProvider = Provider.of<GoogleSignInProvider>(
                    context,
                    listen: false,
                  );
                  final prefs = await SharedPreferences.getInstance();

                  if (googleProvider.isUserLoggedIn) {
                    // Google logout
                    await googleProvider.logout();

                    // Backend logout API call (same as OTP)
                    final token = prefs.getString('authToken') ?? '';
                    var headers = {'Authorization': 'Bearer $token'};
                    var dio = Dio();
                    var response = await dio.request(
                      'https://staging.asfur.mvp-apps.ae/api/consumer/auth/log-out',
                      options: Options(method: 'POST', headers: headers),
                    );

                    if (response.statusCode == 200) {
                      print(
                        'This is the sucessful logout output${json.encode(response.data)}',
                      );
                    } else {
                      print('Error: ${response.statusMessage}');
                    }

                    await prefs.remove('isLoggedIn');
                    await prefs.remove('userData');
                    await prefs.remove('authToken');
                  } else if (prefs.getBool('isLoggedIn') ?? false) {
                    // OTP logout
                    final token = prefs.getString('authToken') ?? '';
                    var headers = {'Authorization': 'Bearer $token'};
                    var dio = Dio();
                    var response = await dio.request(
                      'https://staging.asfur.mvp-apps.ae/api/consumer/auth/log-out',
                      options: Options(method: 'POST', headers: headers),
                    );

                    if (response.statusCode == 200) {
                      print(json.encode(response.data));
                    } else {
                      print(response.statusMessage);
                    }

                    await prefs.remove('isLoggedIn');
                    await prefs.remove('userData');
                    await prefs.remove('authToken');
                  }

                  if (!context.mounted) return;

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
                Colors.white,
                Color.fromARGB(255, 217, 45, 32),
                Color.fromARGB(255, 217, 45, 32),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

Widget _buildSettingScreenListItem(
  String iconPath,
  String title,
  VoidCallback? onPressed,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 24),
    child: SizedBox(
      width: double.infinity,
      height: 24,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          elevation: 0,
          overlayColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, width: 24, height: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Ping',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 24, 34, 48),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildSettingScreenButton(
  String title,
  String iconPath,
  VoidCallback? onPressed,
  Color? textColor,
  Color? backgroundColor,
  Color borderColor,
) {
  return SizedBox(
    width: double.infinity,
    height: 36,
    child: ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: backgroundColor,
        elevation: 0,
        overlayColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Ping',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),

          const SizedBox(width: 4),

          SvgPicture.asset(iconPath, width: 20, height: 20),
        ],
      ),
    ),
  );
}
