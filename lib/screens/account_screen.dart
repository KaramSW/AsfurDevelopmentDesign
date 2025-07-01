import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'account_subscreens/settings.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
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
              const Text(
                'Account',
                style: TextStyle(
                  fontFamily: 'Ping',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 24, 34, 48),
                ),
              ),
              SizedBox(height: 64),
              SizedBox(
                width: 344,
                height: 74,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 74,
                      height: 74,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 234, 235, 236),
                            spreadRadius: 0,
                            blurRadius: 50,
                            offset: Offset(0, 13),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: user?.photoURL != null
                            ? Image.network(
                                user!.photoURL!,
                                fit: BoxFit.cover,
                                width: 74,
                                height: 74,
                              )
                            : SvgPicture.asset(
                                'assets/Icons/account_icons/defaultAvatar.svg',
                                fit: BoxFit.cover,
                                width: 74,
                                height: 74,
                              ),
                      ),
                    ),

                    SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.displayName ?? 'Guest User',
                          style: const TextStyle(
                            fontFamily: 'Ping',
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 24, 34, 48),
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: 213,
                          height: 20,
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
                                Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 18, 109, 113),
                                    fontFamily: 'Ping',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 10),
                                SvgPicture.asset(
                                  'assets/Icons/account_icons/editProfileArrow.svg',
                                  width: 15,
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48),
              _buildAccountScreenListItem(
                'assets/Icons/account_icons/requestsRocket.svg',
                'My Requests',
                null,
              ),
              _buildAccountScreenListItem(
                'assets/Icons/account_icons/myDocuments.svg',
                'My Documents',
                null,
              ),
              _buildAccountScreenListItem(
                'assets/Icons/account_icons/wallet.svg',
                'Wallet',
                null,
              ),
              _buildAccountScreenListItem(
                'assets/Icons/account_icons/favorites.svg',
                'Favorites',
                null,
              ),
              _buildAccountScreenListItem(
                'assets/Icons/account_icons/savedCards.svg',
                'Saved Cards',
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

              _buildAccountScreenListItem(
                'assets/Icons/account_icons/settings.svg',
                'Settings',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                ),
              ),
              _buildAccountScreenListItem(
                'assets/Icons/account_icons/customerSupport.svg',
                'Customer Support',
                null,
              ),
              _buildAccountScreenListItem(
                'assets/Icons/account_icons/aboutAsfur.svg',
                'About Asfur',
                null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildAccountScreenListItem(
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
